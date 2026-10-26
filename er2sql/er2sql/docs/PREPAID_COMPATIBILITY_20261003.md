# Pre-paid compatibility and protocol status — 3 October 2026

No LLM calls. Model purchases/profiles remain deferred. Original SQL/images,
schema selection and historical Groq outputs were not changed.

## 1. Refreshed evaluator/reference compatibility

Both manifests now point to fresh, complete audits of the existing dataset.
These are reference/harness diagnostics, **not model results** or a visual audit.
Tier 2/3 information removal is intentional and is not a failure criterion.

| Selected split | IDs checked | Raw SQL compiles in PostgreSQL | Full reference gate passes | DDL failures | Compiles but unresolved |
|---|---:|---:|---:|---:|---:|
| Pilot | 20 | 4 | 4 | 16 | 0 |
| Final | 618 | 100 | 96 | 518 | 4 |

Evidence: [pilot details](audits/pilot_compatibility_20261003.md),
[final details](audits/final_compatibility_20261003.md), and adjacent JSON files.
Audits record exact source/protocol/plan hashes and PostgreSQL SQLSTATEs.
Source SQL is shared byte-for-byte across selected tiers; it is checked once per ID.
The pre-fix final audit passed 89/618; after evaluator fixes it passes 96/618.

### Evaluator-side fixes made

- Preserve forced NULL/invalid values instead of overwriting them during composite
  FK fixture construction.
- Reuse consistent parent values when FKs overlap; perturb target-private columns
  to isolate invalid-parent tests. Fully overlapping cases without an isolated
  witness are warned, rather than counting another FK's error as success.
- Break fixture cycles through nullable FK edges, without changing the schema.
- Fit numeric CHECK witnesses to precision/scale and support string LENGTH and
  CHAR_LENGTH predicates with bounded deterministic witnesses.
- Model SET NULL + NOT NULL correctly: the delete must be rejected by the intended
  NOT NULL constraint, rather than expecting an impossible successful nullification.
- Recognize a gold-declared PK that already entails a redundant gold UNIQUE tuple,
  while continuing to reject unrelated PK/UNIQUE errors as evidence.

59 local tests pass with real PostgreSQL integration enabled. The nine mutation
variants and fifteen independent controls also pass. Verification is now
`target_attribution_v4`; old model verifications remain historical until backfilled.

Evidence-path resolution is now deterministic before and after audit files are
created. A regression test prevents file existence from changing plan identity;
the local audits were regenerated after this fix.

### What remains unresolved — do not label as model errors

The 518 final raw-DDL failures comprise 388 syntax errors (42601), 88 undefined
object/type errors (42704), 21 invalid FK-definition errors (42830), and 21 other
DDL errors. These counts are PostgreSQL diagnostic classes, not a claim that
every source is invalid in its original SQL dialect. Many sources use MySQL,
SQL Server or Oracle constructs. All 16 pilot failures are DDL failures (13
syntax, 3 undefined object/type).

Four final references compile but do not clear the complete gate:

| ID | Remaining limitation |
|---|---|
| schema_0521 | Explicit `public` namespace and unsupported referential semantics; the isolated verifier cannot currently bind/test this reference correctly. |
| schema_0984_334739 | Executed tests pass (78/78), but one fully overlapping FK lacks an isolated invalid-parent witness. |
| schema_1101_650753 | Executed tests pass (152/152), but two fully overlapping FKs lack isolated invalid-parent witnesses. |
| schema_1224_512880 | Unsupported LIKE predicates and failing fixtures; semantics must be reviewed, not replaced with guessed CHECKs. |

Parser/generator warnings occur for 47 final IDs, overlapping DDL failures;
this count is not an additional disjoint set. No warning was waived and no
schema/constraint was silently excluded from the readiness decision.

**Item 1 status: recheck and the listed fixes are done; whole-corpus compatibility
is still blocked.** Clearing it requires further supported-semantics work and/or
reviewed PostgreSQL references. Changing eligibility or source meaning requires
explicit approval and a versioned amendment. Upstream differences alone do not
justify altering the existing benchmark or rerunning Module 1.

## 3. Experimental rules frozen

[Protocol document](PAPER_EXPERIMENT_PROTOCOL.md), backed by
`config/paper_protocol_v1.yaml`, is pinned in both paper manifests:

`616cde5737584d650e967966dcc8045efcbec32a8944f515f625cf3a4bc974c3`

It freezes the structured/direct comparison, exact tier meaning, unchanged split,
failure/attempt policies, primary macro all-artifact CER and mandatory companion
metrics, paired tier contrasts, schema-clustered bootstrap, descriptive/no-p-value
claim policy, and no-automatic-exclusion rule. Future model roster/configuration
is intentionally deferred. Code checks the protocol hash and includes it in run
provenance and reproducibility bundles. Changing it requires an explicit amendment.

This is internal prospective documentation, not external preregistration, proof
of arbitrary SQL equivalence, or a guarantee of publication/citability.

## 5. Why an existing PostgreSQL database is not the whole safety requirement

A read-only role check confirmed `er2sql_test` uses role `postgres`, with
`superuser=true`, `can_create_databases=true`, and `can_create_roles=true`.
No credentials were printed and no account permissions were changed.

The database exists and works. The concern is that a superuser can do much more
than create temporary verification tables. Before model-generated SQL execution,
use a dedicated non-superuser role in a disposable test database with only the
needed privileges, ideally on an isolated PostgreSQL instance. Transaction
rollback is useful test isolation, not a security sandbox. Account/database
changes require approval; this task only inspected the existing role.
