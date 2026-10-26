# Run the full ER2SQL experiment on another Windows laptop

This guide starts from two files shared with you: **the project code ZIP** and
**the dataset ZIP**. It covers the full PostgreSQL-backed experiment: both the
structured (diagram → IR → SQL) and direct (diagram → SQL) arms, across all
three tiers. The structural-only run is separate and is not a substitute for
this run.

The LLM provider is intentionally left open. Once the project owner selects a
model, use its exact provider model ID, endpoint, API-key environment variable,
and model settings in a model profile. Do not guess these values or reuse a
different model's profile. Model calls are paid by the owner of the API key.

## What you need

- The project code ZIP.
- The matching dataset ZIP, with the three ER-diagram tiers and the source SQL
  files. Use the exact dataset version supplied for the experiment.
- A Windows account with permission to install Python and PostgreSQL.
- The selected model's API key, obtained by the person who owns/pays for it.
- PostgreSQL 18.6, used by the verifier for the full run.
- Enough free disk space for the dataset, PostgreSQL, logs, and run artifacts.
- Once the LLM is selected: the project owner's matching model profile,
  readiness-pilot manifest, and final manifest, plus any required frozen audit
  and validation evidence not already present in the code ZIP. The two ZIPs
  alone may not include all model-specific paid-run evidence.

Never put an API key or database password in the ZIP, a shared config file, or
source control. Keep secrets in a local `.env` file on the laptop that runs the
experiment.

## 1. Extract both ZIP files

Extract the code ZIP to a local, non-OneDrive folder, for example:

```text
C:\er2sql
```

Extract the dataset ZIP to a separate local folder, for example:

```text
C:\er2sql-dataset
```

Avoid OneDrive-synced folders for the working copy and run outputs. Long runs
write many small files, and sync or disk-space problems can interrupt them.

Open PowerShell in `C:\er2sql` and check that this is the project root:

```powershell
Get-ChildItem
```

You should see `pyproject.toml`, `config`, `data`, `docs`, and `src`. In the
dataset folder, locate the image folders for `tier1`, `tier2`, and `tier3`, and
the SQL-reference folder. Their exact names may differ; write down their full
paths. Each schema image and its SQL reference must use the matching schema ID.

## 2. Install Python and ER2SQL

Install Python 3.11. In PowerShell at the project root:

```powershell
py -3.11 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -e .
```

If the virtual environment is not activated, use its Python executable for
commands instead:

```powershell
.\.venv\Scripts\python.exe -m pip install --upgrade pip
.\.venv\Scripts\python.exe -m pip install -e .
```

If PowerShell blocks activation, you can skip activation and continue using
`.\.venv\Scripts\python.exe`; changing the machine-wide execution policy is
not required. The editable install includes the supported OpenAI and Anthropic
clients. Other providers may require their documented project dependency; use
the provider setup instructions after the model is selected.

Check that the CLI is available:

```powershell
er2sql --help
```

If `er2sql` is not found, use `python -m er2sql.cli` in the commands below.

## 3. Configure the model profile and dataset paths

After the model is chosen, make a separate local profile under `config/models/`
and point each dataset path in that profile to the extracted dataset folders.
For example, if the selected profile is `config/models/example-model.yaml`:

```powershell
Copy-Item config/models/example-model.yaml config/models/example-model.local.yaml
notepad config/models/example-model.local.yaml
```

In the copied profile, set `dataset.tiers.tier1`, `tier2`, and `tier3` paths.
Set each `diagrams_dir` to that tier's image folder, and set `sql_dir` to the
source SQL folder. Example only:

```yaml
dataset:
  tiers:
    tier1:
      diagrams_dir: C:/er2sql-dataset/erd_tier1
      sql_dir: C:/er2sql-dataset/extracted_ddl_filtered
    tier2:
      diagrams_dir: C:/er2sql-dataset/erd_tier2
      sql_dir: C:/er2sql-dataset/extracted_ddl_filtered
    tier3:
      diagrams_dir: C:/er2sql-dataset/erd_tier3
      sql_dir: C:/er2sql-dataset/extracted_ddl_filtered
```

Use forward slashes in YAML paths. Update only local paths and the selected
provider/model values needed for this laptop. The experiment manifest points
to this model profile, so the path edits must be made here (not only in
`config/config.yaml`). Preserve frozen prompts, protocol, split, and experiment
settings. Do not change schema IDs to make a run pass.

The selected model must be vision-capable for Module 2 and the direct arm.
Module 3 can use the same model or a separately declared text model only if
the experiment owner has frozen that choice. Keep the direct and structured
comparison settings aligned with the locked protocol.

## 4. Configure the model key and profile

After the model is chosen:

1. Get the API key from that provider's official account page. Do not share the
   key with the friend running the laptop if the owner can enter it locally.
2. Copy the example environment file and edit the local copy:

   ```powershell
   Copy-Item .env.example .env
   notepad .env
   ```

3. Fill only the provider key variable referenced by the selected profile's
   `api_key_env` field. Keep the key out of screenshots and chat. Confirm
   `.env` remains ignored by Git.
4. Use the model profile supplied by the project owner. It must set the exact
   provider model ID, endpoint/client type, key variable, vision support,
   token limit parameter, and frozen generation settings. Do not guess these
   values, copy a model ID from an example, or assume two providers use the
   same API format.
5. Record the model's official ID and the date its provider pricing was
   checked. A manifest's expected cost is only an estimate, never a spending
   cap. Turn off automatic top-ups at the provider if a hard prepaid balance
   is desired, and set a provider-side spend limit if offered.

Do not run paid requests until the profile and manifests identify the same
model and the API key is present locally.

## 5. Install and provision PostgreSQL for the full run

Install PostgreSQL 18.6 and make sure its Windows service is running. Then
create the local `.env` file entries required by
[`POSTGRES_PAPER_RUN_SETUP.md`](POSTGRES_PAPER_RUN_SETUP.md):

- `POSTGRES_PASSWORD`: the local PostgreSQL administrator password used only
  for one-time provisioning.
- `ER2SQL_VERIFY_DB_PASSWORD`: a strong password for the restricted experiment
  role.

Follow that document to provision the dedicated `er2sql_paper_verify` database
and non-superuser `er2sql_runner` role:

```powershell
python scripts/postgres/provision_paper_verification.py
```

The experiment must connect as `er2sql_runner`, not the PostgreSQL
superuser. Keep both passwords private. If provisioning reports that the
database or role already exists, stop and inspect the existing setup; the
script intentionally does not overwrite or drop database objects.

## 6. Check the supplied experiment inputs

Before any paid call, confirm the ZIP contains the frozen experiment inputs
referenced by the manifests, including:

- the v6 protocol and eligible split;
- the reference-status manifest;
- the oracle and contamination audit records;
- evaluator-validation evidence;
- the readiness-pilot manifest/configuration and its output, if already
  completed for this exact model and configuration.

The full-run manifest is deliberately strict: a fresh passing pilot must match
the final run's model, prompts, source/configuration, and split. A pilot for a
different LLM does not qualify. If required files are missing or the manifest
reports a hash/evidence mismatch, do not edit hashes or bypass the check. Ask
the project owner to provide the matching frozen files or prepare valid fresh
evidence for the selected model. A dry run is a preflight, not proof that every
paid-run gate has passed.

## 7. Prepare and run the readiness pilot

Once the model is chosen, use the model-specific v6 pilot and final manifests
supplied by the project owner. They must point to the matching model profile
and use distinct output folders. Keep all frozen protocol, split, audit, arm,
and tier values unchanged. The pilot output must be the path referenced by
`pilot_validation` in the final manifest. Do not create a final manifest by
blindly copying a different model's file: its model name, cost estimate,
profile, and pilot evidence must all match.

Preview the pilot first:

```powershell
er2sql experiment --manifest config/experiment.paper-pilot-v6-<model>.yaml --dry-run
```

Replace `<model>` with a simple filename suffix for the selected model. Check
that all three tiers are found, the pilot schema count matches its manifest,
and both `structured` and `direct` arms are listed. Confirm there are no
missing-file, database, config, or hash errors. The dry run makes no model
calls.

Then run the paid pilot:

```powershell
er2sql experiment --manifest config/experiment.paper-pilot-v6-<model>.yaml --resume
```

Review its generated report and `pilot_validation.json`. Continue only if the
project's frozen readiness gates pass. In the v6 protocol, a model needs at
least a 20% compile rate in one arm on the readiness pilot to enter the final
comparison. The pilot also measures provider behavior and informs a cost
estimate. Do not revise prompts or settings after seeing pilot results and
then label the changed configuration as the same locked run.

## 8. Preview and run the full evaluation

The full run uses both arms on the locked eligible set: **264 schemas per tier**
across `tier1`, `tier2`, and `tier3`. That is 792 schema-tier cases per arm
(1,584 arm artifacts total), before infrastructure retries. Structural-only
schemas are not included in this PostgreSQL-backed result.

Preview the final manifest:

```powershell
er2sql experiment --manifest config/experiment.paper-final-v6-<model>.yaml --dry-run
```

Check that it reports the selected model, all three tiers, both arms, 264
schemas per tier, the expected pilot-validation path, and the intended local
output folder. Resolve every validation error before proceeding. Do not run if
the model/profile differs from the passing pilot or if selected counts are
unexpected.

Start the full paid run:

```powershell
er2sql experiment --manifest config/experiment.paper-final-v6-<model>.yaml --resume
```

Keep the same manifest and output folder for the entire run. Do not launch a
second copy against that folder. If the process is interrupted, fix the cause
and rerun the same command with `--resume`; completed artifacts are reused
when their provenance still matches.

## 9. Keep the laptop running safely

- Keep it plugged into power and connected to the internet.
- Set Windows sleep to **Never** while plugged in, and check the lid-close
  action if the laptop will be closed.
- Keep several GB of free disk space. Logs, raw outputs, and database activity
  need local storage even when the dataset ZIP is elsewhere.
- Keep the terminal open while the process runs. Check it periodically for a
  fatal error or disk-space problem; no need to watch every request.
- Avoid editing configs, prompts, manifests, or the dataset during a run.

## 10. Confirm completion and retain results

The runner saves per-schema outputs, attempt records, run metadata, and reports
under the manifest's `output_root`. Keep the complete output folder together
with the exact manifests and model profile used. Do not share `.env`.

Confirm the final report and run summary show completion for all three tiers
and both arms, and that the planned schema counts are complete. Keep the
provider billing/usage export separately to reconcile actual charges; token
estimates in the run files are not invoices.

The PostgreSQL-backed full results are the headline execution results. If a
structural-only experiment is also run, report it in a separate section and do
not pool its schemas or metrics with the full-run results.

## If something fails

- **Missing Python package:** from the project root run
  `python -m pip install -e .` using the same Python environment that runs
  `er2sql`.
- **Missing dataset/schema count mismatch:** recheck all three image paths, SQL
  path, and that the dataset ZIP is the exact supplied version.
- **API authentication/model error:** confirm the local key variable matches
  `api_key_env`, the key is active, and the configured model ID is enabled for
  that account. Never paste the key into the terminal log or chat.
- **PostgreSQL connection/permission error:** confirm the service is running,
  `.env` has the correct database-role password, and the profile uses
  `er2sql_runner` against `er2sql_paper_verify`.
- **Disk full or interruption:** make space without deleting run artifacts,
  then resume with the exact same manifest and output root.
- **Hash, audit, or readiness-gate error:** stop. Do not change the hash or
  waive the gate; contact the project owner for the correct frozen evidence.

Related project instructions: [`POSTGRES_PAPER_RUN_SETUP.md`](POSTGRES_PAPER_RUN_SETUP.md),
[`PAID_RUN_READINESS.md`](PAID_RUN_READINESS.md), and the frozen
[`PAPER_EXPERIMENT_PROTOCOL_V6.md`](PAPER_EXPERIMENT_PROTOCOL_V6.md).
