# ER2SQL Final-Paper Metrics: Current Status and Required Updates

## Protocol v3 update — 6 October 2026

The v3 amendment in [PAPER_EXPERIMENT_PROTOCOL_V3.md](PAPER_EXPERIMENT_PROTOCOL_V3.md) is authoritative for future runs; older content below records earlier protocol/status snapshots. Primary behavioral CER now uses all planned gold constraint tests, assigning zero passes when parsing, generation, or DDL fails. Macro planned-denominator CER and planned all-test/valid-operation/invalid-operation rates are also reported; execution-conditional rates are secondary. Truncated-output schema IDs are excluded consistently across a model's arms and tiers and logged with stage/tier reasons.

The saved Mistral pilot was recalculated with no model calls using the paired-cell rule. Two `(schema,tier)` cells are excluded from both arms; unaffected tiers remain. Its primary planned CER is 5.63% Structured vs 0.30% Direct. The Groq/Qwen pilot has truncation in all 16 paired cells, so its v3 rates are **N/A**, not zero. See the [Mistral recalculation](../outputs/experiments/mistral-small4-provider-pilot10-20261005/reports/protocol-v3-recalculated/structured/evaluation_report.md) and [Qwen recalculation](../outputs/experiments/groq-qwen38-tier23-8-paper-v2/reports/protocol-v3-recalculated/structured/evaluation_report.md).

The unified development registry is [development_schemas.json](../config/development_schemas.json) (86 IDs); the new split is [paper_splits_v3.json](../config/paper_splits_v3.json) with 20 fresh pilot and 608 final schemas. Two-arm final planning is at most 5,472 calls and about $17.09 by token-scaling the Mistral pilot, a rough model-specific projection only. Before a v3 paid pilot, refresh evaluator mutation evidence and complete the exact v3 pilot PostgreSQL reference audit. No LLM calls were made for this update.

Last reviewed: 6 October 2026 (v3 update above; older status snapshots are historical)

Latest minimal update: `target_attribution_v6` adds cascade preconditions,
NULL-safe row matching and separately recorded timeout/cancellation diagnostics.
76 tests and all mutation controls pass locally. No model calls or dataset
changes. See [the update](REFERENCE_COMPATIBILITY_20261004.md).
The corpus counts below are v5 history, **not current launch clearance**; fresh
reference evidence is required after resolving the remaining reference blockers.

Latest: [reference conversion and validation report](REFERENCE_COMPATIBILITY_20261004.md).
All 638 selected reference candidates have separate source/candidate hashes and
conversion/blocker records. The launch gate remains blocked, not waived by
successful compilation. 72 local tests and all mutation controls pass under
`target_attribution_v5`. No LLM runs, original-dataset changes or exclusions.
The 3 October and earlier counts below are retained as historical context.

Current update: [frozen prospective rules](PAPER_EXPERIMENT_PROTOCOL.md) and
[fresh compatibility findings](PREPAID_COMPATIBILITY_20261003.md). 59 tests pass;
reference gates pass 4/20 pilot and 96/618 final. Neither intentional tier omissions
nor no-PK source tables are treated as defects. Whole-corpus PostgreSQL compatibility
remains unresolved. Primary endpoint/denominators, companion metrics, paired
contrasts and descriptive inference rules are pinned before paid results. Counts
of schemas/artifacts with no planned behavioral tests are now explicitly reported.

## Evaluator/reproducibility update (2 October)

Items 2 and 4: [current validation evidence](EVALUATOR_VALIDATION.md) and
[offline archive/replay procedure](REPRODUCIBILITY.md). There are now 52 passing
local tests, nine detected mutation variants and fifteen passing independent
controls. Verification protocol is `target_attribution_v3`; older saved scores
need local backfill before current-protocol reporting. No LLM calls or dataset
changes were made. The corpus counts below are historical, not a fresh audit
under this implementation, and are not waived by the new regression tests.

## Protocol-v2 readiness update

Latest implementation: [items 1, 2 and 4](IMPLEMENTATION_1_2_4.md). Added source-based reference candidates, composite UNIQUE support, bounded compound CHECK witnesses, target-constraint attribution, nine mutation controls and checksummed reproducibility bundles. There are now 41 passing local tests. The counts below from the earlier audit are historical; use the current audit files and readiness document for the latest corpus status.

See [Paid-run readiness](PAID_RUN_READINESS.md) for the current authoritative execution gate and metric definitions. Added fixed gold-test denominators including model failures, all-artifact macro CER, schema-clustered bootstrap intervals, terminal failed-output resume handling, attempt-level usage journals, input/source/split hashes, and independent reference-oracle gates. Empty structural categories no longer earn perfect F1. Paper runs exclude repair.

**Paid execution is blocked:** only 4/20 frozen pilot references currently pass the local PostgreSQL oracle audit; 16 fail reference DDL compilation, with additional parser/generator warnings in some cases. This is a reference-data compatibility issue, not an LLM result. The local unit/integration checks pass. Live paid-provider validation and independent review of PostgreSQL reference equivalents remain outstanding.

The latest final reference audit has completed: **82/618 pass**, 518 fail PostgreSQL compilation, and 18 compile but fail tests or carry warnings. This exposes remaining corpus-specific parser/fixture/constraint support as well as source dialect and missing-definition problems; a passing regression suite alone does not establish full-corpus validity. The suite currently passes 41 tests. Additional model profiles and every LLM run are deferred by user instruction. See [reference review policy](REFERENCE_REVIEW_POLICY.md) before changing or excluding any source schema.

The older Groq results are engineering evidence only; separate no-LLM rechecks exposed and corrected verifier fixture/case issues. See the readiness document for preserved audit artifacts. The metric inventory below does not imply every research validation step or provider configuration is complete.

## Evaluation principle

ER2SQL should not copy every metric from the Python code-generation base paper. The main paper claims concern relational-schema correctness, so executable behavior and final-SQL structure are the primary evidence. Applicable base-paper text metrics should be retained as secondary measures for comparability.

The active comparison is structured Modules 2–5 versus the direct Module 6 baseline.

## Already present

### Execution and behavioral metrics

- **DDL compilation/execution rate** (`ddl_execution_rate`).
- **Constraint Enforcement Rate (CER)** calculated from gold-SQL-derived behavioral tests.
- **Overall test pass rate**.
- **Structural test pass rate** for table and column existence tests.
- **Per-test-type pass rates** for:
  - primary-key duplicate rejection;
  - foreign-key invalid-parent rejection;
  - foreign-key valid-parent acceptance;
  - `NOT NULL` rejection;
  - `UNIQUE` duplicate rejection;
  - supported `CHECK` acceptance and rejection;
  - supported `ON DELETE` behavior.
- Rejection tests now require the expected PostgreSQL SQLSTATE. Setup failures and unrelated error classes do not receive CER credit.
- Valid-operation acceptance rate.
- Invalid-operation rejection rate.
- Fully correct schema rate.
- End-to-end success rate.

### Parsing and generation metrics

- Module 2 parsing success rate.
- Module 3 structured-generation success rate.
- Module 6 direct-generation success rate.
- LLM attempt and validation-attempt counts.
- IR schema and semantic validation-error counts.

### Structural metrics currently available

- Table precision, recall and F1.
- Column precision, recall and F1.
- Primary-key precision, recall and F1.
- Foreign-key precision, recall and F1.

These are reported separately at two levels:

- **IR parsing metrics** compare the Module 2 IR with gold SQL and apply only to the structured arm.
- **Final-SQL structural metrics** parse generated and gold SQL for both arms and report tables, columns, primary keys, foreign keys, FK direction, data types, `NOT NULL`, `UNIQUE`, `CHECK` and referential actions.

### Robustness and breakdowns

- Overall results and separate Tier 1, Tier 2 and Tier 3 results.
- Paired Tier 1-to-Tier 2 and Tier 1-to-Tier 3 drop-off over matching schema IDs for:
  - compile rate;
  - final-SQL table recall and FK F1;
  - CER;
  - overall test-pass rate.
- Small, medium and large schema-complexity breakdowns based on gold table count.
- Per-schema result rows.
- Per-model comparison tables.
- Structured-versus-direct aggregate comparison.

### Other existing metrics

- Normalized SQL exact-match rate.
- Wilson 95% confidence interval for aggregate CER.
- Input tokens, output tokens, model latency and estimated-cost fields.
- JSON, CSV and Markdown evaluation artifacts.

## Present but requiring an update before publication

### 1. Tier drop-off uncertainty

**Status:** Mean paired drop-off exists; statistical reporting is missing.

Add:

- 95% confidence intervals for each paired tier drop-off;
- paired significance tests for Tier 1 versus Tier 2 and Tier 1 versus Tier 3;
- paired effect sizes;
- final-SQL table/FK drop-off after final-SQL structural evaluation is added.

Because the tiers share schema families, the schema family must remain the unit of pairing.

### 2. Structured-versus-direct comparison

**Status:** Aggregate subtraction exists; proper pairing is missing.

Compare the two arms on identical model, schema and tier instances. Add paired confidence intervals, paired significance tests and effect sizes for compile rate, final-SQL structural F1 and CER.

### 3. Cost and performance accounting

**Status:** Raw fields exist; aggregation is incomplete.

Update before paid experiments so unrecoverable provider data is captured correctly:

- sum cost and tokens across parsing and structured/direct generation;
- include retries and failed-call latency/cost where the provider reports usage;
- measure end-to-end schema latency and database-verification latency;
- report median and percentile latency in addition to the mean;
- report API calls per schema, throughput, cost per processed schema and cost per fully correct schema;
- represent unavailable cost as `N/A`, not zero.

## Missing primary/domain-specific metrics

### Relationship and cardinality accuracy

**Status:** Missing; gold SQL alone is insufficient for all of it.

Where retained PlantUML or Module 1 metadata supports it, add:

- relationship existence precision/recall/F1;
- relationship direction accuracy;
- one-to-one, one-to-many and many-to-many accuracy;
- minimum/maximum cardinality accuracy;
- identifying/optional relationship accuracy if represented in the dataset.

SQL foreign keys can evaluate referential linkage, but they do not preserve every visual cardinality annotation. This metric therefore requires gold diagram/PlantUML metadata.

### Automated error-analysis metrics

**Status:** Missing.

Aggregate errors into:

- missing, extra or wrong table;
- missing, extra or wrong column;
- missing or wrong PK;
- missing, wrong or reversed FK;
- wrong referenced table/column;
- wrong cardinality;
- missing or incorrect constraint;
- SQL syntax/DDL failure;
- executable but structurally or behaviorally incorrect SQL;
- parser-originated versus generator-originated error.

## Base-paper comparability metrics still missing

The base paper reports LLM Score, CodeBLEU, CrystalBLEU, ROUGE-L, chrF and Edit Distance. For ER2SQL:

| Metric | Decision | Role |
|---|---|---|
| CrystalBLEU | Add | Secondary text-similarity metric |
| ROUGE-L | Add | Secondary text-similarity metric |
| chrF | Add | Secondary text-similarity metric |
| Normalized edit distance/similarity | Add | Secondary text-similarity metric |
| LLM Score | Optional | Secondary semantic assessment only, with a fixed judge/version/rubric |
| CodeBLEU | Exclude | Standard CodeBLEU lacks SQL grammar support |

Plain BLEU appears in the ER2SQL planning document but is not one of the base paper's six main metrics. It may be reported as a low-priority appendix metric, but it is not required.

All text metrics should be computed over consistently canonicalized SQL. They must remain secondary because semantically equivalent SQL can differ in formatting, identifier quoting, constraint placement and statement order.

## Human validation and metric reliability

**Status:** Missing and performed after automated experiments.

Use a stratified subset across tiers and complexity levels. A DB-literate reviewer should score:

- schema completeness;
- constraint correctness;
- FK/relationship linkage correctness.

Report:

- inter-annotator agreement if more than one reviewer is used;
- Pearson correlation between human and automated scores;
- Spearman rank correlation between human and automated scores.

The base paper used 150 instances across three complexity levels. ER2SQL can use a justified stratified sample rather than copying that number without a sampling rationale.

## Final recommended paper metric set

### Primary metrics

1. DDL execution rate.
2. Final-SQL table, column, PK and FK precision/recall/F1.
3. CER.
4. Valid-operation acceptance rate.
5. Invalid-operation rejection rate.
6. Fully correct schema rate.
7. Paired tier drop-off with confidence intervals and effect sizes.

### Secondary metrics

1. IR parsing precision/recall/F1.
2. CrystalBLEU.
3. ROUGE-L.
4. chrF.
5. Normalized edit distance.
6. Normalized SQL exact match.
7. Optional fixed-rubric LLM Score.

### Efficiency metrics

1. End-to-end latency and database-verification latency.
2. Input/output tokens and API-call count.
3. Total cost, cost per schema and cost per fully correct schema.

### Reliability and analysis

1. Paired confidence intervals, significance tests and effect sizes.
2. Complexity-level performance.
3. Error-category frequencies.
4. Human evaluation and human/automatic-metric correlation.

## Implementation order

### Must be completed before the paid full-corpus runs

1. Freeze and validate one exact provider/model configuration per model, including pricing and retry-cost limits.
2. Freeze the reviewed prompts and their hashes.
3. Pass the PostgreSQL integration suite.
4. Pass the 20-schema held-out pilot gate for every selected model and rerun it once to confirm resume behavior.

### Can be computed after generation from saved artifacts

1. CrystalBLEU, ROUGE-L, chrF and normalized edit distance.
2. Paired tier and architecture statistics.
3. Final tables, plots and confidence intervals.
4. Automated error taxonomy.
5. Human evaluation and correlation analysis.

## Current readiness conclusion

The core evaluation and protocol-v2 safeguards are implemented and the local PostgreSQL integration suite passes. Before any paid pilot, resolve the failed reference-oracle audit. Before full-corpus execution, audit every selected reference, verify exact configs for every selected model, and pass the frozen 20-schema pilot gate. Clustered descriptive intervals are implemented; confirmatory multiple-comparison decisions and human validation remain research tasks. Preserve every attempt and raw artifact for subsequent analysis.
