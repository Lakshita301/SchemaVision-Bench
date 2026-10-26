# ER2SQL prompt freeze

Freeze label: `paper-pilot-v1`  
Freeze date: 30 September 2026

The paid pilot and final test-set runs must use these prompt sources unchanged:

| Stage | Source | SHA-256 |
|---|---|---|
| Module 2 visual parsing | `src/er2sql/module2_parsing/prompts.py` | `e211b03463832867c6ba60adaca157afc970a361e0dddeab6131b3fef2b4486e` |
| Module 3 IR-to-SQL | `src/er2sql/module3_generation/prompts.py` | `abecde8680a5b9a6201927aa26c9c408296ad3222165cf57a4dc66555a5a9815` |
| Module 6 direct baseline | `src/er2sql/module6_direct_baseline/prompts.py` | `fbd0e21b60136fc18a9de5fc803995bf926a8cf96adc6b5fcef92e7d6d670afd` |

The experiment orchestrator recomputes these hashes, includes them in the
resolved manifest, and copies the exact prompt source files into the run's
`provenance/prompts/` directory. Any prompt change requires a new freeze label
and a new experiment output root; it must not be silently mixed into an
existing evaluation.
