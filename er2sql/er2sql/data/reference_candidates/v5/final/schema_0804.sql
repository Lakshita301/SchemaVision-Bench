-- Source: https://github.com/ihaywood3/easygp/blob/a9aa3d089b5bf83ad0f88fb276cc6d855678ea12/db/updates/0.161_update_clin_prescribing.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 8

CREATE TABLE clin_prescribing.medications
(
  pk serial primary key,
  active boolean DEFAULT false, -- If true, the medication is on the patients...
  deleted boolean DEFAULT false, -- if true the record is marked deleted, e.g could have been prescribed for the...
  start_date date NOT NULL DEFAULT now(),
  last_date date NOT NULL DEFAULT now(),
  fk_generic_product uuid NOT NULL
);

create table clin_prescribing.lu_pbs_script_type (
  pk serial primary key,
  "type" text not null
);

CREATE TABLE clin_prescribing.prescribed
(
  pk serial primary key,
  fk_consult integer NOT NULL,
  fk_medication integer NOT NULL,
  fk_brand uuid,
  date_on_script date NOT NULL, -- The actual date on the script may not be the consulation date, can be back/forwarded dated,...
  repeats integer NOT NULL DEFAULT 0, -- The actual number of repeats...
  quantity integer NOT NULL, -- The quantity on the script...
  fk_instruction integer NOT NULL,
  fk_prescribed_for integer,
  pbscode text,
  restriction_code text,
  reg24 boolean DEFAULT false, -- If true reg24 allows us to tell the...
  authority_script_number integer, -- the pbs requires a unique script number for an authority item, pretty stupid, but a number that...
  authority_approval_number text, -- either the steamlined authority number or the phone approval number obtained from a pbs operator
  authority_post_to_patient boolean DEFAULT false,
  script_number integer,
  fk_code text, -- foreign key to references coding.generic_terms, if not null then the reason for using script...
  suppress_reason boolean,
  concession_details text,
  brand_substitution boolean DEFAULT true,
  fk_increased_quantity_authority_reason integer,
  fk_lu_pbs_script_type integer,
  fk_progress_note integer,
  deleted boolean DEFAULT false,
  CONSTRAINT prescribed_fk_lu_pbs_script_type_fkey FOREIGN KEY (fk_lu_pbs_script_type)
      REFERENCES clin_prescribing.lu_pbs_script_type (pk) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
  
);

