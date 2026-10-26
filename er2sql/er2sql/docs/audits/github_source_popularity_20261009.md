# GitHub source-repository popularity screen

- Review date: 2026-10-09
- Coverage: 714 schemas from 685 distinct GitHub repositories
- Repository metadata found: 681/685; unavailable: 4
- This is a source-popularity screen, not proof of model training exposure.

## What I checked

I queried GitHub's public repository metadata for the source repositories recorded in the provenance file. For repositories that had moved, I followed GitHub's canonical repository name. Star counts are a snapshot from the review date; they do not tell us how popular a schema was when collected or what appeared in a model's training data.

I also searched the local original SQL and recorded source details for the three named sample databases in the locked plan (Sakila, Chinook, and Northwind), and checked for distinctive clusters of their table names. I found no name or table-signature matches in the local collection. This is a targeted screen, not a guarantee that every possible public schema variant was identified.

## Repository popularity results

Among the 681 repositories with metadata:

- 503 have zero stars.
- 142 have 1–9 stars.
- 26 have 10–99 stars.
- 10 have at least 100 stars.
- 0 have at least 1,000 stars.
- The highest count was 752 stars.

Repositories with at least 100 stars and their included schema files:

| Repository | Stars on review date | Schema ID |
|---|---:|---|
| [javaee/glassfish](https://github.com/javaee/glassfish) | 752 | schema_0620 |
| [cmu-db/benchbase](https://github.com/cmu-db/benchbase) | 686 | schema_0799 |
| [apavlo/h-store](https://github.com/apavlo/h-store) | 597 | schema_0284 |
| [magarena/magarena](https://github.com/magarena/magarena) | 446 | schema_0901_196592 |
| [v5tech/spring-quartz-cluster-sample](https://github.com/v5tech/spring-quartz-cluster-sample) | 325 | schema_1309_516625 |
| [usvn/usvn](https://github.com/usvn/usvn) | 175 | schema_0367 |
| [BG-IT-Edu/School-Programming](https://github.com/BG-IT-Edu/School-Programming) | 166 | schema_0247 |
| [yemreak/iuc-ce](https://github.com/yemreak/iuc-ce) | 156 | schema_1045_476826 |
| [PacktPublishing/Python-GUI-Programming-with-Tkinter-2E](https://github.com/PacktPublishing/Python-GUI-Programming-with-Tkinter-2E) | 140 | schema_0984_334739 |
| [webx/citrus-sample](https://github.com/webx/citrus-sample) | 114 | schema_0585 |

## Schema-level findings

- **Sakila, Chinook, and Northwind:** no matches found in the local source names or the targeted table-signature screen.
- **TPC-C:** `schema_0799` from `cmu-db/benchbase` and `schema_0955_026069` from `alandzq/oltpbench-ii` contain the recognizable standard TPC-C tables. These are benchmark-workload risk flags, although they are not Sakila, Chinook, or Northwind.
- **Quartz scheduler:** `schema_1008_176453`, `schema_1023_473037`, and `schema_1309_516625` contain the standard `QRTZ_*` tables from three public repositories. These are common software/framework schema risk flags, not proof of model exposure.
- The other high-star repositories contain application, project, or educational schemas; repository stars alone do not establish that their SQL schema is widely memorized.

## Remaining uncertainty

Four source repositories returned GitHub 404 responses and could not be popularity-checked: `cstuhlfire/employeetracker`, `dimitrov9/newmansexercise`, `rixonmathew/evaluator`, and `zhangshaoyi1/java`. They remain unknown.

This screen does not complete the 714-row provenance and schema-family review. The full contamination audit therefore remains incomplete, and the paid-run gate remains blocked. The results should be used to update the risk review before any paid run; do not claim zero contamination risk.
