-- Source: https://github.com/kermitgrey/healthcare_dollars_oracle/blob/bb03bdff5e9cef1c95e40d29d7936eed9956c7d5/OpenPay-createTables.sql?raw=true
-- Tables detected: 8 | FK constraints: 5

CREATE TABLE pay_doctors_load(
Physician_Profile_ID                                                  VARCHAR2(38 CHAR),  
Physician_Profile_First_Name                                          VARCHAR2(25 CHAR),  
Physician_Profile_Middle_Name                                         VARCHAR2(25 CHAR),  
Physician_Profile_Last_Name                                           VARCHAR2(35 CHAR),  
Physician_Profile_Suffix                                              VARCHAR2(5 CHAR),  
Physician_Profile_Alternate_First_Name                                VARCHAR2(25 CHAR),  
Physician_Profile_Alternate_Middle_Name                               VARCHAR2(25 CHAR),  
Physician_Profile_Alternate_Last_Name                                 VARCHAR2(35 CHAR),  
Physician_Profile_Alternate_Suffix                                    VARCHAR2(5 CHAR),  
Physician_Profile_Address_Line_1                                      VARCHAR2(55 CHAR),  
Physician_Profile_Address_Line_2                                      VARCHAR2(55 CHAR),  
Physician_Profile_City                                                VARCHAR2(40 CHAR),  
Physician_Profile_State                                               VARCHAR2(2 CHAR),  
Physician_Profile_Zipcode                                             VARCHAR2(10 CHAR),  
Physician_Profile_Country_Name                                        VARCHAR2(100 CHAR),  
Physician_Profile_Province_Name                                       VARCHAR2(20 CHAR),  
Physician_Profile_Primary_Specialty                                   VARCHAR2(300 CHAR),  
Physician_Profile_OPS_Taxonomy_1                                      VARCHAR2(10 CHAR),  
Physician_Profile_OPS_Taxonomy_2                                      VARCHAR2(10 CHAR),  
Physician_Profile_OPS_Taxonomy_3                                      VARCHAR2(10 CHAR),  
Physician_Profile_OPS_Taxonomy_4                                      VARCHAR2(10 CHAR),  
Physician_Profile_OPS_Taxonomy_5                                      VARCHAR2(10 CHAR),  
Physician_Profile_License_State_Code_1                                VARCHAR2(2 CHAR),  
Physician_Profile_License_State_Code_2                                VARCHAR2(2 CHAR),  
Physician_Profile_License_State_Code_3                                VARCHAR2(2 CHAR),  
Physician_Profile_License_State_Code_4                                VARCHAR2(2 CHAR),  
Physician_Profile_License_State_Code_5                                VARCHAR2(2 CHAR),
constraint pay_doctorsPK Primary Key(physician_profile_id)
);

CREATE TABLE pay_payments_load(
CHANGE_TYPE                                                      VARCHAR2(20 CHAR),
COVERED_RECIPIENT_TYPE                                           VARCHAR2(50 CHAR),
TEACHING_HOSPITAL_CCN                                            VARCHAR2(6 CHAR),
TEACHING_HOSPITAL_ID                                             VARCHAR2(38 CHAR),
TEACHING_HOSPITAL_NAME                                           VARCHAR2(100 CHAR),
PHYSICIAN_PROFILE_ID                                             VARCHAR2(38 CHAR),
PHYSICIAN_FIRST_NAME                                             VARCHAR2(20 CHAR),
PHYSICIAN_MIDDLE_NAME                                            VARCHAR2(20 CHAR),
PHYSICIAN_LAST_NAME                                              VARCHAR2(35 CHAR),
PHYSICIAN_NAME_SUFFIX                                            VARCHAR2(5 CHAR),
RECIPIENT_PRIMARY_BUSINESS_STREET_ADDRESS_LINE1                  VARCHAR2(55 CHAR),
RECIPIENT_PRIMARY_BUSINESS_STREET_ADDRESS_LINE2                  VARCHAR2(55 CHAR),
RECIPIENT_CITY                                                   VARCHAR2(40 CHAR),
RECIPIENT_STATE                                                  VARCHAR2(2 CHAR),
RECIPIENT_ZIP_CODE                                               VARCHAR2(10 CHAR),
RECIPIENT_COUNTRY                                                VARCHAR2(100 CHAR),
RECIPIENT_PROVINCE                                               VARCHAR2(20 CHAR),
RECIPIENT_POSTAL_CODE                                            VARCHAR2(20 CHAR),
PHYSICIAN_PRIMARY_TYPE                                           VARCHAR2(100 CHAR),
PHYSICIAN_SPECIALTY                                              VARCHAR2(300 CHAR),
PHYSICIAN_LICENSE_STATE_CODE1                                    VARCHAR2(2 CHAR),
PHYSICIAN_LICENSE_STATE_CODE2                                    VARCHAR2(2 CHAR),
PHYSICIAN_LICENSE_STATE_CODE3                                    VARCHAR2(2 CHAR),
PHYSICIAN_LICENSE_STATE_CODE4                                    VARCHAR2(2 CHAR),
PHYSICIAN_LICENSE_STATE_CODE5                                    VARCHAR2(2 CHAR),
SUBMITTING_APPLICABLE_MANUFACTURER_OR_APPLICABLE_GPO_NAME        VARCHAR2(100 CHAR),
APPLICABLE_MANUFACTURER_OR_APPLICABLE_GPO_MAKING_PAYMENT_ID      VARCHAR2(38 CHAR),
APPLICABLE_MANUFACTURER_OR_APPLICABLE_GPO_MAKING_PAYMENT_NAME    VARCHAR2(100 CHAR),
APPLICABLE_MANUFACTURER_OR_APPLICABLE_GPO_MAKING_PAYMENT_STATE   VARCHAR2(2 CHAR),

APPLICABLE_MANUFACTURER_OR_APPLICABLE_GPO_MAKING_PAYMENT_COUNTRY VARCHAR2(100 CHAR),
TOTAL_AMOUNT_OF_PAYMENT_USDOLLARS                                NUMBER(12,2),
DATE_OF_PAYMENT                                                  VARCHAR2(12 CHAR),
NUMBER_OF_PAYMENTS_INCLUDED_IN_TOTAL_AMOUNT                      NUMBER(3,0),
FORM_OF_PAYMENT_OR_TRANSFER_OF_VALUE                             VARCHAR2(100 CHAR),
NATURE_OF_PAYMENT_OR_TRANSFER_OF_VALUE                           VARCHAR2(200 CHAR),
PAYTYPEID                                                        NUMBER,
CITY_OF_TRAVEL                                                   VARCHAR2(40 CHAR),
STATE_OF_TRAVEL                                                  VARCHAR2(2 CHAR),
COUNTRY_OF_TRAVEL                                                VARCHAR2(100 CHAR),
PHYSICIAN_OWNERSHIP_INDICATOR                                    VARCHAR2(3 CHAR),
THIRD_PARTY_PAYMENT_RECIPIENT_INDICATOR                          VARCHAR2(50 CHAR),
NAME_OF_THIRD_PARTY_ENTITY_RECEIVING_PAYMENT_OR_TRANSFER_OF_VALUE VARCHAR2(50 CHAR),
CHARITY_INDICATOR                                                VARCHAR2(3 CHAR),
THIRD_PARTY_EQUALS_COVERED_RECIPIENT_INDICATOR                   VARCHAR2(3 CHAR),
CONTEXTUAL_INFORMATION                                           VARCHAR2(500 CHAR),
DELAY_IN_PUBLICATION_INDICATOR                                   VARCHAR2(3 CHAR),
RECORD_ID                                                        NUMBER(38,0),
DISPUTE_STATUS_FOR_PUBLICATION                                   VARCHAR2(3 CHAR),
RELATED_PRODUCT_INDICATOR                                        VARCHAR2(100 CHAR),
COVERED_OR_NONCOVERED_INDICATOR_1                                VARCHAR2(100 CHAR),
INDICATE_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_1        VARCHAR2(100 CHAR),
PRODUCT_CATEGORY_OR_THERAPEUTIC_AREA_1                           VARCHAR2(100 CHAR),
NAME_OF_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_1         VARCHAR2(500 CHAR),
ASSOCIATED_DRUG_OR_BIOLOGICAL_NDC_1                              VARCHAR2(100 CHAR),
COVERED_OR_NONCOVERED_INDICATOR_2                                VARCHAR2(100 CHAR),
INDICATE_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_2        VARCHAR2(100 CHAR),
PRODUCT_CATEGORY_OR_THERAPEUTIC_AREA_2                           VARCHAR2(100 CHAR),
NAME_OF_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_2         VARCHAR2(500 CHAR),
ASSOCIATED_DRUG_OR_BIOLOGICAL_NDC_2                              VARCHAR2(100 CHAR),
COVERED_OR_NONCOVERED_INDICATOR_3                                VARCHAR2(100 CHAR),
INDICATE_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_3        VARCHAR2(100 CHAR),
PRODUCT_CATEGORY_OR_THERAPEUTIC_AREA_3                           VARCHAR2(100 CHAR),
NAME_OF_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_3         VARCHAR2(500 CHAR),
ASSOCIATED_DRUG_OR_BIOLOGICAL_NDC_3                              VARCHAR2(100 CHAR),
COVERED_OR_NONCOVERED_INDICATOR_4                                VARCHAR2(100 CHAR),
INDICATE_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_4        VARCHAR2(100 CHAR),
PRODUCT_CATEGORY_OR_THERAPEUTIC_AREA_4                           VARCHAR2(100 CHAR),
NAME_OF_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_4         VARCHAR2(500 CHAR),
ASSOCIATED_DRUG_OR_BIOLOGICAL_NDC_4                              VARCHAR2(100 CHAR),
COVERED_OR_NONCOVERED_INDICATOR_5                                VARCHAR2(100 CHAR),
INDICATE_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_5        VARCHAR2(100 CHAR),
PRODUCT_CATEGORY_OR_THERAPEUTIC_AREA_5                           VARCHAR2(100 CHAR),
NAME_OF_DRUG_OR_BIOLOGICAL_OR_DEVICE_OR_MEDICAL_SUPPLY_5         VARCHAR2(500 CHAR),
ASSOCIATED_DRUG_OR_BIOLOGICAL_NDC_5                              VARCHAR2(30 CHAR),
PROGRAM_YEAR                                                     VARCHAR2(4 CHAR),
PAYMENT_PUBLICATION_DATE                                         VARCHAR2(12 CHAR)
);

CREATE TABLE pay_taxonomy(
Code                                             VARCHAR2(10 CHAR) NOT NULL,           
Grouping                                         VARCHAR2(100 CHAR),           
Classification                                   VARCHAR2(100 CHAR),           
Specialization                                   VARCHAR2(100 CHAR),           
Definition                                       VARCHAR2(100 CHAR),           
Notes                                            VARCHAR2(100 CHAR),
constraint pay_taxonomyPK Primary Key(Code)
);

CREATE TABLE pay_doctors(
DocId                                           VARCHAR2(38 CHAR),  
First_Name                                      VARCHAR2(25 CHAR),  
Middle_Name                                     VARCHAR2(25 CHAR),  
Last_Name                                       VARCHAR2(35 CHAR), 
Full_Name                                       VARCHAR2(85 CHAR),
City                                            VARCHAR2(40 CHAR),  
State                                           VARCHAR2(2 CHAR),  
Zipcode                                         VARCHAR2(10 CHAR),  
TaxonCode					VARCHAR2(10 CHAR),
ProfileSpecialty                                VARCHAR2(300 CHAR),
GroupBin					VARCHAR2(15 CHAR),  
constraint pay_doctors_PK Primary Key(docid),
CONSTRAINT pay_doctors_FK1 FOREIGN KEY(taxoncode)
REFERENCES pay_taxonomy(code),
CONSTRAINT pay_doctors_FK2 FOREIGN KEY(state)
REFERENCES pay_states(statecode)
);

CREATE TABLE pay_payors(
PayorId		        VARCHAR2(12 CHAR),
PayorName		VARCHAR2(100 CHAR) NOT NULL,
GroupBin		VARCHAR2(15 CHAR),
CONSTRAINT pay_payors_PK PRIMARY KEY(PayorId)
);

CREATE TABLE pay_pay_types(
paytypeId		        NUMBER GENERATED AS IDENTITY,
oldpaytype		        VARCHAR2(200 CHAR),
newpaytype		        VARCHAR2(100 CHAR),
CONSTRAINT pay_pay_types_PK PRIMARY KEY(paytypeId)
);

CREATE TABLE pay_states(
statecode                   varchar2(2 CHAR),
statefips                   varchar2(2 CHAR),
statename                   varchar2(50 CHAR),
statens		            varchar2(20 CHAR),
CONSTRAINT pay_states_PK PRIMARY KEY(statecode)
);

CREATE TABLE pay_payments(
docid                        varchar2(38 CHAR),
payorid                      varchar2(12 CHAR),
paytypeid                    number,
progyear                     varchar2(4 CHAR),
amount                       number(18,2),
loaddate                     date,
CONSTRAINT pay_payments_PK PRIMARY KEY (docid, payorid, paytypeid, progyear),
CONSTRAINT pay_payments_FK1 Foreign Key(docid) references pay_doctors(docid),
CONSTRAINT pay_payments_FK2 Foreign Key(payorid) references pay_payors(payorid),
CONSTRAINT pay_payments_FK3 Foreign Key(paytypeid) references pay_pay_types(paytypeid)
);

