$ErrorActionPreference = 'Stop'
$source = 'C:\Users\anika\Downloads\UE23CS441A _LOW LEVEL DESIGN & IMPLEMENTATION DOCUMENT (1).docx'
$output = Join-Path (Get-Location) 'outputs\ER2SQL_Low_Level_Design_and_Implementation_try4.docx'
if (Test-Path -LiteralPath $output) { throw "Refusing to overwrite existing output: $output" }
Copy-Item -LiteralPath $source -Destination $output
Write-Output "copied: $output"

$word = New-Object -ComObject Word.Application
$word.Visible = $false
$word.DisplayAlerts = 0
$doc = $null
try {
    $doc = $word.Documents.Open($output, $false, $false)
    Write-Output "opened: $($doc.Paragraphs.Count) paragraphs"

    function Set-ParagraphText($document, [int]$index, [string]$value) {
        $paragraph = $document.Paragraphs.Item($index).Range
        $paragraph.End = $paragraph.End - 1
        $paragraph.Text = $value
    }

    $replacements = @{
        14 = 'ER2SQL: Vision-Grounded ER Diagram to SQL DDL Generation'
        185 = 'This document describes the implemented ER2SQL system and its current exploratory evaluation. Cover-page identity fields are retained for the project team to complete.'
        201 = 'ER2SQL studies how to generate executable relational database schemas from entity-relationship diagrams. The implemented research pipeline separates visual parsing, structured representation, SQL generation, and database-backed evaluation. This document records the current design, implementation boundaries, and two small provider pilots.'
        204 = 'The purpose of this low-level design is to describe ER2SQL components, data flow, interfaces, operational assumptions, and evaluation methods in enough detail to support implementation, testing, and review.'
        207 = 'The system accepts ER-diagram images at three information tiers and produces PostgreSQL DDL through either a structured image-to-IR-to-SQL path or a direct image-to-SQL baseline. It validates intermediate data, executes generated DDL, tests schema behavior, and records reproducible experiment artifacts. Dataset construction and diagram rendering are external inputs; conditional repair is not part of the active two-arm evaluation.'
        209 = 'Constraints: Module 3 receives canonical JSON only and has no image input; source SQL and frozen split files are immutable; PostgreSQL is the evaluation target; planned behavioral tests come from the reviewed gold schema, not model output. Assumptions: input images correspond to the selected schema and tier; provider responses may fail, truncate, or be rate-limited. Dependencies include Python, PostgreSQL, provider APIs and credentials, frozen manifests, source images, and reviewed reference SQL. Paid final runs remain gated on reference eligibility and evaluator checks.'
        211 = 'The design has two comparison arms. Structured: ER image -> Module 2 visual parsing -> canonical JSON IR -> deterministic validation -> Module 3 SQL generation -> Modules 4-5 test generation and PostgreSQL verification -> Module 7 evaluation. Direct: ER image -> Module 6 SQL generation -> the same Modules 4-5 and Module 7. Module 1 denotes upstream dataset construction in the research plan and is not implemented in this repository.'
        214 = 'System flow: ER image -> visual parser (Module 2) -> canonical JSON -> IR validation -> SQL generator (Module 3) -> generated DDL. The Direct baseline (Module 6) maps the image directly to DDL. Both paths feed deterministic test generation, isolated PostgreSQL execution, and experiment evaluation. The generator never receives the original image on the Structured path.'
        216 = 'ER2SQL Functional Modules'
        218 = 'The modules below describe the implemented inference and evaluation system. Dataset construction (Module 1 in the research plan) supplies the source images and SQL externally.'
        225 = 'Use Cases'
        220 = 'The repository implements the inference and evaluation pipeline, not the upstream ER-image creation step. It loads tiered diagram files and gold SQL, calls a vision-capable model for parsing, validates the resulting IR, generates PostgreSQL DDL, executes generated test suites in an isolated database, and records results, costs, prompts, manifests, and run state. Structured and Direct are separate arms; repair is excluded from the current protocol.'
        227 = 'Use cases: select a frozen manifest; load a schema image and tier; parse an image into the canonical IR; validate the IR; generate SQL from the IR; generate gold-reference tests; execute DDL and tests in an isolated PostgreSQL transaction; run the direct image-to-SQL baseline; evaluate paired results; export reports and reproducibility bundles.'
        228 = ''
        252 = 'Class and Data Model'
        254 = 'Core data and service relationships: ExperimentSpec -> ModelRunSpec -> LLMClient; SchemaRecord -> ParsingResult -> IRValidationResult -> GenerationResult; TestSuite -> VerificationResult -> EvaluationReport. The DirectBaselineResult bypasses parsing and IR generation, then joins the same verification and evaluation flow.'
        255 = ''
        276 = 'SchemaRecord'
        277 = 'The primary pipeline record is the schema-level input and its immutable source identity. Dataset discovery pairs each tier image with its ground-truth SQL and records warnings for missing or ambiguous pairs.'
        279 = 'Class Description'
        280 = 'SchemaRecord represents one matched diagram/SQL input for a schema and tier; DatasetDiscoveryReport summarizes discovered files, pairings, and input issues.'
        281 = 'schema_id: string; tier: integer; image_path: path; ground_truth_sql_path: path; source_hashes: mapping; metadata: mapping.'
        302 = 'discover_and_load()'
        304 = 'The core Structured sequence is: discover input -> call vision parser -> parse canonical JSON -> run deterministic schema and referential validation -> call text-only SQL generator -> execute PostgreSQL DDL -> run planned tests -> persist artifact and usage metadata -> evaluate.'
        305 = 'Purpose: preserve a strict visual-to-structured-to-SQL boundary.'
        306 = 'Input: schema image, tier, frozen model and prompt configuration.'
        307 = 'Output: generated SQL plus parsing, validation, execution, test, and usage records.'
        308 = 'Parameters include schema ID, tier, provider/model, temperature, token cap, output path, and retry settings.'
        309 = 'Exceptions and terminal failures are journaled; invalid IR or missing SQL does not silently count as success.'
        310 = 'Pseudo-code: for each assigned schema-tier, load image; parse image to IR; validate IR; if valid generate SQL from IR only; execute in an isolated database; run the same gold-derived test suite for both arms; save every terminal result; aggregate only under the frozen paired-cell and denominator rules.'
        316 = 'ExperimentOrchestrator'
        318 = 'Loads and validates an experiment manifest, resolves model and protocol settings, schedules artifacts, resumes completed work safely, and writes provenance and run-status records.'
        320 = 'ExperimentSpec: run name, output root, split, tiers, arms, protocol hash. ModelRunSpec: model name, config path, prompt version. LLMCallResult: response text, token usage, finish reason, latency, and attempt metadata.'
        322 = 'prepare and validate the manifest; resolve selected inputs and model profiles.'
        324 = 'run_structured_and_direct(): execute both arms and resume completed artifacts safely.'
        326 = 'evaluate_and_report(): write reports and reproducibility inventories; propagate unresolved attempts and failures.'
        317 = 'Input models are immutable manifest values; outputs are versioned artifacts with hashes and terminal status.'
        328 = 'TestSuite / VerificationResult / EvaluationReport'
        329 = 'Module 4 creates deterministic cases from the gold schema. Module 5 executes DDL and cases against PostgreSQL, recording SQLSTATE and outcomes. Module 7 aggregates behavioral, structural, uncertainty, and usage metrics. The evaluator treats compile/generation failures under the planned-denominator policy and keeps execution-conditional measures secondary.'
        346 = 'Sequence Diagram'
        348 = 'Sequence overview: Orchestrator selects a schema-tier and arm; the image is sent to Module 2 for Structured or Module 6 for Direct; Structured IR is validated before Module 3 receives it; generated SQL is submitted to isolated PostgreSQL; Modules 4-5 run planned gold-derived tests; result and attempt metadata are stored; Module 7 produces the paired report. No repair model call is made in the active experiment.'
        349 = ''
        384 = 'Packaging and Deployment Diagram'
        385 = 'Deployment overview: local experiment runner reads versioned configuration, tiered image inputs, and reviewed reference SQL; it calls the selected external model endpoint over HTTPS; generated artifacts and audit logs are stored under a versioned output directory; PostgreSQL runs locally or on a controlled test instance using isolated schemas/transactions. Credentials are provided through environment configuration and are not embedded in experiment reports.'
        386 = ''
        389 = 'The approach isolates the information path to test architecture effects. Structured requires image understanding to be expressed in a canonical relational IR before SQL generation. Direct is the one-call image-to-SQL baseline. Both are evaluated against the same gold schema and deterministic planned tests. Three visual tiers are paired by underlying schema; tiers are repeated conditions, not independent schemas. Prompts, model profiles, input hashes, splits, and protocol versions are recorded. Results below are exploratory provider pilots, not confirmatory final-paper findings.'
        391 = '4.1 Algorithm and Pseudocode'
        392 = 'Workflow pseudocode: 1) Read frozen manifest and verify hashes. 2) For every assigned schema and tier, load the image and gold reference. 3) Structured arm: parse image, validate JSON IR, then generate SQL from IR only. Direct arm: generate SQL from image. 4) Create the planned suite from the gold relational state. 5) Run DDL and tests in isolated PostgreSQL; record pass/fail, SQLSTATE, latency, tokens, truncation, and errors. 6) Apply preregistered paired-cell exclusions only for demonstrably unusable capped output. 7) Compute planned-denominator CER and companion metrics, with execution-conditional CER secondary. 8) Preserve raw artifacts, manifests, logs, and reports.'
        394 = '4.2 Implementation and Results'
        395 = 'Implementation status: Modules 2-7 and reproducibility/readiness tooling are present. Module 1 (source DDL parsing and diagram rendering) is external. The active experimental arms are Structured (Modules 2-5) and Direct (Module 6); conditional repair is not implemented in the active protocol. Two small paid provider pilots are available: Groq-hosted Qwen 3.8 27B on 8 schemas and Mistral Small 4 on 10 schemas, each with Structured and Direct arms. Both are exploratory and predate the current verification-attribution implementation; they must not be presented as final-paper evidence.'
        396 = 'Pilot results (planned-denominator constraint pass rate; primary exploratory endpoint): Mistral Small 4: Structured 5.63% (150/2,666), Direct 0.30% (8/2,666); 28 of 30 schema-tier cells per arm scored after two paired unusable-output exclusions. Groq-hosted Qwen 3.8 27B: Structured 3.30% (15/454), Direct 7.05% (32/454); 11 paired cells scored after five Direct SQL outputs were rejected at end-of-input and excluded with their paired Structured cells. Groq’s Structured artifacts were capped but parseable and retained; omissions count as model errors.'
        397 = 'Additional pilot context: Mistral DDL compile rate was 25.00% (7/28) Structured and 17.86% (5/28) Direct; planned all-test pass rate was 11.01% (781/7,096) and 2.85% (202/7,096), respectively. Groq DDL compile rate on its 11 scored paired cells was 45.45% (5/11) Structured and 63.64% (7/11) Direct; planned all-test pass rate was 5.09% (57/1,120) and 14.20% (159/1,120). Thus the small pilots do not show a consistent arm winner. Neither model achieved an end-to-end fully correct schema. Groq and Mistral figures are recalculated from saved pilot artifacts; historical verification-attribution limitations and small samples restrict interpretation. Token-derived cost is not a provider invoice.'
        399 = '4.3 Further Exploration Plans and Timelines'
        400 = 'Next: finish the current source/reference eligibility review, validate the exact frozen pilot manifest against PostgreSQL and evaluator mutation controls, resolve remaining protocol and provider-cap issues, then run the preregistered fresh pilot only after all gates pass. After a passing pilot, run the final split with the same locked prompts, model profiles, and protocol; report actual eligible counts, exclusions, uncertainty, costs, and limitations. Add repair or new arms only through a prospective protocol amendment.'
        401 = 'Timeline: readiness and reference audit -> fresh pilot and resume validation -> final paid runs -> paired analysis and error review -> paper results. Dates depend on reference approval, provider availability, and funding; no completion date is asserted here.'
        404 = 'ER: Entity-Relationship. DDL: Data Definition Language. IR: Intermediate Representation. PK: Primary Key. FK: Foreign Key. CER: Constraint Enforcement Rate. Structured: image -> canonical JSON IR -> SQL. Direct: image -> SQL. Schema-tier cell: one schema evaluated at one visual-information tier. Planned denominator: gold-derived tests fixed before model outcomes. PostgreSQL: target database engine for execution checks.'
        406 = 'ER2SQL Research Plan, “ER-Schema2SQL Research Plan — Locked Direction,” project source-of-truth DOCX, supplied in repository. README.md, ER2SQL architecture and implementation overview. PAPER_EXPERIMENT_PROTOCOL_V3.md and current protocol amendments, experiment design and metric rules. PAPER_METRICS_STATUS.md, metric inventory and interpretation. PAID_RUN_READINESS.md, execution gates and run status. Pilot artifacts: outputs/experiments/groq-qwen38-tier23-8-paper-v2/GROQ_QWEN38_TIER23_8_RESULTS.md and outputs/experiments/mistral-small4-provider-pilot10-20261005/MISTRAL_SMALL4_PILOT10_RESULTS.md. Software source: src/er2sql modules 2-7. Dates and versions are recorded in the referenced artifact manifests.'
        408 = 'Version 1.0, 9 October 2026: populated the supplied LLD template with the repository architecture, implementation status, exploratory Groq and Mistral pilot results, known limitations, references, and traceability. The source template remains unchanged.'
        435 = 'Traceability below maps the project research requirements to implemented design components. The project Requirements Specification was not present in the supplied workspace; requirement labels are taken from the locked research plan and should be cross-checked against the approved capstone requirements document.'
    }
    foreach ($key in ($replacements.Keys | Sort-Object {[int]$_})) {
        Set-ParagraphText $doc ([int]$key) $replacements[$key]
    }
    Write-Output 'paragraph replacements done'

    # Replace the example use-case table with project-specific use cases.
    $useCases = $doc.Tables.Item(4)
    $useCaseRows = @(
        @('Use case', 'Description'),
        @('Run Structured generation', 'Parse a tiered ER image to validated canonical JSON, then generate PostgreSQL DDL from the IR only.'),
        @('Run Direct baseline', 'Generate PostgreSQL DDL directly from the same tiered ER image without the intermediate IR.'),
        @('Verify generated schema', 'Execute DDL and deterministic gold-derived tests in isolated PostgreSQL; record expected and observed outcomes.'),
        @('Evaluate paired experiment', 'Aggregate the two arms using pinned schema-tier assignments, planned denominators, and documented paired exclusions.'),
        @('Resume and reproduce', 'Skip completed artifacts, journal attempts, and export input, prompt, model, source, and result provenance.')
    )
    while ($useCases.Rows.Count -lt $useCaseRows.Count) { [void]$useCases.Rows.Add() }
    for ($r=1; $r -le $useCaseRows.Count; $r++) {
        for ($c=1; $c -le 2; $c++) { $useCases.Cell($r,$c).Range.Text = $useCaseRows[$r-1][$c-1] }
    }

    $members = $doc.Tables.Item(5)
    $memberRows = @(
        @('Data Type', 'Data Name', 'Access Modifiers', 'Initial Value', 'Description'),
        @('SchemaRecord', 'schema_id', 'public/read-only input', 'from manifest', 'Stable schema identifier for a paired family.'),
        @('SchemaRecord', 'tier', 'public/read-only input', '1, 2, or 3', 'Visual-information condition for the ER image.'),
        @('ParsingResult', 'ir', 'pipeline output', 'none', 'Canonical JSON produced by Module 2 and passed to Module 3 only after validation.'),
        @('GenerationResult', 'sql', 'pipeline output', 'none', 'Generated PostgreSQL DDL, separate from immutable source SQL.'),
        @('TestSuite', 'cases', 'deterministic output', 'gold-derived', 'Planned behavioral tests shared across arms for a schema-tier cell.'),
        @('VerificationResult', 'outcomes', 'evaluation input', 'empty', 'DDL execution and per-test PostgreSQL result/SQLSTATE records.')
    )
    while ($members.Rows.Count -lt $memberRows.Count) { [void]$members.Rows.Add() }
    for ($r=1; $r -le $memberRows.Count; $r++) {
        for ($c=1; $c -le 5; $c++) { $members.Cell($r,$c).Range.Text = $memberRows[$r-1][$c-1] }
    }

    $history = $doc.Tables.Item(6)
    $historyRows = @(
        @('#', 'Date', 'Document Version No.', 'Change Description', 'Reason for Change'),
        @('1', '9 Oct 2026', '1.0', 'Completed ER2SQL-specific design, implementation, pilot results, references, and traceability.', 'Populate the capstone low-level design from verified project artifacts.'),
        @('', '', '', '', ''), @('', '', '', '', '')
    )
    while ($history.Rows.Count -lt $historyRows.Count) { [void]$history.Rows.Add() }
    for ($r=1; $r -le $historyRows.Count; $r++) {
        for ($c=1; $c -le 5; $c++) { $history.Cell($r,$c).Range.Text = $historyRows[$r-1][$c-1] }
    }

    $trace = $doc.Tables.Item(7)
    $traceRows = @(
        @('Project Requirement / Research Objective', 'Design / HLD Reference', 'LLD Reference'),
        @('Separate image understanding from SQL generation.', 'Locked plan: canonical IR information bottleneck.', 'Sections 3 and 3.2: Modules 2-3; Module 3 receives IR only.'),
        @('Compare structured and direct generation.', 'Locked plan: experimental architecture ladder.', 'Sections 3.2, 4.1, 4.2: Modules 2-5 vs Module 6.'),
        @('Measure executable relational correctness.', 'Locked plan: deterministic verification and gold-reference tests.', 'Modules 4-5 and results: PostgreSQL DDL, planned tests, CER.'),
        @('Study robustness to reduced visual information.', 'Locked plan: paired Tier 1/2/3 conditions.', 'Sections 1.3 and 4.1: schema-tier pairing and split manifests.'),
        @('Make results reproducible and auditable.', 'Locked plan: freeze prompts, models, and evaluation protocol.', 'Module 7, constraints, implementation/results, and references.'),
        @('Report current progress without overstating evidence.', 'Current protocol and paid-run readiness documents.', 'Section 4.2: exploratory Groq/Mistral pilot metrics and caveats.')
    )
    while ($trace.Rows.Count -lt $traceRows.Count) { [void]$trace.Rows.Add() }
    for ($r=1; $r -le $traceRows.Count; $r++) {
        for ($c=1; $c -le 3; $c++) { $trace.Cell($r,$c).Range.Text = $traceRows[$r-1][$c-1] }
    }
    Write-Output 'project tables filled'

    # Replace the template's generic table-of-contents labels and refresh page numbers.
    $toc = $doc.Tables.Item(2)
    [void]$toc.Rows.Add($toc.Rows.Item(29))
    Write-Output "toc row inserted: $($toc.Rows.Count)"
    $tocLabels = @(
        'Introduction','1.1 Overview','1.2 Purpose','1.3 Scope',
        'Design Constraints, Assumptions, and Dependencies','Design Description',
        '3.1 ER2SQL Pipeline Architecture','3.2 ER2SQL Functional Modules',
        '3.2.1 Description','3.2.2 Use Cases','3.2.3 Class and Data Model',
        '3.2.3.1 SchemaRecord','3.2.3.2 Class Description','3.2.3.3 Data Members',
        '3.2.3.4 Discover and Load Inputs','3.2.3.5 Run Structured and Direct',
        '3.2.3.6 Evaluate and Report','3.2.3.7 ExperimentOrchestrator',
        '3.2.3.8 Description','3.2.3.9 Data Members','3.2.3.10 Prepare Manifest',
        '3.2.3.11 Run and Resume','3.2.3.12 Write Reports',
        '3.2.3.13 Verification and Evaluation Models','3.2.4 Sequence Diagram',
        '3.2.5 Packaging and Deployment Diagram','Proposed Methodology / Approach',
        '4.1 Algorithm and Pseudocode','4.2 Implementation and Results',
        '4.3 Further Exploration Plans and Timelines',
        'Appendix A: Definitions, Acronyms and Abbreviations','Appendix B: References',
        'Appendix C: Record of Change History','Appendix D: Traceability Matrix'
    )
    for ($r=1; $r -le $tocLabels.Count; $r++) {
        Write-Output "toc label before $r"
        $toc.Cell($r,1).Range.Text = $tocLabels[$r-1]
        Write-Output "toc label after $r"
    }

    function Replace-FirstExactParagraph($document, [string]$old, [string]$new) {
        for ($j=1; $j -le $document.Paragraphs.Count; $j++) {
            $range = $document.Paragraphs.Item($j).Range
            $text = $range.Text -replace '[\r\a]',''
            if ($text.Trim() -ceq $old) {
                $range.End = $range.End - 1
                $range.Text = $new
                return
            }
        }
    }
    Replace-FirstExactParagraph $doc 'Master Class Diagram' '3.1 ER2SQL Pipeline Architecture'
    Replace-FirstExactParagraph $doc 'Class Name 1' 'SchemaRecord'
    Replace-FirstExactParagraph $doc 'Method 1' 'Discover and Load Inputs'
    Replace-FirstExactParagraph $doc 'Method 2' 'Run Structured and Direct'
    Replace-FirstExactParagraph $doc 'Method n' 'Evaluate and Report'
    Replace-FirstExactParagraph $doc 'Class Name 2' 'ExperimentOrchestrator'
    for ($j=$doc.Paragraphs.Count; $j -ge 1; $j--) {
        $range = $doc.Paragraphs.Item($j).Range
        $text = $range.Text -replace '[\r\a]',''
        if ($text.Trim() -eq '…' -or $text.Trim() -eq '...') {
            $range.End = $range.End - 1
            $range.Text = ''
        }
    }

    # Remove unrelated book/library example diagrams; retain the original cover artwork.
    for ($i=$doc.Shapes.Count; $i -ge 1; $i--) {
        $shape = $doc.Shapes.Item($i)
        if ($shape.Anchor.Information(3) -ge 5) { $shape.Delete() }
    }

    Write-Output 'removed sample diagrams'
    $doc.Save()
    "Saved $output"
    "Pages=$($doc.ComputeStatistics(2)); Paragraphs=$($doc.Paragraphs.Count); Tables=$($doc.Tables.Count)"
}
finally {
    if ($doc -ne $null) { $doc.Close([ref]$true) }
    $word.Quit()
    [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($word)
}
