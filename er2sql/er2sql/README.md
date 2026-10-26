# er2sql — ER Diagram → SQL DDL Multi-Agent Pipeline

This repository implements the ER2SQL research pipeline and evaluation harness:

Local pre-run validation and reproducibility tooling: [implementation status](docs/IMPLEMENTATION_1_2_4.md). Paid runs remain blocked until the reference and evaluator gates pass; reference candidates are not automatically approved ground truth.

```
ER Diagram Image
      |
      v
Module 2: ER Diagram Parsing Agent   (vision LLM, sees the image)
      |
      v
Canonical JSON IR
      |
      v
Deterministic schema/IR validation   (no LLM involved)
      |
      v
Module 3: SQL Generation Agent       (text LLM, sees ONLY the JSON IR)
      |
      v
SQL DDL
```

**Module 1** (DDL Parser + ER Renderer, i.e. turning your ground-truth SQL
into the ER diagram PNGs) is **not implemented here** — you already have
that output (three tiers of ER diagrams + matching ground-truth SQL) and
this project just needs to be pointed at it.

**Modules 4–7** provide constraint-test generation, PostgreSQL verification,
the direct image-to-SQL baseline, and experiment orchestration/evaluation.

**Critical architectural constraint, enforced in code, not just by
convention:** Module 3 (`src/er2sql/module3_generation/agent.py`) receives
only the canonical JSON IR. Its function signature has no `image_path`
parameter, and the LLM client method it calls (`LLMClient.complete_text_only`)
has no image parameter at all — that method is only ever used by Module 3.
The image only ever reaches `LLMClient.complete_with_image`, which is only
ever called from Module 2.

---

## 1. Project structure

```
er2sql/
├── README.md                      <- you are here
├── pyproject.toml                 <- installable package (`pip install -e .`)
├── requirements.txt                <- same deps, if you don't want to install the package
├── .env.example                   <- copy to .env and fill in API keys
├── .gitignore
├── config/
│   └── config.example.yaml        <- copy to config.yaml and edit
├── data/                          <- put your ER diagrams + ground-truth SQL here
│   ├── README.md
│   ├── tier1/{diagrams,ground_truth_sql}/
│   ├── tier2/{diagrams,ground_truth_sql}/
│   └── tier3/{diagrams,ground_truth_sql}/
├── outputs/                        <- pipeline writes results here (created for you)
└── src/er2sql/
    ├── ir_schema.py                <- canonical JSON IR: the JSON Schema definition
    ├── ir_validator.py             <- strict JSON-Schema + semantic (referential) validation
    ├── config.py                   <- loads config.yaml + .env into typed config objects
    ├── llm_client.py               <- LLM client abstraction (OpenAI-compatible)
    ├── dataset.py                  <- pairs diagrams with ground-truth SQL by filename
    ├── module2_parsing/
    │   ├── prompts.py               <- Parsing Agent system/user prompts
    │   └── agent.py                 <- image -> canonical JSON IR (with validation retries)
    ├── module3_generation/
    │   ├── prompts.py               <- Generation Agent prompts (IR-only, no image)
    │   └── agent.py                 <- canonical JSON IR -> SQL DDL (no image parameter)
    ├── pipeline/
    │   └── runner.py                <- orchestrates Module 2 -> validate -> Module 3
    ├── utils/
    │   ├── image_utils.py           <- base64-encodes diagram images for the vision call
    │   └── io_utils.py              <- JSON/text IO, code-fence stripping
    └── cli.py                       <- run, baseline, evaluate, validate-ir commands
```

---

## 2. Install

Requires Python 3.10+.

```bash
cd er2sql
python -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate

pip install -e .
```

(If you'd rather not install the package, `pip install -r requirements.txt`
works too — you'll then run the CLI as `python -m er2sql.cli ...` from
inside `src/`, or with `PYTHONPATH=src` set. `pip install -e .` is simpler
and is assumed in the rest of this README.)

---

## 3. Add your API keys

```bash
cp .env.example .env
```

Open `.env` and fill in the key(s) for whichever provider(s) you plan to
use. You don't need every key in the file — only the ones referenced by
`api_key_env` in your `config.yaml` (next step). The CLI loads `.env`
automatically; you do not need to `export` anything manually.

---

## 4. Configure which models to use

```bash
cp config/config.example.yaml config/config.yaml
```

Open `config/config.yaml` and edit the `llm.module2_parsing` and
`llm.module3_generation` blocks:

```yaml
llm:
  module2_parsing:
    model: gpt-4o-mini          # MUST be a vision-capable model (it sees the diagram)
    api_base: null              # null = provider's default endpoint
    api_key_env: OPENAI_API_KEY # name of the env var in your .env file
    temperature: 0.2
    max_retries: 3

  module3_generation:
    model: gpt-4o-mini          # text-only model (never sees the diagram)
    api_base: null
    api_key_env: OPENAI_API_KEY
    temperature: 0.2
    max_retries: 3
```

The client is a thin wrapper over the OpenAI Python SDK's chat-completions
call, so anything exposing an OpenAI-compatible endpoint works by setting
`api_base` — for example:

- **OpenAI** directly: leave `api_base: null`.
- **Gemini**: `api_base: https://generativelanguage.googleapis.com/v1beta/openai/`
  with `api_key_env: GEMINI_API_KEY`.
- **OpenRouter** (one key, many models — Qwen, GLM, Gemma, Gemini, etc.):
  `api_base: https://openrouter.ai/api/v1` with `api_key_env: OPENROUTER_API_KEY`,
  and `model:` set to OpenRouter's model slug (e.g. `qwen/qwen-2.5-72b-instruct`).

Commented examples for both are already in `config.example.yaml`.

You can use two *different* providers/models for Module 2 vs Module 3 —
that's normal and expected (Module 2 needs vision, Module 3 doesn't).

---

## 5. Wire in your data (ER diagrams + ground-truth SQL)

You said you have 3 folders of ER diagrams (one per tier) and separate
folders of ground-truth SQL, already labeled to correspond to each other.

**The pipeline matches a diagram to its SQL file by filename stem** (the
part before the extension) — it does not care about the folder name, only
that the stem matches. So if your files look like:

```
your_diagrams_tier1/schema_0001.png
your_sql_ground_truth/schema_0001.sql
```

that's already enough — `schema_0001` matches `schema_0001`.

You have two options for wiring these in:

### Option A — point config.yaml directly at your existing folders (recommended)

No copying needed. Edit the `dataset.tiers` section of `config/config.yaml`:

```yaml
dataset:
  tiers:
    tier1:
      diagrams_dir: /absolute/path/to/your/tier1_diagrams
      sql_dir: /absolute/path/to/your/ground_truth_sql
    tier2:
      diagrams_dir: /absolute/path/to/your/tier2_diagrams
      sql_dir: /absolute/path/to/your/ground_truth_sql
    tier3:
      diagrams_dir: /absolute/path/to/your/tier3_diagrams
      sql_dir: /absolute/path/to/your/ground_truth_sql
```

Relative paths are also fine (resolved relative to wherever you run the
`er2sql` command from). If all three tiers share one ground-truth SQL
folder (since the underlying schema is identical across tiers, per the
research plan), just point all three `sql_dir` entries at that same
folder — that's expected and correct.

### Option B — copy/symlink your files into `data/`

```bash
# example using symlinks so you don't duplicate large image sets
ln -s /path/to/your/tier1_diagrams data/tier1/diagrams
ln -s /path/to/your/tier1_ground_truth_sql data/tier1/ground_truth_sql
ln -s /path/to/your/tier2_diagrams data/tier2/diagrams
ln -s /path/to/your/tier2_ground_truth_sql data/tier2/ground_truth_sql
ln -s /path/to/your/tier3_diagrams data/tier3/diagrams
ln -s /path/to/your/tier3_ground_truth_sql data/tier3/ground_truth_sql
```

`config/config.example.yaml` already points at `data/tier1/diagrams`,
`data/tier1/ground_truth_sql`, etc., so if you use Option B you don't need
to edit the `dataset.tiers` section at all.

### Sanity-check the wiring before spending API calls

Nothing here calls an LLM — it's pure filesystem matching:

```bash
python -c "
from er2sql.dataset import discover_tier_dataset
r = discover_tier_dataset('data/tier1/diagrams', 'data/tier1/ground_truth_sql', 'tier1')
print(r.summary())
print('first 3 matched:', [rec.schema_id for rec in r.records[:3]])
"
```

If `unmatched_images` or `unmatched_sql` in the summary is non-zero, check
your filenames — the stems must match exactly (case-sensitive).

---

## 6. Run the pipeline

Run one tier:

```bash
er2sql run --config config/config.yaml --tier tier1
```

Run one tier, but only the first 5 schemas (cheap smoke test before a full
run):

```bash
er2sql run --config config/config.yaml --tier tier1 --limit 5
```

Run all tiers defined in `config.yaml`:

```bash
er2sql run-all --config config/config.yaml
```

Validate a standalone IR JSON file against the schema (useful for
debugging Module 2 output by hand, no LLM call involved):

```bash
er2sql validate-ir --ir-file outputs/tier1/some_schema.json
```

Add `-v` before the subcommand for debug-level logging, e.g.
`er2sql -v run --config config/config.yaml --tier tier1`.

If you didn't `pip install -e .`, replace `er2sql` above with
`python -m er2sql.cli` and make sure `src/` is on your `PYTHONPATH`
(e.g. run from inside `src/`, or `export PYTHONPATH=src`).

---

## 7. Where your outputs go

Everything lands under `outputs/<tier>/` (or wherever `output.base_dir` /
`--output-dir` points):

```
outputs/
  tier1/
    summary.json                 <- counts: parsed OK, validation failed, SQL generated OK, etc.
    generated_sql/
      schema_0001.sql            <- raw generated SQL DDL, one file per successful schema
      ...
    schema_0001.json             <- full per-schema record (see below)
    schema_0002.json
    ...
```

Each per-schema JSON file (`outputs/<tier>/<schema_id>.json`) contains:

```json
{
  "schema_id": "schema_0001",
  "tier": "tier1",
  "image_path": "...",
  "sql_path": "...",
  "ground_truth_sql": "... the SQL text you already had ...",
  "module2_parsing": {
    "success": true,
    "ir": { "...": "canonical JSON IR" },
    "validation": { "is_valid": true, "schema_errors": [], "semantic_errors": [] },
    "raw_responses": ["...every raw LLM response across validation retries..."],
    "llm_attempts_used": 1,
    "validation_attempts_used": 1,
    "error_message": null
  },
  "module3_generation": {
    "success": true,
    "sql_ddl": "CREATE TABLE ...",
    "raw_response": "...",
    "llm_attempts_used": 1,
    "error_message": null,
    "dialect": "postgres"
  }
}
```

`module3_generation` is `null` if Module 2 never produced a valid IR for
that schema (there's nothing for Module 3 to run on).

`summary.json` per tier looks like:

```json
{
  "tier": "tier1",
  "total_records": 20,
  "parsing_success": 18,
  "parsing_failed": 2,
  "generation_success": 18,
  "generation_failed": 0,
  "skipped_generation_due_to_invalid_ir": 2,
  "unmatched_images": [],
  "unmatched_sql": [],
  "started_at": "...",
  "finished_at": "..."
}
```

### Module 7: paper-level evaluation

Module 7 reads the per-schema JSON artifacts already produced by the structured
pipeline or Module 6. It does not call an LLM and does not connect to
PostgreSQL. It writes aggregate metrics, per-schema CSV data, tier and
complexity breakdowns, structural precision/recall/F1, constraint-test
category rates, confidence intervals, a run manifest, and a Markdown report.

Aggregate the structured Modules 2--5 artifacts after a run:

```powershell
er2sql evaluate --config config/config.yaml --run-name structured-final --common-only
```

Aggregate Module 6 artifacts and compare them with a structured report:

```powershell
er2sql evaluate --config config/config.yaml `
  --results-dir outputs/module6_direct_baseline `
  --arm direct `
  --run-name direct-final `
  --compare-dir outputs `
  --compare-arm structured
```

By default, reports are written below
`outputs/module7_evaluation/<run-name>/`. Use `--report-dir` when each model
has its own result directory. The evaluator expects existing artifacts; it is
safe to prepare and review the command before any model run.

For a cross-model paper table, repeat `--model-dir` once per model:

```powershell
er2sql evaluate --config config/config.yaml --run-name model-panel `
  --model-dir mistral=outputs/mistral `
  --model-dir kimi=outputs/kimi `
  --model-dir gpt-mini=outputs/gpt-mini
```

### Manifest-driven experiments

For pilot and final paper runs, use the Module 7 experiment orchestrator to
freeze the model x arm x tier matrix in one YAML file. Start from
`config/experiment.example.yaml`; give each model its own normal pipeline
config file so provider settings and API-key environment-variable names stay
separate and auditable.

Preview the exact schema selection, output paths, and nominal call range. A
dry run performs no model or database calls and writes no experiment output:

```powershell
er2sql experiment --manifest config/experiment.yaml --dry-run
```

Execute the frozen matrix and resume safely after interruptions:

```powershell
er2sql experiment --manifest config/experiment.yaml --resume
```

Results are isolated under
`<output_root>/results/<model>/<direct|structured>/`. The command writes
`resolved_manifest.json` before execution, updates `run_status.json` after
each model/arm/tier cell, and writes Module 7 reports below
`<output_root>/reports/`. The resolved manifest records the exact selected
schema IDs, secret-free model configs, prompt hashes, output paths, and nominal
call counts. The orchestrator runs cells sequentially to keep rate-limit and
cost behavior predictable.

For the paid/final matrix, give every model its own file under
`config/models/`, set `require_complete_model_metadata: true`, and set
`prompts_frozen: true`. Strict validation requires explicit model revision,
endpoint, vision declaration, generation limits, pricing, JSON mode,
retry/backoff, and retry-cost protection. Exact prompt source snapshots are
stored under `<output_root>/provenance/prompts/`. After evaluation,
`reports/pilot_validation.{json,md}` records artifact completeness, vision/JSON
success, truncation, provider usage, retry/rate-limit events, estimated cost,
and whether resume behavior has been observed.

The two arms are:

- `direct`: Module 6 image-to-SQL baseline;
- `structured`: Modules 2-5 (image to validated IR to SQL to execution verification).

---

## 8. Remaining experimental work

- Module 7 aggregation is implemented, but final multi-model runs,
  ablations, and paper tables have not been executed.
- Provider token/cost fields are aggregated when present; provider APIs may
  omit usage for failed requests.
- Requests remain sequential. Retryable timeouts, connection failures, rate
  limits and server errors use configurable exponential backoff, jitter,
  `Retry-After`, and an estimated retry-cost ceiling. Permanent client/auth
  errors stop immediately.

These are experiment/deployment concerns rather than changes to the locked
Module 2 image → IR → Module 3 IR-only architecture.

---

## 9. Troubleshooting

- **`Config error: Environment variable 'OPENAI_API_KEY' is not set`** —
  you either didn't create `.env` from `.env.example`, or the variable name
  in `.env` doesn't match `api_key_env` in `config.yaml`.
- **`Tier 'tierX' is not defined in config.yaml`** — add it under
  `dataset.tiers` in `config.yaml`.
- **High `parsing_failed` count** — open one of the failed schema's
  per-schema JSON file and read `module2_parsing.validation.schema_errors`
  / `semantic_errors` plus `raw_responses` to see exactly what the model
  returned and why it didn't validate. The pipeline already retries with
  the validation errors fed back to the model (`max_validation_retries=2`
  by default, in `pipeline/runner.py` → `parse_er_diagram`); if it's still
  failing consistently, the system prompt in
  `module2_parsing/prompts.py` may need tightening for your diagram style.
- **Rate limit errors** — the client honors `Retry-After` and applies
  exponential backoff. Review the persisted retry events, adjust the retry
  ceiling/delays, or reduce request volume with `--limit` while iterating.
