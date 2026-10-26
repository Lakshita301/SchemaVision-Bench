-- Source: https://github.com/ihaywood3/easygp/blob/a9aa3d089b5bf83ad0f88fb276cc6d855678ea12/db/updates/0.161_update_clin_prescribing.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 8
-- If true, the medication is on the patients...
-- if true the record is marked deleted, e.g could have been prescribed for the...
-- The actual date on the script may not be the consulation date, can be back/forwarded dated,...
-- The actual number of repeats...
-- The quantity on the script...
-- If true reg24 allows us to tell the...
-- the pbs requires a unique script number for an authority item, pretty stupid, but a number that...
-- either the steamlined authority number or the phone approval number obtained from a pbs operator
-- foreign key to references coding.generic_terms, if not null then the reason for using script...
CREATE TABLE medications
(
    pk serial primary key,
    active boolean DEFAULT false,
    deleted boolean DEFAULT false,
    start_date date NOT NULL DEFAULT now(),
    last_date date NOT NULL DEFAULT now(),
    fk_generic_product uuid NOT NULL
);

create table lu_pbs_script_type (
    pk serial primary key,
    "type" text not null
);

CREATE TABLE prescribed
(
    pk serial primary key,
    fk_consult integer NOT NULL,
    fk_medication integer NOT NULL,
    fk_brand uuid,
    date_on_script date NOT NULL,
    repeats integer NOT NULL DEFAULT 0,
    quantity integer NOT NULL,
    fk_instruction integer NOT NULL,
    fk_prescribed_for integer,
    pbscode text,
    restriction_code text,
    reg24 boolean DEFAULT false,
    authority_script_number integer,
    authority_approval_number text,
    authority_post_to_patient boolean DEFAULT false,
    script_number integer,
    fk_code text,
    suppress_reason boolean,
    concession_details text,
    brand_substitution boolean DEFAULT true,
    fk_increased_quantity_authority_reason integer,
    fk_lu_pbs_script_type integer,
    fk_progress_note integer,
    deleted boolean DEFAULT false,
    CONSTRAINT prescribed_fk_lu_pbs_script_type_fkey FOREIGN KEY (fk_lu_pbs_script_type)
      REFERENCES lu_pbs_script_type (pk) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
