**ER-SCHEMA2SQL RESEARCH PLAN â€" LOCKED DIRECTION**

> **Current scope update (30 September 2026):** Conditional repair is deferred. It is excluded from the current code, experiment matrix, metrics, budget, and paper claims. The active experimental arms are **Structured (Modules 2–5)** and **Direct (Module 6)**. Any repair references retained later in this document are historical draft material, not current scope.

**PROJECT GOAL**

> **Pre-paid protocol freeze (3 October 2026):** [PAPER_EXPERIMENT_PROTOCOL.md](docs/PAPER_EXPERIMENT_PROTOCOL.md) and `config/paper_protocol_v1.yaml` now define the active experimental rules. The manifests pin the protocol hash. Existing dataset semantics and intentional tier omissions are preserved; no automatic exclusions or upstream reconstruction. Current split: 714 IDs (76 development, 20 pilot, 618 final). Model purchases/profiles remain deferred. Earlier conflicting draft text below is historical; this freeze does not authorize any LLM runs.

**Build a top-conference-quality research paper on vision-grounded ER Diagram â†' SQL DDL generation.**

**The paper is NOT primarily a benchmark/leaderboard paper.**

**Primary framing:**

**"Benchmark Dataset + Architecture Study"**

**Primary research question:**

**Does decomposing ER Diagram â†' SQL generation into explicit visual parsing, structured intermediate representation, SQL generation, and execution-grounded verification improve executable schema correctness over direct single-shot generation?**

**The benchmark dataset is the evaluation resource that enables the architecture study.**

**MDCAgent (base paper.pdf) is the methodological BASE PAPER.**

**ERUnderstand is the closest related work and should be cited as related work, not copied architecturally.**

**CORE POSITIONING**

**MDCAgent established the general Parse â†' Generate â†' Check diagram-to-code decomposition.**

**MDCâ€™s baseline was : image -> sql directly one shot**

**We should NOT claim that Parse â†' Generate â†' Verify itself is novel. MDC has already done the decomposition part.**

**Our work extends that paradigm to ER Diagram â†' SQL DDL and introduces:**

**1\. A strict visual-to-structured information bottleneck:**

**ER image â†' Parse Agent â†' canonical JSON â†' SQL Generator**

**The Parser is the only component that receives the ER image.**

**The SQL Generator receives ONLY the canonical JSON.**

**The Generator never receives the original ER image.**

**This differs from MDCAgent, whose Generation Agent receives both the original diagram and the parsed representation.**

**2\. Execution-grounded verification:**

**Generated SQL is executed against a real database engine.**

**Constraint behavior is tested programmatically.**

**Verification therefore relies on executable evidence rather than an LLM merely judging whether the generated code appears correct.**

**3\. Conditional evidence-driven repair: (NOT CONFIRMED YET**

**If execution/constraint verification fails, a third LLM call is made.**

**The repair LLM receives the generated SQL plus concrete machine-generated failure evidence and produces corrected SQL.**

**The corrected SQL is re-executed and re-verified.**

**No repair LLM call is made for outputs that already pass verification.**

**The three points together form the main architectural contribution:**

**explicit structured mediation + execution-grounded verification + evidence-driven conditional repair.**

**FINAL ARCHITECTURE**

**FULL SYSTEM:**

**ER Diagram Image**

**â†"**

**Module 2: ER Diagram Parsing Agent**

**â†"**

**Canonical JSON IR**

**â†"**

**Deterministic schema/IR validation**

**â†"**

**Module 3: SQL Generation Agent**

**â†"**

**SQL DDL**

**â†"**

**Module 4: Constraint Test Generator**

**â†"**

**Module 5: SQL Verification / Database Execution**

**â†"**

**PASS â†' final SQL**

**FAIL**

**â†"**

**Conditional Repair LLM**

**â†"**

**Corrected SQL**

**â†"**

**Re-execution / re-verification**

**IMPORTANT:**

**Do NOT add another mandatory LLM agent merely for novelty.**

**Deterministic components should perform validation, test generation, SQL execution and verification wherever possible.**

**LLMs should primarily be used for:**

**\- visual parsing**

**\- SQL generation**

**\- conditional repair**

**Normal successful examples therefore require only 2 LLM calls.**

**Failed examples require at most 3 LLM calls.**

**This keeps the architecture within the project budget.**

**EXPERIMENTAL ARCHITECTURE LADDER**

**The paper should compare the following systems:**

**A. DIRECT BASELINE**

**ER image â†' LLM â†' SQL**

**1 LLM call.**

**This is the experimental baseline for our own ERâ†'SQL task.**

**MDCAgent's published direct-baseline results cannot substitute for this because its task is model-diagram â†' Python/PyTorch code which is fundamentally different from ours.**

**B. STRUCTURED GENERATION**

**ER image â†' Parse LLM â†' canonical JSON â†' Generate LLM â†' SQL**

**2 LLM calls.**

**Purpose:**

**Measure whether forcing all visual understanding through an explicit structured intermediate representation improves SQL generation.**

**C. FULL PROPOSED SYSTEM**

**ER image â†' Parse â†' JSON â†' Generate â†' deterministic execution/constraint verification â†' conditional repair if necessary â†' re-verification**

**Maximum 3 LLM calls.**

**Purpose:**

**Measure the additional benefit of execution-grounded verification and evidence-driven repair.**

**OPTIONAL REFERENCE BASELINE:**

**If budget and implementation effort allow, reproduce an MDCAgent-style Check baseline:**

**ER image â†' Parse â†' Generate â†' LLM Check/Repair**

**3 LLM calls.**

**This is useful because it allows a direct comparison between:**

**\- LLM-based checking (MDCAgent-style)**

**\- execution-grounded checking (our approach)**

**However, this should only be included if the budget allows. It is not necessary to reproduce the entire MDCAgent implementation.**

**see Ablation Studies section for the formal version of this ladder**

**DATASET**

**Current dataset:**

**715 matched-triplet schemas across three controlled visual tiers.**

**The three tiers represent the same underlying SQL schema under different visual information conditions:**

**Tier 1:**

**Full diagram with PK/FK tags and cardinality.**

**Tier 2:**

**Keys hidden â€" PK/FK badges removed while relationship lines remain.**

**Tier 3:**

**Cardinality hidden â€" key badges retained while cardinality symbols are removed.**

**All diagrams are PlantUML-generated PNGs with matching .puml sources and ground-truth SQL DDL.**

**Dataset construction must retain schema-family grouping so the three tiers of the same underlying schema are treated as paired instances, not independent schemas.**

**Current audit information:**

**523 + 420 source batches.**

**715 schemas have currently been confirmed as clean matched triplets across all three tiers.**

**Known property: 312/715 schemas contain â‰¥1 table with no declared primary**

**key in the source SQL (verified via Module 1). This is correct ground**

**truth, not a parsing defect â€" flag these schemas in metadata so PK**

**metric interpretation accounts for it rather than treating it as noise.**

**DATASET CONSTRUCTION**

**Module 1:**

**DDL Parser + ER Renderer**

**Purpose:**

**Dataset construction only.**

**Input:**

**Collected SQL/DDL schemas.**

**Process:**

**\- Parse/validate DDL**

**\- Generate deterministic PlantUML representation**

**\- Render ER diagram**

**\- retain original SQL as ground truth**

**\- validate source/diagram consistency**

**\- remove invalid/incomplete renderings**

**\- identify rendering failures**

**\- audit PK/FK/cardinality visibility**

**Module 1 is NOT part of the inference pipeline when using the already-created ER images.**

**Inference starts from the ER image at Module 2.**

**INTERMEDIATE REPRESENTATION**

**Define and LOCK the canonical JSON schema before full experimentation.**

**The IR should represent:**

**\- entities/tables**

**\- attributes/columns**

**\- data types where visually available**

**\- primary keys**

**\- foreign keys**

**\- relationships**

**\- cardinality**

**\- relationship direction where applicable**

**\- relevant constraint metadata**

**The JSON IR is a central experimental component.**

**The Generator must receive only this IR.**

**Do not remove the IR or pass the image directly to the Generator, because doing so would collapse the main architectural experiment.**

**VERIFICATION DESIGN**

**Verification should be deterministic wherever possible.**

**At minimum test:**

**\- SQL compilation/execution**

**\- table existence**

**\- column correctness**

**\- primary-key behavior**

**\- foreign-key behavior**

**\- NOT NULL behavior**

**\- UNIQUE behavior**

**\- relationship/foreign-key integrity**

**Where supported by the ground truth, include:**

**\- composite keys**

**\- composite foreign keys**

**\- CHECK constraints**

**\- cascade behavior**

**The Constraint Test Generator should generate tests programmatically from the schema/constraint definitions wherever possible rather than using an additional LLM.**

**Foreign-key testing MUST be bidirectional:**

**(a) an insert with a reference to a non-existent parent â†' must be rejected**

**(b) an insert with a reference to a real, pre-existing parent row â†' must be accepted**

**Testing only (a) undercounts true constraint enforcement and was a**

**confirmed gap in an earlier implementation pass.**

**GOLD-REFERENCE VERIFICATION REQUIREMENT**

**Upgrade 1 — Gold-derived final evaluation:** Final evaluation test suites must be generated from ground-truth schema/constraint metadata derived from Module 1's source SQL, not only from the predicted IR. Predicted-IR test suites may be retained for pipeline diagnostics, but execution metrics -- especially Constraint Enforcement Rate -- must measure generated SQL against the ground-truth relational constraints. This prevents a missing predicted constraint from disappearing from the evaluation itself.

**CHECK-CONSTRAINT TEST REQUIREMENT**

**Upgrade 2 — Explicit CHECK behavior tests:** For every ground-truth `CHECK` constraint that can be represented and executed in the PostgreSQL verification environment, generate both (a) a valid insert or update that satisfies the predicate and must succeed and (b) an invalid insert or update that violates the predicate and must be rejected. Record unsupported dialect-specific expressions separately rather than silently excluding them from the denominator.

**CORE METRICS**

**Do NOT use CodeBLEU as a primary SQL metric.**

**CodeBLEU is valid for the base paper's own domain (Python code has**

**tree-sitter grammar support) but has NO SQL grammar support at all â€"**

**calling it on SQL text throws an exception, silently caught and**

**returned as 0.0 by typical wrapper implementations. This is a**

**language-support gap, not a general metric flaw.**

**Use:**

**Reference/base-paper metrics where meaningful:**

**\- BLEU**

**\- ROUGE-L**

**\- Edit Distance**

**\- chrF**

**\- CrystalBLEU**

**Domain-specific structural metrics:**

**\- Table Precision / Recall / F1**

**\- Column Precision / Recall / F1**

**\- Primary Key Precision / Recall**

**\- Foreign Key Precision / Recall**

**Execution-based metrics:**

**\- SQL Compilation/Execution Rate**

**\- Constraint Enforcement Rate (CER)**

**\- Valid-operation success rate**

**\- Invalid-operation rejection rate**

**\- Repair Success Rate**

**\- Post-repair CER**

**The execution-based metrics should be emphasized over textual similarity because multiple SQL DDL formulations can be semantically equivalent.**

**MAIN ABLATION STUDIES**

**The main experiment should isolate the contribution of each architectural idea.**

**1\. Direct:**

**Image â†' SQL**

**2\. Structured:**

**Image â†' Parse â†' JSON â†' SQL**

**3\. Full:**

**Image â†' Parse â†' JSON â†' SQL â†' execution verification â†' conditional repair**

**If feasible, additionally compare:**

**4\. MDCAgent-style:**

**Image â†' Parse â†' Generate â†' LLM Check**

**This allows the paper to ask:**

**\- Does explicit structured mediation help?**

**\- Does execution-grounded verification help?**

**\- Does evidence-driven repair recover failed generations?**

**\- Is execution-based verification more useful than purely LLM-based checking?**

**THREE-TIER ROBUSTNESS EXPERIMENT**

**Because Tier 1, Tier 2 and Tier 3 share the same underlying SQL schema, evaluate them as paired conditions.**

**Study:**

**\- performance degradation as visual information is removed**

**\- whether the proposed architecture is more robust than direct generation**

**\- whether errors originate from missing visual information**

**\- whether execution verification catches errors that textual metrics miss**

**The strongest possible result would be a finding that the structured architecture degrades less under visual corruption than direct generation.**

**Do NOT claim this result before running the experiment.**

**ERROR ANALYSIS**

**Trace failures through the pipeline:**

**ER visual interpretation**

**â†"**

**IR error**

**â†"**

**SQL generation error**

**â†"**

**SQL execution/constraint failure**

**â†"**

**repair**

**â†"**

**final outcome**

**Categorize errors such as:**

**\- missing entity**

**\- missing attribute**

**\- wrong attribute**

**\- missing PK**

**\- wrong PK**

**\- missing FK**

**\- wrong FK**

**\- wrong cardinality**

**\- missing constraint**

**\- incorrect constraint**

**\- SQL syntax failure**

**\- semantically incorrect but compilable SQL**

**This should allow the paper to explain WHY the architecture helps rather than only reporting aggregate scores.**

**LLM EVALUATION**

**The project is budget-constrained.**

**Use the selected affordable/diverse model set rather than maximizing model count.**

**MODEL POOL — UNDER DISCUSSION (NOT LOCKED)**

**Option 1 — Original 5-model pool (post budget-fix):**

**\- Gemini 3.0 Flash (cheap/fast)**

**\- Gemini 3.0 Pro (flagship, same vendor â€" reasoning-vs-fast pair with Flash)**

**\- Qwen 3.5**

**\- Gemma 3**

**\- GLM 4.5**

**Dropped from the earlier draft for budget reasons: Grok-2-Vision, Llama-3.2-Vision**

**(highest per-call cost, redundant coverage with retained models).**

**Option 2 — Recommended 5-model vision-compatible final panel:**

**- Gemini Flash (fast/cost-efficient)**

**- Gemini Pro (higher-capability counterpart; retain the same-vendor fast-vs-capable comparison)**

**- GPT-5.4 Mini (cross-vendor commercial vision model)**

**- Claude Haiku 4.5 (cross-vendor commercial vision model; requires a compatible provider adapter or routing layer)**

**- GLM-4.5V (vision-language model; do not use text-only GLM-4.5 for the image stages)**

**Before a final choice, every candidate must pass a pilot gate: an exact versioned model ID, confirmed image input support for Modules 2 and 6, compatibility with the project API client or a documented adapter, and measured cost/DDL/CER results on the held-out pilot subset. DeepSeek V4 Flash Vision, Kimi K2.5, and a verified Qwen-VL model remain pilot/appendix candidates rather than automatic full-corpus models.**

**The number of models is supporting evidence, NOT the primary contribution.**

**The key question is whether the architectural improvement generalizes across heterogeneous models.**

**Do not turn the paper into a leaderboard.**

**COST STRATEGY**

**BUDGET (LOCKED)**

**Total available: â‚¹18,000 (~\$190 USD at time of planning).**

**Full 715Ã—3-tier corpus Ã— full 3-arm ladder (with repair) Ã— 5-model pool**

**above â‰ˆ \$195â€"220 estimated (2K-in/500-out token assumption) â€" at budget edge.**

**MANDATORY: run a real 20â€"30 schema pilot across all 5 models BEFORE**

**committing to the full run, to replace the token-count assumption with**

**real measured cost. Do not schedule the full run until pilot cost is known.**

**Do not increase architecture complexity solely for novelty.**

**Use:**

**\- conditional repair**

**\- prompt caching**

**\- batch API discounts where available**

**\- deterministic verification**

**\- pilot/development subsets**

**\- stratified sampling for expensive models if necessary**

**Prompt development should happen on a held-out development subset.**

**Freeze prompts before final evaluation.**

**Do not tune prompts on the final test set.**

**DEVELOPMENT ORDER**

**1\. Resolve Module 2 JSON schema-validation bug.**

**2\. Finalize canonical IR schema.**

**3\. Complete Module 3 SQL Generator.**

**4\. Complete deterministic Module 4 Constraint Test Generator.**

**5\. Complete Module 5 SQL Verification.**

**6\. Implement conditional repair using execution failure evidence.**

**7\. Complete Module 6 Direct Generation Baseline.**

**8\. Complete Module 7 Experimentation Harness.**

**9\. Run a small end-to-end pilot.**

**10\. Validate automated metrics and ground truth with an external DB-literate reviewer.**

**11\. Freeze prompts, models and evaluation protocol.**

**12\. Run full experiments.**

**13\. Perform ablations.**

**14\. Perform three-tier robustness analysis.**

**15\. Perform error analysis.**

**16\. Write the paper around the architectural findings, not the leaderboard.**

**NOVELTY AND RESEARCH CONTRIBUTION HIERARCHY**

**Primary contribution:**

**A structured and execution-grounded architecture for reliable ER Diagram â†' SQL DDL generation.**

**Supporting architectural contributions:**

**1\. Explicit image â†' canonical JSON â†' SQL information bottleneck.**

**2\. Execution-grounded database verification.**

**3\. Conditional evidence-driven repair.**

**Supporting dataset contribution:**

**A controlled ERD/SQL benchmark resource with paired visual-information tiers.**

**Supporting evaluation contribution:**

**Structural + executable/behavioral correctness evaluation, including Constraint Enforcement Rate.**

**Supporting scientific analysis:**

**Architecture ablations, cross-model generalization, visual-robustness analysis and pipeline-level error attribution.**

**POSITIONING AGAINST MDCAgent**

**Do NOT claim:**

**"Parse â†' Generate â†' Verify is novel."**

**MDCAgent already established diagram-to-code decomposition with Parsing, Generation and Check agents.**

**Instead say:**

**MDCAgent:**

**Diagram â†' Parse â†' Generate â†' LLM-based Check â†' Code**

**Our work:**

**ER Diagram â†' Parse â†' canonical JSON â†' Generate â†' database execution â†' constraint verification â†' evidence-driven conditional repair.**

**Key differences:**

**\- Generator is isolated from the original image.**

**\- Canonical relational IR is the sole input to generation.**

**\- Verification is grounded in actual database execution.**

**\- Constraint behavior can be tested objectively.**

**\- Repair is triggered only by machine-observed failures and uses explicit failure evidence.**

**POSITIONING AGAINST ERUNDERSTAND**

**ERUnderstand is the closest ER-diagram understanding work and should be cited.**

**Do NOT compete primarily on:**

**\- dataset size**

**\- number of models**

**\- ERD-understanding leaderboard**

**ERUnderstand primarily studies ER diagram understanding / structured representation.**

**Our task continues downstream:**

**ER diagram**

**â†' structured representation**

**â†' SQL DDL**

**â†' executable database**

**â†' constraint behavior**

**â†' repair**

**Our differentiation is executable schema generation and execution-grounded correctness, not simply ER diagram recognition.**

**Additional differentiation: ERUnderstand's real-world schema subset reuses**

**widely-known tutorial schemas (Sakila, Chinook, Northwind, etc.) likely**

**memorized by most LLMs during pretraining, without controlling for this.**

**Our dataset construction includes a decontamination pass (source repo**

**metadata / popularity check) to flag high-memorization-risk schemas â€"**

**a methodological safeguard ERUnderstand's evaluation does not have.**

**NOVELTY CLAIM DISCIPLINE**

**Do NOT claim:**

**\- first diagram-to-code decomposition**

**\- first multi-agent ERD system**

**\- first use of parsing + generation**

**\- first LLM verification**

**\- first ER benchmark**

**unless an exhaustive literature review establishes those claims.**

**Safer framing:**

**"We study whether explicit structured mediation and execution-grounded verification improve the reliability of vision-grounded ER-to-SQL generation."**

**PAPER STRATEGY**

**The goal is a durable methodological paper, not a temporary model leaderboard.**

**The central story should be:**

**1\. ER-to-SQL generation is difficult because visual interpretation errors propagate into relational schema and constraint errors.**

**2\. Existing diagram-to-code decomposition such as MDCAgent motivates explicit parsing/generation stages.**

**3\. ERUnderstand demonstrates the importance/difficulty of ER diagram understanding but does not evaluate executable SQL generation.**

**4\. We introduce a strict structured ER representation between visual parsing and SQL generation.**

**5\. We replace purely model-based checking with executable database verification.**

**6\. We use machine-generated execution evidence for conditional repair.**

**7\. Controlled ablations determine which components actually improve reliability.**

**8\. Paired visual tiers test robustness to missing visual information.**

**9\. Structural and execution-based metrics reveal failures that textual similarity alone cannot capture.**

**IMPORTANT STRATEGIC DECISION**

**DO NOT try to add more LLM agents right now.**

**First build and validate the existing architecture.**

**After the core experiments are complete, use the empirical failure analysis to determine whether an additional architectural component is actually justified.**

**If a major recurring failure mode remains, then consider strengthening the architecture with a targeted deterministic or low-cost component.**

**Novelty should come from a well-motivated architectural principle and strong empirical evidence, NOT from the number of agents.**
