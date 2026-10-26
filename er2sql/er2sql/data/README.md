# data/

Placeholder layout. Replace the contents of these folders with your real
files (or point `config/config.yaml` at your actual folders elsewhere on
disk instead of copying anything here -- see the root README's "Wiring in
your data" section).

Expected layout per tier:

```
data/
  tier1/
    diagrams/              <- ER diagram images (.png/.jpg/.jpeg)
    ground_truth_sql/      <- matching ground-truth SQL files (.sql/.ddl/.txt)
  tier2/
    diagrams/
    ground_truth_sql/
  tier3/
    diagrams/
    ground_truth_sql/
```

A diagram file and its ground-truth SQL file are matched by filename stem
(the part before the extension). For example:

```
data/tier1/diagrams/schema_0001.png
data/tier1/ground_truth_sql/schema_0001.sql
```

These two are paired because both have the stem `schema_0001`. The tier
folders are independent of each other -- the same stem should appear in
tier1/tier2/tier3 if you want the paired three-tier robustness comparisons
described in the research plan, but the pipeline itself does not enforce
that; it just processes each tier's matched pairs independently.
