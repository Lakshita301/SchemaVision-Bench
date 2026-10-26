# Protocol v4 reference eligibility

Local PostgreSQL gate only; zero LLM calls. Exclusions are determined from source/reference evidence before model evaluation. No replacement IDs were selected.

Frozen source split SHA-256: `1694e92b0fef58f838e999fa459dee4c1badb302adb9f0a8866a492e7896ae30`

| Phase | Frozen IDs | Eligible | Excluded |
|---|---:|---:|---:|
| pilot | 20 | 8 | 12 |

## Pilot exclusion details

### schema_0213

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "userdata"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/181 passed.

### schema_0412

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/219 passed.

### schema_0517

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "status_type" does not exist
LINE 8: ...id SERIAL PRIMARY KEY, project_id INTEGER, status status_typ...
                                                             ^
- Generated checks: 0/22 passed.

### schema_0574

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/128 passed.

### schema_0582

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COL...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/161 passed.

### schema_0997_686478

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "engine"
LINE 12: )engine=innodb;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/180 passed.

### schema_1052_673818

- Categories: changed_reference_not_eligible_for_policy_approval, malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure
- Converter blocker: Ambiguous integer precision/scale: no type inferred.
- Converter blocker: Could not determine data type for 'empty_types.et_id'.
- Converter blocker: Could not determine data type for 'empty_types.data1'.
- Converter blocker: Could not determine data type for 'empty_types.data2'.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 92:     n_dprecission DOUBLE PRECISION precision     null,
                                            ^
- Gate warning: Could not determine data type for 'empty_types.et_id'.
- Gate warning: Could not determine data type for 'empty_types.data1'.
- Gate warning: Could not determine data type for 'empty_types.data2'.
- Gate warning: Normalization blocker: Ambiguous integer precision/scale: no type inferred.
- Gate warning: Normalization blocker: Could not determine data type for 'empty_types.et_id'.
- Gate warning: Normalization blocker: Could not determine data type for 'empty_types.data1'.
- Gate warning: Normalization blocker: Could not determine data type for 'empty_types.data2'.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/156 passed.

### schema_1211_489168

- Categories: changed_reference_not_eligible_for_policy_approval, conflicting_duplicate_source_table_definitions, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 't2'; authoritative definition is ambiguous.
- Converter blocker: Unresolved engine template token; left unchanged.
- Converter blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 6: ENGINE = $engine_type;
        ^
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 't2'; authoritative definition is ambiguous.
- Gate warning: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: No isolated invalid-parent witness for FK t2.['f_id'] -> t1: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK t2.['f_id'] -> t1: no target-private columns or independent sibling parent.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't2'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Unresolved engine template token; left unchanged.
- Gate warning: Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/23 passed.

### schema_1212_302296

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/530 passed.

### schema_1277_676595

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 76: ) ENGINE=innodb DEFAULT CHARACTER SET utf8 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/247 passed.

### schema_1281_497780

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 71: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/378 passed.

### schema_1316_174202

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "FOREIGN"
LINE 95:  FOREIGN KEY (PaymentTypeId) REFERENCES PaymentType(Id),
          ^
- Gate warning: Unsupported CHECK expression on 'Administrator': 'len(password) >= 6' (unsupported CHECK operator)
- Gate warning: No isolated invalid-parent witness for FK Payment.['MemberId'] -> PaymentType: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Payment.['MemberId'] -> Member: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/124 passed.

| final | 618 | 267 | 351 |

## Final exclusion details

### schema_0164

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit, unresolved_source_alter_operation
- Converter blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY fk_manager_id'
- Converter blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY checkin_ibfk_4'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "FOREIGN"
LINE 73: ALTER TABLE venue DROP FOREIGN KEY fk_manager_id;
                                ^
- Gate warning: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY checkin_ibfk_4'
- Gate warning: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- Gate warning: No isolated invalid-parent witness for FK checkin.['indi_id'] -> individual: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK checkin.['indi_id'] -> individual: no target-private columns or independent sibling parent.
- Gate warning: Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY fk_manager_id'
- Gate warning: Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY checkin_ibfk_4'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY checkin_ibfk_4'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/74 passed.

### schema_0173

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/37 passed.

### schema_0181

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "admin"
- Gate warning: Unsupported CHECK expression on 'CUSTOMER': '(Admin_Assisstance_Feedback)>=0 AND (Admin_Assisstance_Feedback)<=5' (unsupported CHECK operator)
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/112 passed.

### schema_0183

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY article_ibfk_1'
- Converter blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY comments_ibfk_2'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "FOREIGN"
LINE 42: ALTER TABLE article DROP FOREIGN KEY article_ibfk_1;
                                  ^
- Gate warning: Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY article_ibfk_1'
- Gate warning: Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'DROP FOREIGN KEY comments_ibfk_2'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/39 passed.

### schema_0184

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/91 passed.

### schema_0185

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42703`
- DDL error: column "G" does not exist
LINE 12:     CHECK (rating = "G" OR rating = "PG" OR rating = "PG-13"...
                             ^
- Gate warning: Unsupported CHECK expression on 'Movie': 'rating = "G" OR rating = "PG" OR rating = "PG-13" OR rating = "R" OR rating = "NC-17"' (unknown column)
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/139 passed.

### schema_0191

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/530 passed.

### schema_0193

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/105 passed.

### schema_0195

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 21: ) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/287 passed.

### schema_0196

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 193: ) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/719 passed.

### schema_0204

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/219 passed.

### schema_0207

- Categories: changed_reference_not_eligible_for_policy_approval, malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure
- Converter blocker: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Converter blocker: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Converter blocker: Duplicate column names in 'campground'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "02"
LINE 33:     02=February,
             ^
- Gate warning: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Gate warning: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Gate warning: Duplicate column names in 'campground'
- Gate warning: Normalization blocker: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Gate warning: Normalization blocker: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Gate warning: Normalization blocker: Duplicate column names in 'campground'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/62 passed.

### schema_0208

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "titles" does not exist
LINE 5:     title titles,
                  ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/57 passed.

### schema_0210

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "/"
LINE 11: )/
          ^
- Gate warning: Conflicting overlapping FK parent fixture for 'UM_ROLE'.
- Gate warning: Conflicting overlapping FK parent fixture for 'UM_ROLE'.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/405 passed.

### schema_0217

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 33:     PRICE DOUBLE PRECISION PRECISION NOT NULL,
                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/67 passed.

### schema_0219

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "users_tb"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/31 passed.

### schema_0220

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/46 passed.

### schema_0225

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 8:     payment varchar(200) CHARACTER SET utf8 DEFAULT NULL,
                                 ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/104 passed.

### schema_0229

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/219 passed.

### schema_0230

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "string" does not exist
LINE 18:     profile STRING
                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/62 passed.

### schema_0238

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22008`
- DDL error: date/time field value out of range: "0000-00-00 00:00:00"
LINE 19:     edited_stamp timestamp NOT NULL DEFAULT '0000-00-00 00:0...
                                                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/60 passed.

### schema_0247

- Categories: changed_reference_not_eligible_for_policy_approval, conflicting_duplicate_source_table_definitions, postgresql_ddl_execution_failure
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'students'; authoritative definition is ambiguous.
- Converter blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- PostgreSQL SQLSTATE: `42P07`
- DDL error: relation "students" already exists
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'students'; authoritative definition is ambiguous.
- Gate warning: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Unresolved or ambiguous constraint identifier: 'major_id'
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'students'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/117 passed.

### schema_0255

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/36 passed.

### schema_0266

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     uuid varchar(255) CHARACTER SET utf8mb4 NOT NULL,
                              ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/203 passed.

### schema_0267

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "events"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/151 passed.

### schema_0269

- Categories: postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "service_reservation"
- Gate warning: No isolated invalid-parent witness for FK ROOM_REVIEW.['HotelID', 'RoomNo'] -> ROOM: a sibling relationship already guarantees the target parent.
- Gate warning: No isolated invalid-parent witness for FK SERVICE_REVIEW.['HotelID', 'Stype'] -> SERVICE: a sibling relationship already guarantees the target parent.
- Gate warning: No isolated invalid-parent witness for FK BREAKFAST_REVIEW.['HotelID', 'Btype'] -> BREAKFAST: a sibling relationship already guarantees the target parent.
- Generated checks: 0/226 passed.

### schema_0272

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 20: ) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/211 passed.

### schema_0273

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 37: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/430 passed.

### schema_0275

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42710`
- DDL error: constraint "cust_ref_info_pk" for relation "customer_reference_information" already exists
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/40 passed.

### schema_0277

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "restaurants"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/92 passed.

### schema_0279

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `22008`
- DDL error: date/time field value out of range: "0000-00-00 00:00:00"
LINE 97: ...ads_latest_update_date timestamp NOT NULL DEFAULT '0000-00-0...
                                                              ^
- Gate warning: No isolated invalid-parent witness for FK image_job.['ads_id'] -> ads_job: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK image_job.['ads_id'] -> ads_job: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK report_ads.['report_id'] -> report: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK report_ads.['report_id'] -> report: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK report_ads.['report_id'] -> report: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/318 passed.

### schema_0280

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 33:     PRICE DOUBLE PRECISION PRECISION NOT NULL,
                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/67 passed.

### schema_0281

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 79: ) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 PACK_KEYS=0 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/165 passed.

### schema_0284

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "bin" does not exist
LINE 19:     chunk bin(127)
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/18 passed.

### schema_0285

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/33 passed.

### schema_0290

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22023`
- DDL error: identity column type must be smallint, integer, or bigint
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/857 passed.

### schema_0292

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "pagina"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/278 passed.

### schema_0293

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "photo"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/144 passed.

### schema_0320

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/462 passed.

### schema_0327

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `3F000`
- DDL error: schema "cloud" does not exist
LINE 4: CREATE TABLE cloud.users (
                     ^
- Generated checks: 0/23 passed.

### schema_0328

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 112:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/157 passed.

### schema_0329

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 73:     lat DOUBLE PRECISION precision,
                                  ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/183 passed.

### schema_0332

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 9:     cost DOUBLE PRECISION precision,
                                  ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/61 passed.

### schema_0338

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "disability" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/142 passed.

### schema_0339

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ","
LINE 61:     Interest float(10,2) not null,
                              ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/158 passed.

### schema_0343

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLAT...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/127 passed.

### schema_0348

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/523 passed.

### schema_0349

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "acct_role"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/33 passed.

### schema_0353

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHAR"
LINE 5:     ATTRIBUTE_NAME VARCHAR(255 CHAR),
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/938 passed.

### schema_0366

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "created_on" is of type timestamp without time zone but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/98 passed.

### schema_0367

- Categories: changed_reference_not_eligible_for_policy_approval, malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure
- Converter blocker: Could not determine data type for 'usvn_groups_to_files_rights.files_rights_id'.
- Converter blocker: Could not determine data type for 'usvn_groups_to_projects.groups_id'.
- Converter blocker: Could not determine data type for 'usvn_users_to_groups.users_id'.
- Converter blocker: Could not determine data type for 'usvn_users_to_projects.users_id'.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ","
LINE 18:     files_rights_id,
                            ^
- Gate warning: Could not determine data type for 'usvn_groups_to_files_rights.files_rights_id'.
- Gate warning: Could not determine data type for 'usvn_groups_to_projects.groups_id'.
- Gate warning: Could not determine data type for 'usvn_users_to_groups.users_id'.
- Gate warning: Could not determine data type for 'usvn_users_to_projects.users_id'.
- Gate warning: Normalization blocker: Could not determine data type for 'usvn_groups_to_files_rights.files_rights_id'.
- Gate warning: Normalization blocker: Could not determine data type for 'usvn_groups_to_projects.groups_id'.
- Gate warning: Normalization blocker: Could not determine data type for 'usvn_users_to_groups.users_id'.
- Gate warning: Normalization blocker: Could not determine data type for 'usvn_users_to_projects.users_id'.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/73 passed.

### schema_0368

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/52 passed.

### schema_0371

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Normalization blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/216 passed.

### schema_0372

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "specialties"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/80 passed.

### schema_0375

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "#"
LINE 3: #auto_increment=0，但是只能后续设置
        ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/253 passed.

### schema_0376

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/102 passed.

### schema_0377

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/219 passed.

### schema_0384

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 18:  INDEX (socialSecurityNumber),
                ^
- Generated checks: 0/54 passed.

### schema_0392

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "Type"
LINE 15: )Type=InnoDB;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/75 passed.

### schema_0393

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "gender"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/40 passed.

### schema_0398

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "tb_user"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/105 passed.

### schema_0400

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "terminal"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/48 passed.

### schema_0402

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 4:     username varchar(45) CHARACTER SET utf8 NOT NULL,
                                 ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/30 passed.

### schema_0403

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "member" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/119 passed.

### schema_0405

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/118 passed.

### schema_0406

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 223:     area_pct DOUBLE PRECISION precision CHECK(area_pct BETWE...
                                        ^
- Gate warning: Unsupported CHECK expression on 'soil_component': 'coalesce(frac_vfine, 0) + coalesce(frac_fine, 0) + coalesce(frac_med, 0) +\n           coalesce(frac_coarse, 0) + coalesce(frac_vcoarse, 0) BETWEEN 0 AND 1' (unsupported CHECK token)
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/570 passed.

### schema_0409

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 134:     threshold DOUBLE PRECISION precision,
                                         ^
- Gate warning: Unsupported CHECK expression on 'eth_receipts': '((octet_length(tx_hash) = 32) AND (octet_length(block_hash) = 32))' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'eth_tx_attempts': "(((state = 'in_progress'::public.eth_tx_attempts_state) AND (broadcast_before_block_num IS NULL)) OR (state = 'broadcast'::public.eth_tx_attempts_state))" (unsupported CHECK token)
- Gate warning: Unsupported CHECK expression on 'eth_tx_attempts': '(octet_length(hash) = 32)' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'eth_tx_attempts': '(octet_length(signed_raw_tx) > 0)' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'eth_txes': "(broadcast_at > '2019-01-01 00:00:00+00'::timestamp with time zone)" (unsupported CHECK token)
- Gate warning: Unsupported CHECK expression on 'eth_txes': "(((state = 'unstarted'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'in_progress'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'fatal_error'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NOT NULL) AND (broadcast_at IS NULL))) OR ((state = 'unconfirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))) OR ((state = 'confirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))))" (unsupported CHECK token)
- Gate warning: Unsupported CHECK expression on 'eth_txes': '(octet_length(from_address) = 20)' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'eth_txes': '(octet_length(to_address) = 20)' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'heads': '(octet_length(hash) = 32)' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'heads': '(octet_length(parent_hash) = 32)' (unsupported CHECK operator)
- Gate warning: Unsupported CHECK expression on 'keys': '(octet_length(address) = 20)' (unsupported CHECK operator)
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/456 passed.

### schema_0415

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42883`
- DDL error: operator does not exist: boolean = integer
LINE 44:     CHECK (locked IN (0, 1)),
                           ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
- Gate warning: No isolated invalid CHECK witness for instances: 'locked IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for instances: 'deleted IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for networks: 'injected IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for networks: 'deleted IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for fixed_ips: 'reserved IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for fixed_ips: 'allocated IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for fixed_ips: 'leased IN (0, 1)'
- Gate warning: No isolated invalid CHECK witness for fixed_ips: 'deleted IN (0, 1)'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/91 passed.

### schema_0434

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 163: ) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/578 passed.

### schema_0436

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "user_info"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/150 passed.

### schema_0438

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `3F000`
- DDL error: schema "container" does not exist
LINE 4: CREATE TABLE CONTAINER.ASSIGNMENT (
                     ^
- Generated checks: 0/52 passed.

### schema_0440

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/130 passed.

### schema_0443

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/62 passed.

### schema_0449

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/45 passed.

### schema_0454

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "tbls"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/432 passed.

### schema_0465

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "_gender" does not exist
LINE 8:  gtype _GENDER NOT NULL,
               ^
- Generated checks: 0/91 passed.

### schema_0469

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "KEY"
LINE 34:     constraint ra_uk_cons_name UNIQUE KEY (ra_name),
                                               ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/149 passed.

### schema_0470

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 14: ...comment_date timestamp NOT NULL DEFAULT current_timestamp(),
                                                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/124 passed.

### schema_0471

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/218 passed.

### schema_0490

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "approved" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/179 passed.

### schema_0491

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "question"
- Gate warning: No isolated invalid-parent witness for FK answer.['question_id'] -> question: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK answer.['question_id'] -> question: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK comment.['answer_id'] -> answer: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK comment.['question_id'] -> question: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK comment.['question_id'] -> question: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK comment.['answer_id'] -> answer: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK question_tag.['question_id'] -> question: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK question_tag.['tag_id'] -> tag: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK question_tag.['question_id'] -> question: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK question_tag.['tag_id'] -> tag: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/49 passed.

### schema_0493

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=227032 DEFAULT CHARSET=latin1...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/486 passed.

### schema_0505

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: foreign key constraint "employees_role_id_fkey" cannot be implemented
DETAIL:  Key columns "role_id" of the referencing table and "id" of the referenced table are of incompatible types: character varying and integer.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/26 passed.

### schema_0507

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/239 passed.

### schema_0511

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/136 passed.

### schema_0512

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "archival_institution"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/459 passed.

### schema_0518

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "identity" does not exist
LINE 162:     LOG_NR_ identity,
                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/217 passed.

### schema_0521

- Categories: changed_reference_not_eligible_for_policy_approval, reference_test_generation_or_evaluator_limit
- Converter blocker: Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).
- Gate warning: Normalization blocker: Unsupported constraint semantics require review (MATCH, SET DEFAULT, EXCLUDE or NULLS NOT DISTINCT).
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 54/54 passed.

### schema_0527

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 48:     installation_key varchar(32) CHARACTER SET latin1 NOT NU...
                                          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/278 passed.

### schema_0530

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/116 passed.

### schema_0535

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/293 passed.

### schema_0549

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 13:     date date NOT NULL DEFAULT current_timestamp()
                                                          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/89 passed.

### schema_0551

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 180:     amount DOUBLE PRECISION precision,
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/200 passed.

### schema_0552

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 CO...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/45 passed.

### schema_0555

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 69: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/212 passed.

### schema_0560

- Categories: postgresql_ddl_execution_failure
- Converter blocker: Unresolved or ambiguous constraint identifier: 'shostid1'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'shostid2'
- PostgreSQL SQLSTATE: `42703`
- DDL error: column "shostid1" referenced in foreign key constraint does not exist
- Gate warning: Unresolved or ambiguous constraint identifier: 'shostid1'
- Gate warning: Unresolved or ambiguous constraint identifier: 'shostid2'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'shostid1'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'shostid2'
- Generated checks: 0/552 passed.

### schema_0566

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/98 passed.

### schema_0567

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "auth_permission"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/177 passed.

### schema_0570

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 71: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/481 passed.

### schema_0571

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "idx_attachment_fulltext"
LINE 21:     FULLTEXT KEY idx_attachment_fulltext (string_content)
                          ^
- Gate warning: No isolated invalid-parent witness for FK candidate_work_flow_event.['exam_link'] -> exam_link: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK candidate_work_flow_event.['exam_link'] -> exam_link: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/566 passed.

### schema_0578

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/525 passed.

### schema_0591

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 33:     PRICE DOUBLE PRECISION PRECISION NOT NULL,
                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/67 passed.

### schema_0593

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 55:     INDEX (author_id, commit_time),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/208 passed.

### schema_0597

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/87 passed.

### schema_0604

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/187 passed.

### schema_0611

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "chat"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/73 passed.

### schema_0612

- Categories: changed_reference_not_eligible_for_policy_approval, reference_test_generation_or_evaluator_limit
- Gate warning: No isolated invalid-parent witness for FK salaries.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.
- Gate warning: No isolated invalid-parent witness for FK titles.['emp_no'] -> employees: a sibling relationship already guarantees the target parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 68/68 passed.

### schema_0614

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/64 passed.

### schema_0620

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 8:     SALARY DOUBLE PRECISION PRECISION NOT NULL
                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/28 passed.

### schema_0624

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `0A000`
- DDL error: cannot use column reference in DEFAULT expression
LINE 654:     STATUS CHAR(1) NULL DEFAULT "C",
                                          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/624 passed.

### schema_0625

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/305 passed.

### schema_0639

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "is_active" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/64 passed.

### schema_0642

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "BTREE"
LINE 14:     PRIMARY KEY (id) USING BTREE
                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/107 passed.

### schema_0648

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/117 passed.

### schema_0652

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 25: ) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/299 passed.

### schema_0655

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 8: ...created_at timestamp NOT NULL DEFAULT current_timestamp()(),
                                                                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/396 passed.

### schema_0660

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/208 passed.

### schema_0661

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "long" does not exist
LINE 223:     VALUE_ long,
                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/828 passed.

### schema_0672

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "user_info"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/63 passed.

### schema_0673

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 C...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/97 passed.

### schema_0676

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "COMMENT"
LINE 16: ...id int  NOT NULL GENERATED BY DEFAULT AS IDENTITY COMMENT'id...
                                                              ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/68 passed.

### schema_0684

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLAT...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/336 passed.

### schema_0686

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 139:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Normalization blocker: Identity on a non-integer type needs an explicit representation; left unchanged.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/203 passed.

### schema_0694

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `3F000`
- DDL error: schema "taxonomy" does not exist
LINE 3: CREATE TABLE taxonomy.high_level
                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/99 passed.

### schema_0696

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "active" is of type bit but default expression is of type boolean
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'pickup_ship_id'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/278 passed.

### schema_0699

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 26: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/101 passed.

### schema_0701

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42P07`
- DDL error: relation "vendor" already exists
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/134 passed.

### schema_0702

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 137:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/188 passed.

### schema_0706

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/52 passed.

### schema_0725

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/29 passed.

### schema_0727

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `3F000`
- DDL error: schema "cocoapp" does not exist
LINE 4: CREATE TABLE cocoapp.users
                     ^
- Generated checks: 0/104 passed.

### schema_0731

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42P01`
- DDL error: relation "seq_user_id" does not exist
LINE 5:  user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NU...
                                     ^
- Generated checks: 0/79 passed.

### schema_0732

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 10: ) ENGINE=INNODB DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/115 passed.

### schema_0734

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22023`
- DDL error: identity column type must be smallint, integer, or bigint
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/27 passed.

### schema_0737

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/102 passed.

### schema_0738

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "faculty"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/101 passed.

### schema_0740

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/462 passed.

### schema_0742

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Unsupported CHECK expression on 'transactions': 'json_valid(meta)' (unsupported CHECK operator)
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/749 passed.

### schema_0745

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 112:     temp_c DOUBLE PRECISION precision,
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/283 passed.

### schema_0755

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 14:   PRIMARY KEY (member_id)
                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/104 passed.

### schema_0761

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "device"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/209 passed.

### schema_0764

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "categories"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/70 passed.

### schema_0772

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "##"
LINE 3: ##为空则没有到，
        ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/180 passed.

### schema_0778

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/37 passed.

### schema_0781

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/190 passed.

### schema_0790

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 6: ..._created_at timestamp NOT NULL DEFAULT current_timestamp()()
                                                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/123 passed.

### schema_0796

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 6: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/79 passed.

### schema_0800

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22008`
- DDL error: date/time field value out of range: "0000-00-00 00:00:00"
LINE 14:         LAST_MODIFIED_TIME TIMESTAMP DEFAULT '0000-00-00 00:...
                                                      ^
- Generated checks: 0/46 passed.

### schema_0802

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: ) ENGINE=innodb DEFAULT CHARACTER SET utf8mb4 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/245 passed.

### schema_0804

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `3F000`
- DDL error: schema "clin_prescribing" does not exist
LINE 4: CREATE TABLE clin_prescribing.medications
                     ^
- Generated checks: 0/51 passed.

### schema_0805

- Categories: changed_reference_not_eligible_for_policy_approval, malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure
- Converter blocker: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Converter blocker: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Converter blocker: Duplicate column names in 'campground'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "02"
LINE 33:     02=February,
             ^
- Gate warning: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Gate warning: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Gate warning: Duplicate column names in 'campground'
- Gate warning: Normalization blocker: Could not parse ground-truth column: '... 12=December\n  open_to_mm varchar(4) NOT NULL'
- Gate warning: Normalization blocker: Could not parse ground-truth column: '... 12=December\n  daily_fee money NOT NULL'
- Gate warning: Normalization blocker: Duplicate column names in 'campground'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/62 passed.

### schema_0807

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/202 passed.

### schema_0813

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22008`
- DDL error: date/time field value out of range: "0000-00-00 00:00:00"
LINE 19:     modifieddatetime timestamp NOT NULL DEFAULT '0000-00-00 ...
                                                         ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/56 passed.

### schema_0814

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "LIMIT"
LINE 35: CREATE TABLE LIMIT
                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/71 passed.

### schema_0817

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "roles"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/56 passed.

### schema_0819

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/135 passed.

### schema_0820

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     object_type varchar(1) CHARACTER SET latin1 NOT NULL,
                                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1027 passed.

### schema_0829

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     name varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
                              ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/111 passed.

### schema_0830

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 76: ) ENGINE=innodb DEFAULT CHARACTER SET utf8 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/245 passed.

### schema_0842

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 6:     group_name varchar_ignorecase(50) not null
                       ^
- Generated checks: 0/21 passed.

### schema_0843

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/205 passed.

### schema_0845

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42P01`
- DDL error: relation "logging_event_id_seq" does not exist
LINE 18:     event_id          INT DEFAULT nextval('logging_event_id_...
                                                   ^
- Generated checks: 0/39 passed.

### schema_0847

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "engine"
LINE 9: ) engine=innodb comment '学院表';
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/55 passed.

### schema_0849

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 21: ...  createdtime timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/231 passed.

### schema_0858

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     categoryname varchar(255) CHARACTER SET latin1 NOT NULL,
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/56 passed.

### schema_0859

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_gene...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/193 passed.

### schema_0871

- Categories: changed_reference_not_eligible_for_policy_approval, generated_reference_checks_failed
- Gate warning: Reference timeout/query cancellation: diagnostic recheck cannot clear the original failure; resolve execution stability before freezing.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 513/514 passed.

### schema_0881

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42P01`
- DDL error: relation "seq_employee_id" does not exist
LINE 4:     employee_id integer NOT NULL DEFAULT nextval('seq_employ...
                                                         ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/40 passed.

### schema_0889

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     description varchar(255) CHARACTER SET utf8mb4 NOT NULL ...
                                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/57 passed.

### schema_0890

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 8:     payment varchar(200) CHARACTER SET utf8 DEFAULT NULL,
                                 ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/104 passed.

### schema_0899

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 95:     strike DOUBLE PRECISION precision NOT NULL,
                                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1375 passed.

### schema_0901_196592

- Categories: changed_reference_not_eligible_for_policy_approval, malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure
- Converter blocker: Could not parse ground-truth column: 'eg. player 1'
- Converter blocker: Could not parse ground-truth column: 'etc.\n  PLAYER_ID int'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'PLAYER_ID'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "."
LINE 45:     eg. player 1,
               ^
- Gate warning: Could not parse ground-truth column: 'eg. player 1'
- Gate warning: Could not parse ground-truth column: 'etc.\n  PLAYER_ID int'
- Gate warning: Unresolved or ambiguous constraint identifier: 'PLAYER_ID'
- Gate warning: Normalization blocker: Could not parse ground-truth column: 'eg. player 1'
- Gate warning: Normalization blocker: Could not parse ground-truth column: 'etc.\n  PLAYER_ID int'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'PLAYER_ID'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/43 passed.

### schema_0902_537610

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/505 passed.

### schema_0903_641274

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "TYPE"
LINE 142: ) TYPE=INNODB;
            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/97 passed.

### schema_0907_160745

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "auth_permission"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/234 passed.

### schema_0908_595029

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "char"
LINE 6:     JOB_NAME VARCHAR(100 char) NOT NULL,
                                 ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/83 passed.

### schema_0910_646654

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "engine"
LINE 24: ) engine=MyISAM
           ^
- Gate warning: No isolated invalid-parent witness for FK user_roles.['role_id'] -> roles: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK user_roles.['role_id'] -> roles: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/23 passed.

### schema_0911_351848

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "criteria"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/62 passed.

### schema_0912_623966

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "UQ_SINGER_1"
LINE 9:     UNIQUE UQ_SINGER_1 (FIRST_NAME, LAST_NAME),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/36 passed.

### schema_0914_546220

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/218 passed.

### schema_0917_538663

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 18: ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COL...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/619 passed.

### schema_0918_205842

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/656 passed.

### schema_0921_180722

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/289 passed.

### schema_0922_290577

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/231 passed.

### schema_0924_372982

- Categories: malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure, sqlite_internal_metadata_not_application_schema
- Converter blocker: Excluded by protocol v4: source contains SQLite internal sqlite_stat1 metadata, not an application schema.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ";"
LINE 25: CREATE TABLE sqlite_stat1(tbl,idx,stat);
                                                ^
- Gate warning: Could not determine data type for 'sqlite_stat1.tbl'.
- Gate warning: Could not determine data type for 'sqlite_stat1.idx'.
- Gate warning: Could not determine data type for 'sqlite_stat1.stat'.
- Gate warning: Normalization blocker: Excluded by protocol v4: source contains SQLite internal sqlite_stat1 metadata, not an application schema.
- Generated checks: 0/211 passed.

### schema_0925_652965

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/855 passed.

### schema_0926_444961

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 CO...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/94 passed.

### schema_0927_432405

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 52:     events_name varchar(255) CHARACTER SET utf8 NOT NULL,
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/308 passed.

### schema_0928_520831

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "user"
LINE 31:   FOREIGN KEY (user) REFERENCES "user"(email)
                        ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/106 passed.

### schema_0930_662565

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varhcar" does not exist
LINE 9:     name VARHCAR(100) NOT NULL
                 ^
- Generated checks: 0/44 passed.

### schema_0932_662552

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 196: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/430 passed.

### schema_0934_326686

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "user"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/89 passed.

### schema_0937_462804

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 141:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/218 passed.

### schema_0940_549205

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "invitation" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/124 passed.

### schema_0942_150757

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 22: ... "date-time" timestamp NOT NULL DEFAULT current_timestamp(),
                                                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/38 passed.

### schema_0943_664647

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 10:     created_at timestamp NULL DEFAULT NULL(),
                                                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/95 passed.

### schema_0945_570272

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 7:   sid varchar_ignorecase(100) not null,
              ^
- Generated checks: 0/55 passed.

### schema_0950_614366

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "referencesposition"
LINE 71:     foreign key (position_id) referencesposition(position_id...
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/167 passed.

### schema_0952_402169

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42703`
- DDL error: column "aircraft_id" named in key does not exist
LINE 17:     PRIMARY KEY (aircraft_id)
             ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/53 passed.

### schema_0954_100853

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/66 passed.

### schema_0956_120022

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 213:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/320 passed.

### schema_0957_512086

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "procedure_in_consultation"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/283 passed.

### schema_0960_326291

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 8:     createdat TIMESTAMP DEFAULT current_timestamp(),
                                                          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/112 passed.

### schema_0966_604469

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 28:     msgid varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
                                ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/242 passed.

### schema_0967_047078

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 224: ) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
            ^
- Gate warning: Conflicting overlapping FK parent fixture for 'wiki_article'.
- Gate warning: Conflicting overlapping FK parent fixture for 'wiki_attachment'.
- Gate warning: Conflicting overlapping FK parent fixture for 'wiki_revisionplugin'.
- Gate warning: Conflicting overlapping FK parent fixture for 'wiki_urlpath'.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/2086 passed.

### schema_0968_637990

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/318 passed.

### schema_0971_260892

- Categories: postgresql_ddl_execution_failure
- Converter blocker: Dollar-quoted/procedural, backslash-escaped or executable-comment SQL requires manual review.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "`"
LINE 4: CREATE TABLE `ad` (
                     ^
- Gate warning: Normalization blocker: Dollar-quoted/procedural, backslash-escaped or executable-comment SQL requires manual review.
- Generated checks: 0/213 passed.

### schema_0972_309020

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'ad_locales'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "200"
LINE 41: CREATE INDEX ON temp (200);
                               ^
- Gate warning: Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Gate warning: Unresolved or ambiguous constraint identifier: 'ad_locales'
- Gate warning: Could not synthesize a base row for the PK test on 'lang_message_keys'.
- Gate warning: Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Gate warning: table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Gate warning: Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Gate warning: Could not synthesize a parent row in 'apm_package_types' for the FK-accept test on 'lang_message_keys'.
- Gate warning: Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Gate warning: Could not synthesize a base row for the PK test on 'lang_messages'.
- Gate warning: Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Gate warning: table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; no fixture was generated.
- Gate warning: Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Gate warning: Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Gate warning: table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Gate warning: table 'lang_messages': could not synthesize a required parent row in 'lang_message_keys' for NOT NULL foreign key ['message_key', 'package_key']; no fixture was generated.
- Gate warning: Could not synthesize a parent row in 'ad_locales' for the FK-accept test on 'lang_messages'.
- Gate warning: Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Gate warning: Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Gate warning: table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Gate warning: Cannot synthesize a row for unknown table 'ad_locales' (referenced by a foreign key but not defined in this IR).
- Gate warning: table 'lang_messages': could not synthesize a required parent row in 'ad_locales' for NOT NULL foreign key ['locale']; no fixture was generated.
- Gate warning: Could not synthesize a parent row in 'lang_message_keys' for the FK-accept test on 'lang_messages'.
- Gate warning: Cannot synthesize a row for unknown table 'apm_package_types' (referenced by a foreign key but not defined in this IR).
- Gate warning: table 'lang_message_keys': could not synthesize a required parent row in 'apm_package_types' for NOT NULL foreign key ['package_key']; no fixture was generated.
- Gate warning: Could not synthesize a parent row in 'lang_message_keys' for the cascade_behavior test on 'lang_messages'.
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'apm_package_types'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'ad_locales'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/12 passed.

### schema_0974_336891

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unico...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/40 passed.

### schema_0975_324672

- Categories: postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "artist"
- Generated checks: 0/27 passed.

### schema_0976_390037

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "log"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/32 passed.

### schema_0983_295376

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/19 passed.

### schema_0984_334739

- Categories: reference_test_generation_or_evaluator_limit
- Gate warning: No isolated invalid-parent witness for FK plot_checks.['lab_id'] -> labs: a sibling relationship already guarantees the target parent.
- Generated checks: 78/78 passed.

### schema_0987_242178

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/66 passed.

### schema_0990_174588

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "transfers"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/117 passed.

### schema_0991_336216

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42P01`
- DDL error: relation "seq_user_id" does not exist
LINE 5:  user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NU...
                                     ^
- Generated checks: 0/118 passed.

### schema_0993_348884

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/52 passed.

### schema_0995_401888

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "d_boolean" does not exist
LINE 36:     approved D_BOOLEAN DEFAULT 1,
                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/208 passed.

### schema_0996_541548

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "year" does not exist
LINE 19:     graduation_year year(4) NOT NULL
                             ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/279 passed.

### schema_1000_617352

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "alert_send_all"
LINE 26:     UNIQUE alert_send_all (layout_id, alert_id, current_id, ...
                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/633 passed.

### schema_1002_179110

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "bin" does not exist
LINE 17:     att_bin bin(10)
                     ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/120 passed.

### schema_1004_219344

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit, unresolved_source_alter_operation
- Converter blocker: Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ALTER"
LINE 29: ALTER TABLE roles_users ADD CONSTRAINT roles_fk FOREIGN KEY ...
         ^
- Gate warning: Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- Gate warning: Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- Gate warning: No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK roles_users.['user_id'] -> users: no target-private columns or independent sibling parent.
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'FOREIGN KEY (role_id) REFERENCES roles(id)\n)'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/27 passed.

### schema_1005_570602

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, unresolved_source_alter_operation
- Converter blocker: ALTER TABLE ADD COLUMN has missing or duplicate identifier: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Converter blocker: Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 82: ALTER TABLE departments ADD ( CONSTRAINT dept_mgr_fk FOREIGN...
                                     ^
- Gate warning: ALTER TABLE ADD COLUMN has missing or duplicate identifier: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Gate warning: Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Gate warning: Normalization blocker: ALTER TABLE ADD COLUMN has missing or duplicate identifier: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'ADD ( CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id))'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/81 passed.

### schema_1010_080239

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 66:     fee_amount DOUBLE PRECISION precision,
                                         ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/618 passed.

### schema_1012_059331

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ","
LINE 9:     PREVAILING_WAGE FLOAT(10,2) NOT NULL,
                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/42 passed.

### schema_1014_183534

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "alert_send_all"
LINE 27:     UNIQUE alert_send_all (layout_id, alert_id, current_id, ...
                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1017 passed.

### schema_1020_184540

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 10:     response_id varchar(255) CHARACTER SET ascii DEFAULT NUL...
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/230 passed.

### schema_1021_493175

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "enabled" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Normalization blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/51 passed.

### schema_1022_393548

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/222 passed.

### schema_1023_473037

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/135 passed.

### schema_1025_400667

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: foreign key constraint "advdata_gatewayseqno_fkey" cannot be implemented
DETAIL:  Key columns "gatewayseqno" of the referencing table and "gatewayseqno" of the referenced table are of incompatible types: character varying and integer.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/34 passed.

### schema_1027_665032

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42710`
- DDL error: constraint "fixture_id_fk" for relation "motion_packets" already exists
- Gate warning: No isolated invalid-parent witness for FK motion_packets.['fixture_id'] -> fixture: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK motion_packets.['fixture_id'] -> fixture: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/37 passed.

### schema_1030_245326

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22023`
- DDL error: identity column type must be smallint, integer, or bigint
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/166 passed.

### schema_1031_610804

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 343: ) ENGINE=innodb AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/604 passed.

### schema_1032_033274

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- Converter blocker: Unresolved or ambiguous constraint identifier: 'products_id'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'orders_id'
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "customers"
- Gate warning: Unresolved or ambiguous constraint identifier: 'products_id'
- Gate warning: Unresolved or ambiguous constraint identifier: 'orders_id'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'products_id'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'orders_id'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/67 passed.

### schema_1033_362362

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "UQ_CONTACT_1"
LINE 8:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/33 passed.

### schema_1035_417385

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "badge" does not exist
LINE 25:     badge badge DEFAULT 'none'::badge,
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/82 passed.

### schema_1036_289819

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `0A000`
- DDL error: cannot use column reference in DEFAULT expression
LINE 48:     stato varchar(20) NOT NULL DEFAULT "In attesa",
                                                ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/90 passed.

### schema_1037_521203

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/364 passed.

### schema_1041_644261

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/52 passed.

### schema_1044_019860

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/128 passed.

### schema_1046_287891

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 89:     INDEX (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/135 passed.

### schema_1053_675929

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 25: ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/123 passed.

### schema_1055_080731

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/505 passed.

### schema_1059_346369

- Categories: postgresql_ddl_execution_failure
- Converter blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "same"
LINE 4: CREATE TABLE statements same as in Figure 5.1b  */
                                ^
- Gate warning: Could not resolve CREATE TABLE state before applying ALTER statements.
- Gate warning: Normalization blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- Generated checks: 0/74 passed.

### schema_1061_295385

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 15: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/258 passed.

### schema_1063_000018

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "tbls"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/447 passed.

### schema_1068_491851

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 6:     name varchar(40) CHARACTER SET utf8 NOT NULL,
                             ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/193 passed.

### schema_1072_659835

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 16: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/342 passed.

### schema_1073_314345

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 76: ) ENGINE=innodb DEFAULT CHARACTER SET utf8 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/245 passed.

### schema_1074_270875

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 73: ...ssion_time timestamp NOT NULL DEFAULT current_timestamp()(),
                                                                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/134 passed.

### schema_1078_600014

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 13: ) ENGINE=innodb DEFAULT CHARACTER SET utf8mb4 ;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/245 passed.

### schema_1079_213377

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 137:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/203 passed.

### schema_1080_520449

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 21: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/110 passed.

### schema_1083_674851

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "users"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/118 passed.

### schema_1087_556070

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_genera...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/119 passed.

### schema_1091_085280

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22008`
- DDL error: date/time field value out of range: "0000-00-00 00:00:00"
LINE 32:     creation_date TIMESTAMP NOT NULL default '0000-00-00 00:...
                                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/127 passed.

### schema_1092_364010

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 233: )ENGINE=InnoDB DEFAULT CHARSET=utf8;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/543 passed.

### schema_1096_483661

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     name varchar(80) CHARACTER SET utf8 NOT NULL,
                             ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/307 passed.

### schema_1097_348151

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "TYPE"
LINE 8: ) TYPE=InnoDB;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/198 passed.

### schema_1099_654747

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/33 passed.

### schema_1100_299606

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1149 passed.

### schema_1101_650753

- Categories: changed_reference_not_eligible_for_policy_approval, reference_test_generation_or_evaluator_limit
- Gate warning: No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Earned.['UserID'] -> goaUser: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Earned.['BadgeID'] -> Badge: no target-private columns or independent sibling parent.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 152/152 passed.

### schema_1103_115675

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "key"
LINE 24:     email_id varchar(50) not null unique key,
                                                  ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/37 passed.

### schema_1105_583941

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 50:     MAXDEBT DOUBLE PRECISION PRECISION DEFAULT 0 NOT NULL,
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/542 passed.

### schema_1108_251945

- Categories: changed_reference_not_eligible_for_policy_approval, conflicting_duplicate_source_table_definitions, postgresql_ddl_execution_failure
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'driver'; authoritative definition is ambiguous.
- Converter blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- PostgreSQL SQLSTATE: `42P07`
- DDL error: relation "driver" already exists
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'driver'; authoritative definition is ambiguous.
- Gate warning: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'driver'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/110 passed.

### schema_1111_287457

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "languages"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/43 passed.

### schema_1116_107207

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/385 passed.

### schema_1118_276995

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "email"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/23 passed.

### schema_1122_217285

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 26: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1053 passed.

### schema_1125_512036

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "("
LINE 18:  PRIMARY KEY (emp_no)
                      ^
- Generated checks: 0/66 passed.

### schema_1127_354281

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42P01`
- DDL error: relation "global_seq" does not exist
LINE 6:   id          INTEGER PRIMARY KEY DEFAULT nextval('global_se...
                                                          ^
- Generated checks: 0/46 passed.

### schema_1131_139527

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 56: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/132 passed.

### schema_1133_264586

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/385 passed.

### schema_1137_334854

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 38: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/122 passed.

### schema_1145_561835

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "test29_master_depend" does not exist
LINE 11:     index test29_master_depend ( depend1_id ),
                   ^
- Generated checks: 0/15 passed.

### schema_1148_575663

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "person"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/37 passed.

### schema_1151_048516

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/956 passed.

### schema_1152_259631

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, unresolved_source_alter_operation
- Converter blocker: ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- Converter blocker: ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Converter blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Converter blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Converter blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Converter blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- PostgreSQL SQLSTATE: `42P01`
- DDL error: relation "act_ru_variable" does not exist
- Gate warning: ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- Gate warning: ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- Gate warning: ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Gate warning: ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Gate warning: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Gate warning: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Gate warning: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Gate warning: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Gate warning: Normalization blocker: ALTER TABLE target 'ACT_RU_VARIABLE' is not resolvable in source order.
- Gate warning: Normalization blocker: ALTER TABLE target 'ACT_RU_TASK' is not resolvable in source order.
- Gate warning: Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_VAR_CASE_INST\n    foreign key (CASE_INST_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_EXE\n    foreign key (CASE_EXECUTION_ID_)\n    references ACT_RU_CASE_EXECUTION(ID_)'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE target: 'add constraint ACT_FK_TASK_CASE_DEF\n  foreign key (CASE_DEF_ID_)\n  references ACT_RE_CASE_DEF(ID_)'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/97 passed.

### schema_1154_693691

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/107 passed.

### schema_1155_119431

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/385 passed.

### schema_1157_113711

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "user"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/72 passed.

### schema_1158_367517

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/19 passed.

### schema_1160_679413

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHAR"
LINE 4:     Physician_Profile_ID VARCHAR(38 CHAR),
                                            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/162 passed.

### schema_1161_297667

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ASC"
LINE 18:     INDEX fk_hospital_adress1_idx (adress_id ASC) VISIBLE,
                                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/56 passed.

### schema_1162_166427

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "year" does not exist
LINE 8:     Year YEAR,
                 ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/50 passed.

### schema_1165_522626

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 33:     DOUBLE_VAL DOUBLE PRECISION PRECISION,
                                         ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/86 passed.

### schema_1166_118993

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "user"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/135 passed.

### schema_1169_027702

- Categories: changed_reference_not_eligible_for_policy_approval, conflicting_duplicate_source_table_definitions, malformed_or_unparseable_source_ddl, postgresql_ddl_execution_failure, unresolved_source_alter_operation
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'student'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Converter blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- Converter blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'drop foreign key myrule'
- Converter blocker: Could not parse a CREATE TABLE definition.
- Converter blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Converter blocker: Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'studentid'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 50:     Entry timestamp default(current_timestamp())
                                                       ^
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'student'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Gate warning: Could not resolve CREATE TABLE state before applying ALTER statements.
- Gate warning: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'drop foreign key myrule'
- Gate warning: Could not parse a CREATE TABLE definition.
- Gate warning: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Gate warning: Unresolved or ambiguous constraint identifier: 'studentid'
- Gate warning: Conflicting overlapping FK parent fixture for 'categories'.
- Gate warning: Conflicting overlapping FK parent fixture for 'categories'.
- Gate warning: Conflicting overlapping FK parent fixture for 'categories'.
- Gate warning: Conflicting overlapping FK parent fixture for 'categories'.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'Student'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'student'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'categories'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'products'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Could not resolve CREATE TABLE state before applying ALTER statements.
- Gate warning: Normalization blocker: Unresolved or ambiguous ALTER TABLE constraint/index drop: 'drop foreign key myrule'
- Gate warning: Normalization blocker: Could not parse a CREATE TABLE definition.
- Gate warning: Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'drop foreign key myrule'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'studentid'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/177 passed.

### schema_1172_394848

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/124 passed.

### schema_1174_475536

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "mrbs_room"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/207 passed.

### schema_1175_025608

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/70 passed.

### schema_1176_594644

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "team"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/162 passed.

### schema_1177_433889

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "city"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/145 passed.

### schema_1182_162164

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "nasabah"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/25 passed.

### schema_1183_499639

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "engine"
LINE 11: )engine=InnoDB;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/35 passed.

### schema_1189_344012

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "users"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/112 passed.

### schema_1190_414439

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "auth_permission"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/175 passed.

### schema_1195_063455

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: type modifier is not allowed for type "bytea"
LINE 13:     BYTES_ BYTEA(max),
                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/70 passed.

### schema_1196_356982

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "fire_station_information"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/226 passed.

### schema_1197_304772

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "attribute_values_attributes_id_value"
LINE 30:     UNIQUE attribute_values_attributes_id_value (attributes_...
                    ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/897 passed.

### schema_1199_239178

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "auth_groups"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/129 passed.

### schema_1201_239756

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1297 passed.

### schema_1202_625711

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     author varchar(40) CHARACTER SET utf8 NULL DEFAULT NULL,
                               ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/124 passed.

### schema_1205_030960

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "approved" is of type bit but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/204 passed.

### schema_1207_239489

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 6: ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/27 passed.

### schema_1216_629322

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "tbls"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/432 passed.

### schema_1220_019171

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 8: ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/347 passed.

### schema_1221_233519

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- Converter blocker: Unresolved or ambiguous constraint identifier: 'MaGV'
- PostgreSQL SQLSTATE: `42703`
- DDL error: column "magv" referenced in foreign key constraint does not exist
- Gate warning: Unresolved or ambiguous constraint identifier: 'MaGV'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'MaGV'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/28 passed.

### schema_1222_039356

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "identity" does not exist
LINE 4:     id identity primary key,
               ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/44 passed.

### schema_1223_109688

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/66 passed.

### schema_1224_512880

- Categories: other_reference_gate_failure
- Gate warning: Could not synthesize a base row for the PK test on 'Employees'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Gate warning: No isolated valid CHECK witness for Employees: 'hoursPweek <=168'
- Gate warning: No bounded CHECK-compatible fixture found for 'Employees'.
- Gate warning: No isolated invalid CHECK witness for Employees: 'hoursPweek <=168'
- Gate warning: No isolated valid CHECK witness for Employees: 'hoursPweek > 0'
- Gate warning: No isolated invalid CHECK witness for Employees: 'hoursPweek > 0'
- Gate warning: No isolated valid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- Gate warning: No isolated invalid CHECK witness for Employees: "tfn LIKE '[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]-[0-9] [0-9] [0-9]'"
- Gate warning: Could not synthesize a base row for the PK test on 'Departments'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: No isolated valid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: No isolated invalid CHECK witness for Departments: "id LIKE '[0-9][0-9][0-9]'"
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: Could not synthesize a parent row in 'Departments' for the FK-accept test on 'DeptMissions'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; no fixture was generated.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: Could not synthesize a parent row in 'Departments' for the FK-accept test on 'WorksFor'.
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: No isolated valid CHECK witness for WorksFor: 'percentage > 0'
- Gate warning: No bounded CHECK-compatible fixture found for 'Departments'.
- Gate warning: table 'WorksFor': could not synthesize a required parent row in 'Departments' for NOT NULL foreign key ['department']; no fixture was generated.
- Gate warning: No isolated invalid CHECK witness for WorksFor: 'percentage > 0'
- Gate warning: No isolated valid CHECK witness for WorksFor: 'percentage <= 100'
- Gate warning: No isolated invalid CHECK witness for WorksFor: 'percentage <= 100'
- Generated checks: 20/20 passed.

### schema_1227_189095

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/76 passed.

### schema_1228_038090

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "users"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/64 passed.

### schema_1229_458061

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 9: ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 CO...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/41 passed.

### schema_1232_658129

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 17: ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/460 passed.

### schema_1237_355236

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 11: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unic...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/497 passed.

### schema_1238_617427

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 18: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/117 passed.

### schema_1239_638548

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar_ignorecase" does not exist
LINE 25:     last_name VARCHAR_IGNORECASE(30),
                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/52 passed.

### schema_1240_300469

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42883`
- DDL error: function curdate() does not exist
LINE 58:     datedebon date         NOT NULL DEFAULT curdate(),
                                                     ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/311 passed.

### schema_1241_258878

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 8:     payment varchar(200) CHARACTER SET utf8 DEFAULT NULL,
                                 ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/104 passed.

### schema_1242_249341

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 10: ) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/118 passed.

### schema_1243_421581

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42804`
- DDL error: column "verified" is of type boolean but default expression is of type integer
HINT:  You will need to rewrite or cast the expression.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/108 passed.

### schema_1247_508785

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 33:     DOUBLE_VAL DOUBLE PRECISION PRECISION,
                                         ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/86 passed.

### schema_1252_307603

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     name varchar(255) CHARACTER SET utf8 NOT NULL,
                              ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/44 passed.

### schema_1256_060874

- Categories: postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "long" does not exist
LINE 8: PHONE LONG, 
              ^
- Generated checks: 0/41 passed.

### schema_1259_435992

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "identity" does not exist
LINE 162:     LOG_NR_ identity,
                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/217 passed.

### schema_1264_630818

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 29: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/308 passed.

### schema_1265_471935

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "precision"
LINE 115:     DOUBLE_ DOUBLE PRECISION precision,
                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/217 passed.

### schema_1268_420590

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 5:     username char(10) CHARACTER SET latin1 NOT NULL,
                              ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/58 passed.

### schema_1269_326189

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "USING"
LINE 8:     KEY st_idx (st) USING HASH
                            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/385 passed.

### schema_1270_099383

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 7: ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900...
          ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/57 passed.

### schema_1273_587363

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "#"
LINE 3: # 用户ID
        ^
- Gate warning: Unsupported CHECK expression on 'orders': "value in ('预订中','已入住','已退房')" (unknown column)
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/109 passed.

### schema_1275_254209

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "ref_biz_data_inst"
- Gate warning: Conflicting overlapping FK parent fixture for 'user_'.
- Gate warning: Conflicting overlapping FK parent fixture for 'user_'.
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/1155 passed.

### schema_1279_031575

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "PRECISION"
LINE 50:     MAXDEBT DOUBLE PRECISION PRECISION DEFAULT 0 NOT NULL,
                                      ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/538 passed.

### schema_1282_521421

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "tbls"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/447 passed.

### schema_1285_375298

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "CHARACTER"
LINE 6:     img varchar(64) CHARACTER SET utf8 DEFAULT NULL,
                            ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/131 passed.

### schema_1289_203345

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42704`
- DDL error: type "varchar2" does not exist
LINE 4:     key varchar2(1024) NOT NULL,
                ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/83 passed.

### schema_1292_596003

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 14: ) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 CO...
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/57 passed.

### schema_1295_618406

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "partitions"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/462 passed.

### schema_1296_538462

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "UQ_CONTACT_1"
LINE 9:     UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME),
                   ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/37 passed.

### schema_1298_324181

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22023`
- DDL error: identity column type must be smallint, integer, or bigint
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/2349 passed.

### schema_1300_274091

- Categories: changed_reference_not_eligible_for_policy_approval, conflicting_duplicate_source_table_definitions, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'xxx'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 't0_1'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'x'; authoritative definition is ambiguous.
- Converter blocker: Conflicting duplicate CREATE TABLE definitions for 'logged'; authoritative definition is ambiguous.
- Converter blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Converter blocker: Unresolved or ambiguous constraint identifier: 'a'
- PostgreSQL SQLSTATE: `42P07`
- DDL error: relation "xxx" already exists
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'xxx'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 't0_1'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'x'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Gate warning: Conflicting duplicate CREATE TABLE definitions for 'logged'; authoritative definition is ambiguous.
- Gate warning: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Unresolved or ambiguous constraint identifier: 'a'
- Gate warning: Unsupported CHECK expression on 'tab2': 'c2+c3<100.0' (unsupported CHECK token)
- Gate warning: Unsupported CHECK expression on 'tab3': 'c2-c3<80' (unsupported CHECK token)
- Gate warning: Unsupported CHECK expression on 'renc_4': 'c2+c3<100.0' (unsupported CHECK token)
- Gate warning: Unsupported CHECK expression on 'renc_5': 'c2-c3<80' (unsupported CHECK token)
- Gate warning: No bounded CHECK-compatible fixture found for 'atdc_1_constraints'.
- Gate warning: No isolated invalid CHECK witness for atdc_1_constraints: 'c is not null'
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'xxx'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't0_1'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 't1'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'x'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Conflicting duplicate CREATE TABLE definitions for 'logged'; authoritative definition is ambiguous.
- Gate warning: Normalization blocker: Duplicate CREATE TABLE names: source contains multiple schema variants; review required.
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'a'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/246 passed.

### schema_1304_492215

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `22023`
- DDL error: identity column type must be smallint, integer, or bigint
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/133 passed.

### schema_1305_484289

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 25: ... publish_date timestamp NOT NULL DEFAULT current_timestamp()
                                                                       ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/44 passed.

### schema_1307_441345

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, source_foreign_key_targets_non_unique_column
- PostgreSQL SQLSTATE: `42830`
- DDL error: there is no unique constraint matching given keys for referenced table "filiere"
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/38 passed.

### schema_1308_267996

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure, reference_test_generation_or_evaluator_limit, unresolved_source_alter_operation
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP major'
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP title'
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP number'
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP numUnits'
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP deptId'
- Converter blocker: Unsupported ALTER TABLE operation; not applied: 'DROP courseId'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP major'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP dept'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP title'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP number'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP numUnits'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_deptId'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP deptId'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_courseId'
- Converter blocker: Unsupported ALTER TABLE constraint: 'DROP courseId'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'deptId'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'courseId'
- Converter blocker: Unresolved or ambiguous constraint identifier: 'majorId'
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "FOREIGN"
LINE 104: DROP FOREIGN KEY FKSection_deptId,
               ^
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP major'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP title'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP number'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP numUnits'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP deptId'
- Gate warning: Unsupported ALTER TABLE operation; not applied: 'DROP courseId'
- Gate warning: Unsupported ALTER TABLE constraint: 'DROP major'
- Gate warning: Unsupported ALTER TABLE target: 'DROP dept,\nADD CONSTRAINT FKSection_deptId \nFOREIGN KEY (deptId)\nREFERENCES Department(id) ON DELETE SET NULL ON UPDATE CASCADE'
- Gate warning: Unsupported ALTER TABLE constraint: 'DROP dept'
- Gate warning: Unsupported ALTER TABLE target: 'DROP title,\nDROP number,\nDROP numUnits,\nDROP FOREIGN KEY FKSection_deptId,\nDROP deptId,\nADD CONSTRAINT FKSection_courseId \nFOREIGN KEY (courseId)\nREFERENCES Course(id) ON DELETE SET NULL ON UPDATE CASCADE'
- Gate warning: Unsupported ALTER TABLE target: 'DROP FOREIGN KEY FKSection_courseId,\nDROP courseId'
- Gate warning: Unresolved or ambiguous constraint identifier: 'majorId'
- Gate warning: Unresolved or ambiguous constraint identifier: 'majorId'
- Gate warning: Unresolved or ambiguous constraint identifier: 'majorId'
- Gate warning: Unresolved or ambiguous constraint identifier: 'deptId'
- Gate warning: Unresolved or ambiguous constraint identifier: 'deptId'
- Gate warning: Unresolved or ambiguous constraint identifier: 'deptId'
- Gate warning: No isolated invalid-parent witness for FK Student.['majorId'] -> Department: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Student.['majorId'] -> Department: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Student.['majorId'] -> Department: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Teacher.['deptId'] -> Department: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Teacher.['deptId'] -> Department: no target-private columns or independent sibling parent.
- Gate warning: No isolated invalid-parent witness for FK Teacher.['deptId'] -> Department: no target-private columns or independent sibling parent.
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP major'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP dept'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP title'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP number'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP numUnits'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP deptId'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE operation; not applied: 'DROP courseId'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP major'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP dept'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP title'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP number'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP numUnits'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_deptId'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP deptId'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP FOREIGN KEY FKSection_courseId'
- Gate warning: Normalization blocker: Unsupported ALTER TABLE constraint: 'DROP courseId'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'deptId'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'courseId'
- Gate warning: Normalization blocker: Unresolved or ambiguous constraint identifier: 'majorId'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/93 passed.

### schema_1313_266228

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ENGINE"
LINE 12: ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
           ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/45 passed.

### schema_1315_574283

- Categories: changed_reference_not_eligible_for_policy_approval
- Gate warning: No isolated invalid CHECK witness for series: 'pays is not null'
- Gate warning: No isolated invalid CHECK witness for series: 'dateS is not null'
- Gate warning: No isolated invalid CHECK witness for utilisateur: 'dateI is not null'
- Gate warning: No isolated invalid CHECK witness for episode: 'datedif is not null'
- Gate warning: No isolated invalid CHECK witness for staff: 'nom is not null'
- Gate warning: No isolated invalid CHECK witness for staff: 'prenom is not null'
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 114/114 passed.

### schema_1318_239002

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near ")"
LINE 32:     date TIMESTAMP NOT NULL DEFAULT current_timestamp()
                                                               ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/153 passed.

### schema_1319_042917

- Categories: changed_reference_not_eligible_for_policy_approval, postgresql_ddl_execution_failure
- PostgreSQL SQLSTATE: `42601`
- DDL error: syntax error at or near "ALTER"
LINE 31: ALTER TABLE user_role
         ^
- Gate warning: Changed reference lacks a passing policy-category approval or a matching named semantic review.
- Generated checks: 0/35 passed.

