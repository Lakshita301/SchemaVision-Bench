# Prospective split amendment for contamination-family overlap

Approved on 9 October 2026, before paid model outputs. The original
`config/paper_splits.json` is preserved unchanged. The amended full population
is `config/paper_splits_v5.json`; the reference-eligible subset is separately
recorded in `config/paper_splits_v5_eligible.json`.

## Why the split changed

The original split had five likely related schema families in more than one
split. Local SQL comparison found overlapping table sets and, in several
cases, matching table definitions. Six same-repository overlaps were first
flagged; the Activiti pair has disjoint table sets and is treated as separate
modules. These are local source-file findings, not a claim about model training
data.

| Related family | IDs | New split |
|---|---|---|
| Zabbix schema revisions | `schema_0043`, `schema_0560` | Development |
| webnutdesign database versions | `schema_0053`, `schema_1053_675929` | Development |
| AnnotationDbi organism schemas | `schema_0609`, `schema_0704`, `schema_0793` | Pilot |
| dotCMS Quartz schemas | `schema_0456`, `schema_1106_148168` | Pilot |
| Hive metastore versions | `schema_1212_302296`, `schema_1295_618406` | Pilot |

The unrelated Activiti modules remain in pilot/final:
`schema_0682` (identity tables) and `schema_1265_471935` (engine tables).

## Result

- All 714 schema IDs are retained; no SQL or diagram files were edited.
- Full source split: **78 development, 24 pilot, 612 final**.
- The existing v4 reference decisions are re-partitioned, not re-scored:
  **76 development, 11 eligible pilot, 264 eligible final**.
- Three previously eligible final IDs move into pilot:
  `schema_0456`, `schema_0704`, and `schema_0793`. The fourth pilot move,
  `schema_1295_618406`, was already reference-ineligible. No eligible final ID
  moved into development.
- On the amended full split, the source-SQL scan hashes **714/714** files and
  finds **zero exact-SQL duplicates** and **zero remaining cross-split family
  candidates**.

The refreshed [contamination audit](dataset_contamination_v3.md) is still
**incomplete and blocked for paid runs** because provenance, schema identity,
and risk reviews are not complete for all 714 records. This amendment resolves
the split-family finding only; it does not claim the schemas are absent from
model pretraining data.

The orchestrator now accepts separate files for the full contamination split
and reference-eligible scoring split. Paid manifests must pin both, along with
the complete audit report hash.
