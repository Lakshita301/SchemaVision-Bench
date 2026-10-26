# Current 351 Final-Pool Reference Exclusions

This table records all 351 excluded schema IDs in the current v4 final audit. One schema ID can have Tier 1/2/3 diagram variants. Multiple reasons may apply to one ID, so category counts overlap.

## Accounting of the current common-ID pool

The configured dataset directories currently discover these matched image/SQL pairs:

| Tier folder | Matched diagram + SQL pairs |
|---|---:|
| Tier 1 | 767 |
| Tier 2 | 757 |
| Tier 3 | 714 |
| **All tier-specific pairs** | **2,238** |

There are **714 schema IDs present in all three tiers** (2,142 tiered diagrams). The remaining 96 matched pairs are tier-only extras: 53 in Tier 1 and 43 in Tier 2. The controlled all-tier split excludes those extras so it can compare the same schemas at every tier. There are no unmatched images; some SQL files have no image in a given tier and are not runnable diagram inputs.

| Disposition | Schema IDs | Notes |
|---|---:|---|
| Development holdout | 76 | Reserved for development; not part of paid final scoring. |
| Pilot pool | 20 | 8 currently eligible; 12 excluded by the pilot audit. |
| Final pool | 618 | 267 eligible; 351 excluded in the table below. |
| **Total** | **714** | The frozen common-ID pool in `config/paper_splits.json`. |

## Important scope correction

The current v4 final-audit manifest points to `config/paper_splits.json` (SHA-256 begins `1694e92b`), which has 618 final IDs. `config/paper_splits_v3.json` instead has 608 final IDs with different membership. Thus, this is the complete exclusion table for the current 618-ID audit, but it is not yet the definitive table for the intended v3 608-ID paid-run population. Refresh the v4 audit against the intended frozen split before citing this as the paper's final accounting. This does not inventory raw unmatched image files outside the 714 common IDs.

## Excluded schema IDs

| Schema ID | Recorded exclusion reason(s) |
|---|---|
| `schema_0164` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation; Source ALTER operation unresolved |
| `schema_0173` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0181` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation; Source FK targets a non-unique column |
| `schema_0183` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0184` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0185` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0191` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0193` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0195` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0196` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0204` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0207` | Converted reference lacks a matching policy approval; Source DDL malformed/unparseable; Reference DDL failed to execute in PostgreSQL |
| `schema_0208` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0210` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0217` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0219` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0220` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0225` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0229` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0230` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0238` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0247` | Converted reference lacks a matching policy approval; Conflicting duplicate source table definitions; Reference DDL failed to execute in PostgreSQL |
| `schema_0255` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0266` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0267` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0269` | Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation; Source FK targets a non-unique column |
| `schema_0272` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0273` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0275` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0277` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0279` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0280` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0281` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0284` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0285` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0290` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0292` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0293` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0320` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0327` | Reference DDL failed to execute in PostgreSQL |
| `schema_0328` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0329` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0332` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0338` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0339` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0343` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0348` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0349` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0353` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0366` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0367` | Converted reference lacks a matching policy approval; Source DDL malformed/unparseable; Reference DDL failed to execute in PostgreSQL |
| `schema_0368` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0371` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0372` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0375` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0376` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0377` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0384` | Reference DDL failed to execute in PostgreSQL |
| `schema_0392` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0393` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0398` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0400` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0402` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0403` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0405` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0406` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0409` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0415` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0434` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0436` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0438` | Reference DDL failed to execute in PostgreSQL |
| `schema_0440` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0443` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0449` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0454` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0465` | Reference DDL failed to execute in PostgreSQL |
| `schema_0469` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0470` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0471` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0490` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0491` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation; Source FK targets a non-unique column |
| `schema_0493` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0505` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0507` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0511` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0512` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0518` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0521` | Converted reference lacks a matching policy approval; Reference-test generation/evaluator limitation |
| `schema_0527` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0530` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0535` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0549` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0551` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0552` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0555` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0560` | Reference DDL failed to execute in PostgreSQL |
| `schema_0566` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0567` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0570` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0571` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0578` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0591` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0593` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0597` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0604` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0611` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0612` | Converted reference lacks a matching policy approval; Reference-test generation/evaluator limitation |
| `schema_0614` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0620` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0624` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0625` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0639` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0642` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0648` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0652` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0655` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0660` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0661` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0672` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0673` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0676` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0684` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0686` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0694` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0696` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0699` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0701` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0702` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0706` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0725` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0727` | Reference DDL failed to execute in PostgreSQL |
| `schema_0731` | Reference DDL failed to execute in PostgreSQL |
| `schema_0732` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0734` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0737` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0738` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0740` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0742` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0745` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0755` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0761` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0764` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0772` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0778` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0781` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0790` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0796` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0800` | Reference DDL failed to execute in PostgreSQL |
| `schema_0802` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0804` | Reference DDL failed to execute in PostgreSQL |
| `schema_0805` | Converted reference lacks a matching policy approval; Source DDL malformed/unparseable; Reference DDL failed to execute in PostgreSQL |
| `schema_0807` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0813` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0814` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0817` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0819` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0820` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0829` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0830` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0842` | Reference DDL failed to execute in PostgreSQL |
| `schema_0843` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0845` | Reference DDL failed to execute in PostgreSQL |
| `schema_0847` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0849` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0858` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0859` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0871` | Converted reference lacks a matching policy approval; Generated reference checks failed |
| `schema_0881` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0889` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0890` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0899` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0901_196592` | Converted reference lacks a matching policy approval; Source DDL malformed/unparseable; Reference DDL failed to execute in PostgreSQL |
| `schema_0902_537610` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0903_641274` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0907_160745` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0908_595029` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0910_646654` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_0911_351848` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0912_623966` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0914_546220` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0917_538663` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0918_205842` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0921_180722` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0922_290577` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0924_372982` | Source DDL malformed/unparseable; Reference DDL failed to execute in PostgreSQL; SQLite internal metadata, not an application schema |
| `schema_0925_652965` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0926_444961` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0927_432405` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0928_520831` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0930_662565` | Reference DDL failed to execute in PostgreSQL |
| `schema_0932_662552` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0934_326686` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0937_462804` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0940_549205` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0942_150757` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0943_664647` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0945_570272` | Reference DDL failed to execute in PostgreSQL |
| `schema_0950_614366` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0952_402169` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0954_100853` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0956_120022` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0957_512086` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0960_326291` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0966_604469` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0967_047078` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0968_637990` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0971_260892` | Reference DDL failed to execute in PostgreSQL |
| `schema_0972_309020` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0974_336891` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0975_324672` | Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0976_390037` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0983_295376` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0984_334739` | Reference-test generation/evaluator limitation |
| `schema_0987_242178` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0990_174588` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_0991_336216` | Reference DDL failed to execute in PostgreSQL |
| `schema_0993_348884` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0995_401888` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_0996_541548` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1000_617352` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1002_179110` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1004_219344` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation; Source ALTER operation unresolved |
| `schema_1005_570602` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source ALTER operation unresolved |
| `schema_1010_080239` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1012_059331` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1014_183534` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1020_184540` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1021_493175` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1022_393548` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1023_473037` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1025_400667` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1027_665032` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_1030_245326` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1031_610804` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1032_033274` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1033_362362` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1035_417385` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1036_289819` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1037_521203` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1041_644261` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1044_019860` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1046_287891` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1053_675929` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1055_080731` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1059_346369` | Reference DDL failed to execute in PostgreSQL |
| `schema_1061_295385` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1063_000018` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1068_491851` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1072_659835` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1073_314345` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1074_270875` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1078_600014` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1079_213377` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1080_520449` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1083_674851` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1087_556070` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1091_085280` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1092_364010` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1096_483661` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1097_348151` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1099_654747` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1100_299606` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1101_650753` | Converted reference lacks a matching policy approval; Reference-test generation/evaluator limitation |
| `schema_1103_115675` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1105_583941` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1108_251945` | Converted reference lacks a matching policy approval; Conflicting duplicate source table definitions; Reference DDL failed to execute in PostgreSQL |
| `schema_1111_287457` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1116_107207` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1118_276995` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1122_217285` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1125_512036` | Reference DDL failed to execute in PostgreSQL |
| `schema_1127_354281` | Reference DDL failed to execute in PostgreSQL |
| `schema_1131_139527` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1133_264586` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1137_334854` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1145_561835` | Reference DDL failed to execute in PostgreSQL |
| `schema_1148_575663` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1151_048516` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1152_259631` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source ALTER operation unresolved |
| `schema_1154_693691` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1155_119431` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1157_113711` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1158_367517` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1160_679413` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1161_297667` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1162_166427` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1165_522626` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1166_118993` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1169_027702` | Converted reference lacks a matching policy approval; Conflicting duplicate source table definitions; Source DDL malformed/unparseable; Reference DDL failed to execute in PostgreSQL; Source ALTER operation unresolved |
| `schema_1172_394848` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1174_475536` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1175_025608` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1176_594644` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1177_433889` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1182_162164` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1183_499639` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1189_344012` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1190_414439` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1195_063455` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1196_356982` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1197_304772` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1199_239178` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1201_239756` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1202_625711` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1205_030960` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1207_239489` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1216_629322` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1220_019171` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1221_233519` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1222_039356` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1223_109688` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1224_512880` | Other reference-gate failure |
| `schema_1227_189095` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1228_038090` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1229_458061` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1232_658129` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1237_355236` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1238_617427` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1239_638548` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1240_300469` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1241_258878` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1242_249341` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1243_421581` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1247_508785` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1252_307603` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1256_060874` | Reference DDL failed to execute in PostgreSQL |
| `schema_1259_435992` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1264_630818` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1265_471935` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1268_420590` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1269_326189` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1270_099383` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1273_587363` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_1275_254209` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1279_031575` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1282_521421` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1285_375298` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1289_203345` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1292_596003` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1295_618406` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1296_538462` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1298_324181` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1300_274091` | Converted reference lacks a matching policy approval; Conflicting duplicate source table definitions; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation |
| `schema_1304_492215` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1305_484289` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1307_441345` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Source FK targets a non-unique column |
| `schema_1308_267996` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL; Reference-test generation/evaluator limitation; Source ALTER operation unresolved |
| `schema_1313_266228` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1315_574283` | Converted reference lacks a matching policy approval |
| `schema_1318_239002` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
| `schema_1319_042917` | Converted reference lacks a matching policy approval; Reference DDL failed to execute in PostgreSQL |
