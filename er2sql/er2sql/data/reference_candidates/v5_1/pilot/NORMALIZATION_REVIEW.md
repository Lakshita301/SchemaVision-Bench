# PostgreSQL reference candidates

Candidates are not approved until the PostgreSQL execution and generated-reference checks pass. No source schema was excluded during conversion. No LLM calls.

| Schema | Changes | Blockers | Status |
|---|---:|---:|---|
| schema_0661 | 18 | 0 | policy_candidate_pending_postgres_gate |
| schema_1152_259631 | 6 | 6 | blocked |
| schema_0973_254233 | 2 | 0 | policy_candidate_pending_postgres_gate |
| schema_1175_025608 | 5 | 0 | policy_candidate_pending_postgres_gate |
| schema_0921_180722 | 12 | 0 | policy_candidate_pending_postgres_gate |
| schema_0499 | 5 | 0 | policy_candidate_pending_postgres_gate |
| schema_1264_630818 | 15 | 0 | policy_candidate_pending_postgres_gate |
| schema_0310 | 1 | 0 | policy_candidate_pending_postgres_gate |
| schema_0836 | 3 | 0 | policy_candidate_pending_postgres_gate |
| schema_0778 | 5 | 0 | policy_candidate_pending_postgres_gate |
| schema_0335 | 1 | 0 | policy_candidate_pending_postgres_gate |
| schema_1061_295385 | 15 | 0 | policy_candidate_pending_postgres_gate |
| schema_1008_176453 | 2 | 0 | policy_candidate_pending_postgres_gate |
| schema_0635 | 1 | 0 | policy_candidate_pending_postgres_gate |
| schema_1010_080239 | 23 | 0 | policy_candidate_pending_postgres_gate |
| schema_0909_091015 | 6 | 0 | policy_candidate_pending_postgres_gate |
| schema_1116_107207 | 11 | 0 | policy_candidate_pending_postgres_gate |
| schema_0300 | 0 | 0 | unchanged |
| schema_0937_462804 | 11 | 0 | policy_candidate_pending_postgres_gate |
| schema_0546 | 0 | 0 | unchanged |

## Per-schema conversion/review details

### schema_0661

Source SHA256: `61fdb83731348277be7824657ac02965931fee9b3835e349e72fa0aead172ab5`

Candidate SHA256: `9420f58a96f82ed15b9f5c64645669984dbfe9d9ca0a834bce79007f0856f0cb`

- Change: Applied source ALTER TABLE ADD in source order (ACT_GE_BYTEARRAY).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_EXECUTION).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_IDENTITYLINK).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_TASK).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_VARIABLE).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_JOB).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_EVENT_SUBSCR).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_INCIDENT).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_EXT_TASK).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_BATCH).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_CASE_EXECUTION).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_CASE_SENTRY_PART).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RE_DECISION_DEF).
- Change: Type longvarbinary -> BYTEA; domain/storage differences require review.
- Change: Type double -> DOUBLE PRECISION; domain/storage differences require review.
- Change: Type clob -> TEXT; domain/storage differences require review.
- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_1152_259631

Source SHA256: `270954f708b97db1fecd47f611c89a702a4f61897391b9cfdb951e4bcdce8505`

Candidate SHA256: `7126dca96068c1c53fe1b7916a5c72d1f14a005af3094487d129fd40f3626bbc`

- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_CASE_EXECUTION).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_CASE_SENTRY_PART).
- Change: Type nvarchar2 -> VARCHAR; domain/storage differences require review.
- Change: Type number -> NUMERIC; domain/storage differences require review.
- Change: Type nclob -> TEXT; domain/storage differences require review.
- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.
- Blocker: ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- Blocker: ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'

### schema_0973_254233

Source SHA256: `0ab1525f0e1910d824bfe0ab472aa87004888ae013643132c3d47f15f3675a67`

Candidate SHA256: `effcf814082731504e77be631d076cda2a01d6d561a3878c36f650133cf2a71d`

- Change: Type varchar2 -> VARCHAR; domain/storage differences require review.
- Change: Type number -> NUMERIC; domain/storage differences require review.

### schema_1175_025608

Source SHA256: `1193f4d3bd6bf637846deda2d26af96f5c8e7666b3eee66b1db20665e9f2cbda`

Candidate SHA256: `2e5b160cc470d764bbad8f290a32a801f6f9f728739279fb316edc5b45ea8713`

- Change: Applied source ALTER TABLE ADD in source order (ACT_ID_MEMBERSHIP).
- Change: Applied source ALTER TABLE ADD in source order (ACT_ID_PRIV_MAPPING).
- Change: Type longblob -> BYTEA; domain/storage differences require review.
- Change: Removed collation decoration; collation behavior is out of scope for structural/constraint grading.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_0921_180722

Source SHA256: `13b4546ba3ccede907421e17dbdaae91a80ebcb6792fb226c31da5f8a07255df`

Candidate SHA256: `f12317ce96193e338bba08c435468da65a0376334dc25feab7bed3732e6fbfc0`

- Change: Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.
- Change: Removed integer display width; verify source does not rely on display formatting.
- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Type double -> DOUBLE PRECISION; domain/storage differences require review.
- Change: Type tinyint -> SMALLINT; domain/storage differences require review.
- Change: Column COMMENT literal -> COMMENT ON COLUMN; metadata text retained.
- Change: Removed zero-date default; PostgreSQL has no zero date and source default behavior is excluded.
- Change: Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.
- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.
- Change: Removed physical ENGINE/table encoding option; encoding/collation review required.
- Change: Removed ON UPDATE CURRENT_TIMESTAMP; automatic update behavior is out of scope.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_0499

Source SHA256: `ad706e60b4166f506a333381ec46bd71779f373a8c7df6f237ddeb339988c98f`

Candidate SHA256: `d270df406cbcc0d2aa4f32f319dfa12177c2b86ad00c5043fff91566091ee6a8`

- Change: Applied source ALTER TABLE ADD in source order (employees).
- Change: Applied source ALTER TABLE ADD in source order (salaries).
- Change: Applied source ALTER TABLE ADD in source order (dept_emp).
- Change: Applied source ALTER TABLE ADD in source order (dept_manager).
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_1264_630818

Source SHA256: `6ac1c497f629dbaa17f1c2476bc51bdcbcd7e12d3605ec30c55ccb49b8b61751`

Candidate SHA256: `542e7cc6f576820a9d947e0182d482750f26025f03956dbf2ce13f4d6e2b2d23`

- Change: Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.
- Change: Removed integer display width; verify source does not rely on display formatting.
- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Column COMMENT literal -> COMMENT ON COLUMN; metadata text retained.
- Change: Type tinyint -> SMALLINT; domain/storage differences require review.
- Change: Type datetime -> TIMESTAMP; domain/storage differences require review.
- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.
- Change: Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.
- Change: ENUM -> TEXT with CHECK preserving the exact declared membership values.
- Change: Type enum -> TEXT; domain/storage differences require review.
- Change: Unsigned integer widened to a signed PostgreSQL type; nonnegative CHECK omitted by policy.
- Change: Type int -> BIGINT; domain/storage differences require review.
- Change: Removed physical ENGINE/table encoding option; encoding/collation review required.
- Change: Removed collation decoration; collation behavior is out of scope for structural/constraint grading.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_0310

Source SHA256: `c1d4660aea489f03f0c08ed84570d135fd9c5c12449eac2b18852ccba81a878b`

Candidate SHA256: `f20324d164484c982dbbd8d20bad94bb0ab9a4b22d1a6d938db2b43409bce5e2`

- Change: Quoted reserved bare identifier using its PostgreSQL lowercase-folded spelling.

### schema_0836

Source SHA256: `fb13bcdc933dfa22bbe5190412baabda89a5093124f09e66682c02fa30b2c827`

Candidate SHA256: `b9d868963a1353356cb25fbe877d9d07e4e95fef3d3f45bce968354a7e771ff9`

- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Type blob -> BYTEA; domain/storage differences require review.
- Change: Type datetime -> TIMESTAMP; domain/storage differences require review.

### schema_0778

Source SHA256: `4dc19c560f94a818ade2814c119e69830b94552868c0082c6978fd93db4de4b0`

Candidate SHA256: `6fa76bc2252350fa02cac245325faf2f3f9e26da4aad3b6c1623ab3478ebb0b3`

- Change: Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.
- Change: Removed integer display width; verify source does not rely on display formatting.
- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.
- Change: Removed physical ENGINE/table encoding option; encoding/collation review required.

### schema_0335

Source SHA256: `a274b2a8023275fc1c1e4ebd8fdf750d0aa73f141025ed9caac98fff8451bfbf`

Candidate SHA256: `d805b94f271077b6c42714cd9015f9c4b174757f9f4367f6fa241d35e12a2507`

- Change: Removed physical ENGINE/table encoding option; encoding/collation review required.

### schema_1061_295385

Source SHA256: `f95d7d63909cc7ccf0b6163ca22b6fa87c6789cf0c471ba1f368eb8ba14308ff`

Candidate SHA256: `826a32ff95a990660bfd18bf3a39939790fa895ae2ac9144a80989cf317c709d`

- Change: Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.
- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.
- Change: DOUBLE precision/scale mapped to DOUBLE PRECISION; rounding behavior is out of scope.
- Change: Type double -> DOUBLE PRECISION; domain/storage differences require review.
- Change: Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.
- Change: Unsigned integer widened to a signed PostgreSQL type; nonnegative CHECK omitted by policy.
- Change: Removed integer display width; verify source does not rely on display formatting.
- Change: Type bigint -> NUMERIC; domain/storage differences require review.
- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Type longtext -> TEXT; domain/storage differences require review.
- Change: Type int -> BIGINT; domain/storage differences require review.
- Change: Type tinyint -> SMALLINT; domain/storage differences require review.
- Change: Type datetime -> TIMESTAMP; domain/storage differences require review.
- Change: Removed collation decoration; collation behavior is out of scope for structural/constraint grading.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_1008_176453

Source SHA256: `17520233573695cfe0b22ca0272265ef144a00c6748b6a292ab49793bc9877c8`

Candidate SHA256: `d43ce00fb89249d02e7ee944c59f38aeabc4062a7e79763fa893da8087579c1a`

- Change: Type blob -> BYTEA; domain/storage differences require review.
- Change: Removed integer display width; verify source does not rely on display formatting.

### schema_0635

Source SHA256: `453d553afd78ebb5a34b0ce3932184232ae1006d586f76056c4b10f42a247874`

Candidate SHA256: `0e253fbf310cde1e5cd6299fd99920a960a48b0bbd9c502be1031a6c45adad1e`

- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.

### schema_1010_080239

Source SHA256: `0e3fb2d45102a96b4ac79e09305596d80dc43d1b74b6a9c3085b3e4813a7b465`

Candidate SHA256: `e53e02404eaea7a0634f3cf19137e8d563c25f9a645e9e74645ac5974198939b`

- Change: Applied source ALTER TABLE ADD in source order (application_attachments).
- Change: Applied source ALTER TABLE ADD in source order (citizen_invoice).
- Change: Applied source ALTER TABLE ADD in source order (application_bank_transaction_detail).
- Change: Applied source ALTER TABLE ADD in source order (vehicle_inspection).
- Change: Applied source ALTER TABLE ADD in source order (application_tax_detail).
- Change: Applied source ALTER TABLE ADD in source order (slot_applications).
- Change: Applied source ALTER TABLE ADD in source order (application_form_data).
- Change: Applied source ALTER TABLE ADD in source order (questionnaire_feedback).
- Change: Applied source ALTER TABLE ADD in source order (citizen_address_outside_ap).
- Change: Applied source ALTER TABLE ADD in source order (citizen_address).
- Change: Applied source ALTER TABLE ADD in source order (license_permit_details_history).
- Change: Applied source ALTER TABLE ADD in source order (question_options).
- Change: Applied source ALTER TABLE ADD in source order (transaction_history).
- Change: Applied source ALTER TABLE ADD in source order (ot_token).
- Change: Applied source ALTER TABLE ADD in source order (application_fee_detail).
- Change: Applied source ALTER TABLE ADD in source order (license_permit_details).
- Change: Applied source ALTER TABLE ADD in source order (pending_username).
- Change: Applied source ALTER TABLE ADD in source order (rta_office_test_config).
- Change: Applied source ALTER TABLE ADD in source order (license_holder_approved_details).
- Change: Applied source ALTER TABLE ADD in source order (application_approval_history).
- Change: Applied source ALTER TABLE ADD in source order (application).
- Change: Type double -> DOUBLE PRECISION; domain/storage differences require review.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_0909_091015

Source SHA256: `009c991c5578fa388c9ee796f93fb67ba3c8790fd4105902b361a601bc9308f0`

Candidate SHA256: `e386d6fc2138f56759da4ff578303e49e937299f94f8c47186cab25fd3c7321b`

- Change: Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.
- Change: Removed integer display width; verify source does not rely on display formatting.
- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.
- Change: Removed physical ENGINE/table encoding option; encoding/collation review required.
- Change: Removed ON UPDATE CURRENT_TIMESTAMP; automatic update behavior is out of scope.

### schema_1116_107207

Source SHA256: `3352063d21dd4bbd809a202e688b0054b8bd0c4c3051a7bd96dc5b5a9cbe9540`

Candidate SHA256: `60cc9394ad61d2381f1503d6f1d91dea793e409292ba4df417ab6de9b7bc0459`

- Change: Backtick identifier -> PostgreSQL lowercase-folded identifier; quoting retained only for reserved/syntactically unusual/colliding names.
- Change: Removed integer display width; verify source does not rely on display formatting.
- Change: Identity spelling -> GENERATED BY DEFAULT AS IDENTITY; source seed/increment retained when explicit. NULL/zero, explicit-value sequence advancement and exhaustion differ across engines; review required.
- Change: Named/unnamed UNIQUE KEY/INDEX -> unnamed UNIQUE constraint; exact ordered columns retained.
- Change: Unnamed index translation: inline KEY/INDEX and USING BTREE/HASH -> standalone unnamed PostgreSQL index; columns retained.
- Change: Type tinyint -> SMALLINT; domain/storage differences require review.
- Change: Type mediumint -> INTEGER; domain/storage differences require review.
- Change: Type longtext -> TEXT; domain/storage differences require review.
- Change: Removed physical ENGINE/table encoding option; encoding/collation review required.
- Change: Removed collation decoration; collation behavior is out of scope for structural/constraint grading.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

### schema_0937_462804

Source SHA256: `e536578092c7349c17a7632f768446dac885dee09485f790218de3648e1d7556`

Candidate SHA256: `ca7ec8ef8a391d99802c97affe624d0b7ff5f83de30cb6d4e4ff005627cd8195`

- Change: Applied source ALTER TABLE ADD in source order (ACT_GE_BYTEARRAY).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_EXECUTION).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_IDENTITYLINK).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_TASK).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_VARIABLE).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_JOB).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RU_EVENT_SUBSCR).
- Change: Applied source ALTER TABLE ADD in source order (ACT_RE_MODEL).
- Change: Applied source ALTER TABLE ADD in source order (ACT_PROCDEF_INFO).
- Change: Type double -> DOUBLE PRECISION; domain/storage differences require review.
- Change: Installed FKs after additive table/key definitions to support forward/cyclic declarations; targets, columns and actions retained; no FK or key was added or removed.

