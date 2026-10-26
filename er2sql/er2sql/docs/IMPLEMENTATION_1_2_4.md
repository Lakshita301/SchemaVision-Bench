# Reference validation, evaluator controls and reproducibility

Implemented 1 October 2026. No LLM calls or paid pilots. Experimental model choices and additional keys remain deferred.

Update 2 October: items 2 and 4 have been strengthened and locally validated.
See [evaluator validation and its limits](EVALUATOR_VALIDATION.md) and
[offline reproduction instructions](REPRODUCIBILITY.md). The account below records
the earlier implementation; current evidence has 52 passing tests, nine mutation
variants, and fifteen additional independent controls. Missing rejection metadata
now fails closed; restricted deletes have FK attribution, deferred constraints are
checked, and composite SET NULL tests every column. No dataset/tier changes were made.

Version-2 archives validate source/prompt/split/input bytes against the frozen plan,
retain CSVs and manifest-selected evidence, and list missing outcomes. Archive creation
explicitly disables dotenv loading. A tested offline replay command verifies source
identity and the exact schema/tier matrix before reaggregating saved results, with
zero DB/provider calls. Preparation-only archives cannot be replayed as completed runs.

## 1. Source-based reference normalization

`reference_normalization.py` produces separate PostgreSQL **candidates**, not automatically approved ground truth. It protects strings/comments/quoted identifiers, records transformations, preserves unchanged source bytes, and refuses to overwrite a previous candidate directory. It never uses predicted IR or generated model SQL.

Current candidates: `data/reference_candidates/v2/pilot` (20 IDs) and `data/reference_candidates/v2/final` (618 IDs). Each directory contains SQL files, `normalization_manifest.json` and `NORMALIZATION_REVIEW.md`. Original dataset and frozen selections were not changed. The older v1 candidates remain available as preparation history; v2 is the current set.

The supported candidate transformations include backtick/bracket quoting, integer display widths, selected type spellings and physical table options. Type/domain and collation differences require review. Missing types, contradictory table variants, unsigned/identity semantics, ENUM/SET and unsupported syntax are flagged instead of invented or silently removed. Source/candidate bytes, normalizer implementation and parser implementation are hashed.

Reference audits run the same planned gold tests against the candidate and require matching semantic-review records for changed files. Compilation alone is insufficient. Reviewed references must preserve the intended relational semantics and still pass every generated test without warnings. The original-source and candidate audits are separate, so experimental scores cannot be confused with normalization diagnostics.

See [reference policy](REFERENCE_REVIEW_POLICY.md), [pilot candidates audit](audits/pilot_candidate_oracle.md) and [final candidates audit](audits/final_candidate_oracle.md). Unapproved candidates are never installed into experiment configuration automatically.

## 2. Evaluator validation

Added or strengthened:

- Composite UNIQUE parsing, test generation and structural scoring.
- A deterministic bounded CHECK witness solver for comparisons, IN, BETWEEN, AND/OR and literal/column operands. No Python eval or model calls. A negative witness must violate the target CHECK while satisfying the other supported CHECKs.
- CHECK-compatible fixtures for other constraint tests, while preserving forced negative values and synthesized foreign keys.
- Explicit warnings for unsupported syntax, unresolved columns or no isolated witness. Finite search is capped at 4,096 assignments; it is not a complete constraint solver.
- PostgreSQL rejection attribution to the target table, columns, constraint kind and FK referenced columns/table, not SQLSTATE alone. Ordinary UNIQUE indexes also count as uniqueness enforcement. Older saved verifications require local backfill before being considered current.
- Parser regression coverage for ordinary names such as `checkin_interval`, `unique_code` and `key`, which must not be mistaken for constraint/index keywords.
- PostgreSQL version, encoding and statement timeout captured in reference audits.

The local mutation suite starts from an independently hand-authored reference, verifies that it passes, then introduces nine defects: remove PK, NOT NULL, UNIQUE, composite UNIQUE, CHECK or FK; point an FK at the wrong referenced column; change CASCADE to RESTRICT; and make a CHECK over-restrictive. **All nine are detected**, and the same-SQLSTATE/wrong-UNIQUE-constraint control also passes.

The test suite currently has **41 passing tests**, including real PostgreSQL integration. See [mutation report](audits/evaluator_mutations.md). This demonstrates the tested cases, not universal semantic equivalence. Cascades and older manually constructed tests without target-column metadata still have narrower attribution coverage; corpus oracle warnings remain blocking. Additional complex SQL forms still require support or an explicit eligibility policy.

Paper manifests now require current-source mutation evidence as well as passing reference evidence before starting paid execution. Changing the implementation invalidates those gates.

Local commands:

```powershell
$env:ER2SQL_RUN_POSTGRES_INTEGRATION='1'
python -m unittest discover -s tests -q
python -m er2sql.module7_evaluation.mutation_validation
```

These commands do not invoke real model providers. Retry tests use mocks; their simulated HTTP errors are expected test output.

## 4. Reproducibility bundle

`reproducibility.py` creates an explicit-allowlist ZIP snapshot containing:

- source code, prompts, tests and dependency declarations;
- the resolved experiment plan, redacted model configurations and split;
- Python/platform/package-version inventory;
- selected input SQL/images when `--include-inputs` is used;
- candidate reference files when `--reference-candidates` is supplied;
- audit and mutation evidence;
- per-schema results, attempt histories, API ledgers, reports and run status when `--include-results` is used on an existing experiment.

The archive records SHA-256 for every included file, verifies its own inventory immediately, and refuses overwrite. It never reads `.env` or records process environment variables. Dependency versions are an environment inventory, not a portable cross-platform lock. Hash verification checks integrity, not publisher authenticity. Review dataset licensing, local paths and raw provider responses before any public release.

Example local-only freeze:

```powershell
python -m er2sql.module7_evaluation.reproducibility --manifest config/experiment.paper-pilot-v2.yaml --output outputs/reproducibility/pilot-preparation.zip --include-inputs --include-results --reference-candidates data/reference_candidates/v2/pilot
python -m er2sql.module7_evaluation.reproducibility --verify outputs/reproducibility/pilot-preparation.zip
```

Use a new output filename for each version. A preparation bundle is a snapshot of the current state, including failed readiness gates—not approval to run the benchmark. Archive another version after reference review and again after actual experiments. Offline evaluation of saved per-schema artifacts remains available through Module 7 without regeneration; restore the corresponding source/config/environment snapshot when reproducing historical scores.

## Current boundary

Both preparation snapshots have now been created and verified: pilot (207 inventory files) and final (4,393 inventory files), including their selected original input bytes. Archive hashes and verification commands are recorded in [snapshot inventory](../outputs/reproducibility/README.md). The raw-source and v2 candidate audits have completed; their gates remain blocked, not waived.

The implementations and local validation above are complete for their declared scope. Full-corpus certification is **not** complete: original and candidate audits still report unresolved source/dialect/fixture cases. No schemas were silently excluded, no review approvals were fabricated, and no paid/model runs were started. The latest counts are in [paid-run readiness](PAID_RUN_READINESS.md).
