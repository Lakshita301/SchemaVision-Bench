-- Source: https://github.com/VinayAddank/license/blob/4391e25592e399596037757f6c82e1b20e49a9a8/src/main/resources/sql/base-1.3.3/citizen-1.3.3.sql?raw=true
-- Tables detected: 39 | FK constraints: 25
CREATE TABLE age_group_ref (
    age_group_cd character varying(255) NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    age_end integer,
    age_group_desc character varying(255),
    age_start integer,
    is_active character varying(255)
);
CREATE TABLE application (
    application_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    applicant_dob character varying(255),
    application_number character varying(255),
    execution_id character varying(255),
    is_authenticated boolean,
    is_sync_with_master boolean DEFAULT false,
    iteration integer DEFAULT 1,
    process_id character varying(255),
    rta_office_code character varying(255),
    service_category character varying(20),
    service_code character varying(255),
    session_id bigint NOT NULL
);
CREATE TABLE application_approval_history (
    app_history_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    comments character varying(255),
    iteration integer,
    rta_user_id bigint,
    rta_user_role character varying(255),
    status integer,
    application_id bigint NOT NULL
);
CREATE TABLE application_attachments (
    attachment_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    attachment_from integer NOT NULL,
    title character varying(200) NOT NULL,
    filename character varying(200) NOT NULL,
    source_dr character varying(255) NOT NULL,
    status integer NOT NULL,
    user_type character varying(255),
    application_id bigint NOT NULL,
    document_id integer NOT NULL
);
CREATE TABLE application_bank_transaction_detail (
    transaction_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    fee_amount DOUBLE PRECISION precision,
    bank_status_message character varying(255),
    bank_transac_no character varying(255) NOT NULL,
    compound_amount DOUBLE PRECISION precision,
    green_tax_amt DOUBLE PRECISION precision,
    pay_amount DOUBLE PRECISION precision,
    payment_time bigint,
    payment_type integer,
    permit_amount DOUBLE PRECISION precision,
    postal_charge DOUBLE PRECISION precision,
    sbi_ref_no character varying(255),
    service_charge DOUBLE PRECISION precision,
    service_code character varying(255),
    status integer,
    tax_amount DOUBLE PRECISION precision,
    application_id bigint,
    cess_fee DOUBLE PRECISION precision
);
CREATE TABLE application_fee_detail (
    fee_dtl_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    other_permit_fee DOUBLE PRECISION precision,
    application_fee DOUBLE PRECISION precision,
    application_service_charge DOUBLE PRECISION precision,
    fitness_fee DOUBLE PRECISION precision,
    fitness_service_charge DOUBLE PRECISION precision,
    license_test_fee DOUBLE PRECISION precision,
    penality_fee DOUBLE PRECISION precision,
    permit_fee DOUBLE PRECISION precision,
    permit_service_charge DOUBLE PRECISION precision,
    postal_charge DOUBLE PRECISION precision,
    smart_card_fee DOUBLE PRECISION precision,
    total_fee DOUBLE PRECISION precision,
    application_id bigint,
    late_fee DOUBLE PRECISION precision,
    hsrp_fee integer DEFAULT 0,
    special_number_fee integer DEFAULT 0
);
CREATE TABLE application_form_data (
    data_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    status integer,
    application_id bigint NOT NULL,
    form_data json,
    form_code character varying(255)
);
CREATE TABLE application_tax_detail (
    tax_dtl_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    green_tax_amt integer DEFAULT 0,
    green_tax_valid_from bigint,
    tax_amount DOUBLE PRECISION precision,
    tax_percentage DOUBLE PRECISION precision,
    tax_type character varying(255),
    total_amt DOUBLE PRECISION precision,
    valid_upto bigint,
    application_id bigint,
    green_tax_valid_to bigint,
    penalty_amt integer DEFAULT 0,
    quarter_amt integer DEFAULT 0,
    service_fee integer DEFAULT 0,
    cess_fee integer DEFAULT 0,
    cess_fee_valid_upto bigint,
    compound_fee integer DEFAULT 0,
    penalty_amt_arrears integer DEFAULT 0,
    tax_amount_arrears integer DEFAULT 0
);
CREATE TABLE citizen_address (
    address_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    address_type integer DEFAULT 1,
    country_code character varying(255),
    district_code character varying(255),
    door_no character varying(255),
    is_same_aadhar boolean DEFAULT false,
    mandal_code integer,
    pincode character varying(255),
    state_code character varying(255),
    status boolean,
    street character varying(255),
    town character varying(255),
    with_effect_from bigint,
    application_id bigint NOT NULL
);
CREATE TABLE citizen_address_outside_ap (
    address_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    address_type integer DEFAULT 1,
    country_name character varying(255),
    district_name character varying(255),
    door_no character varying(255),
    mandal_name character varying(255),
    pincode character varying(6),
    state_name character varying(255),
    staus boolean,
    street_name character varying(255),
    town_name character varying(255),
    with_effect_from bigint,
    application_id bigint NOT NULL
);
CREATE TABLE citizen_info (
    citizen_info_id bigint NOT NULL,
    aadhar_number character varying(255),
    application_id bigint,
    father_name character varying(255),
    first_name character varying(255),
    full_name character varying(255),
    gender character varying(255),
    last_name character varying(255),
    middle_name character varying(255)
);
CREATE TABLE citizen_invoice (
    citizen_invc_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    invoice_amt DOUBLE PRECISION precision,
    invoice_date bigint,
    invoice_no character varying(255),
    status integer,
    total_amount DOUBLE PRECISION precision,
    application_id bigint,
    fee_dtl_id bigint,
    tax_dtl_id bigint
);
CREATE TABLE dl_series_master (
    dl_series_id bigint NOT NULL,
    created_by character varying(50),
    created_on date,
    modified_by character varying(50),
    modified_on date,
    end_number integer,
    start_number integer,
    use_number integer,
    year integer
);
CREATE TABLE document_master (
    document_id integer NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    status boolean,
    description character varying(100),
    user_role character varying(100)
);
CREATE TABLE event (
    event_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    application_id bigint,
    attachement character varying(255),
    email_notify boolean,
    event_type character varying(255),
    iteration integer,
    service_type character varying(255),
    sms_notify boolean
);
CREATE TABLE holidays (
    holiday_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    date bigint,
    is_enabled boolean
);
CREATE TABLE license_holder_approved_details (
    license_holder_approved_details_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    first_name character varying(255),
    guardian_name character varying(255),
    last_name character varying(255),
    application_id bigint NOT NULL
);
CREATE TABLE license_permit_details (
    license_permit_details_id bigint NOT NULL,
    created_by character varying(50),
    created_on date,
    modified_by character varying(50),
    modified_on date,
    app_exam_number character varying(255),
    is_badge boolean DEFAULT false,
    license_number character varying(255),
    license_type character varying(255),
    parent_consent_aadhaar_no character varying(255),
    status integer,
    test_date date,
    test_exempted character(1),
    test_exempted_reason character varying(255),
    test_marks character varying(255),
    test_no_of_attemp integer,
    test_result character varying(255),
    vehicle_class_code character varying(255),
    application_id bigint NOT NULL
);
CREATE TABLE license_permit_details_history (
    license_permit_details_history_id bigint NOT NULL,
    created_by character varying(50),
    created_on date,
    modified_by character varying(50),
    modified_on date,
    status integer,
    user_id bigint,
    vehicle_class_code character varying(255),
    application_id bigint NOT NULL
);
CREATE TABLE login_attempt (
    login_attempt_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    aadhar_number character varying(255),
    key_type character varying(255),
    login_count integer,
    login_time bigint,
    unique_key character varying(255)
);
CREATE TABLE ot_token (
    token_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    claimant_aadhaar_number character varying(255),
    claimant_ip character varying(50),
    claimant_name character varying(255),
    generator_aadhaar_number character varying(255),
    generator_ip character varying(50),
    generator_name character varying(255),
    is_claimed boolean DEFAULT false,
    ownership_type integer,
    token_number character varying(255),
    application_id bigint
);
CREATE TABLE pending_username (
    pending_username_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    status integer,
    username character varying(255),
    application_id bigint NOT NULL
);
CREATE TABLE question_options (
    question_options_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    is_correct boolean,
    is_mandatory boolean DEFAULT false,
    option character varying(255),
    status integer,
    question_id bigint
);
CREATE TABLE questionnaire_feedback (
    questionnaire_feedback_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    answer character varying(255),
    is_correct boolean,
    question character varying(255),
    status integer,
    test_type character varying(255),
    application_id bigint
);
CREATE TABLE questions (
    question_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    question character varying(255),
    status integer,
    test_type character varying(255),
    vehicle_class character varying(255)
);
CREATE TABLE rejected_app_removed_exe_id_hist (
    id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    app_number character varying(255),
    execution_id character varying(255),
    iteration integer,
    service_code character varying(255)
);
CREATE TABLE rta_office_ipaddress (
    office_ipaddress_id bigint NOT NULL,
    created_by character varying(50),
    created_on date,
    modified_by character varying(50),
    modified_on date,
    ipaddress character varying(50),
    office_code character varying(255),
    remarks character varying(255),
    status character varying(10)
);
CREATE TABLE rta_office_schedule (
    rta_office_schedule_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    end_time bigint,
    is_enabled boolean,
    no_of_simul_slots integer,
    rta_office_code character varying(255),
    service_category character varying(20),
    start_time bigint
);
CREATE TABLE rta_office_test_config (
    rta_office_test_config_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    duration bigint,
    is_enabled boolean,
    simul_app_count integer,
    slot_service_type character varying(255),
    rta_office_schedule_id bigint
);
CREATE TABLE service_master (
    service_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    code character varying(255),
    name character varying(255),
    status boolean,
    service_category character varying(20),
    slot_applicable boolean
);
CREATE TABLE slot_applications (
    slot_applications_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    approval_status integer,
    expiry_time bigint,
    iteration integer DEFAULT 1,
    service_code character varying(255),
    slot_service_type character varying(255),
    slot_status character varying(255),
    application_id bigint,
    slot_id bigint
);
CREATE TABLE slots (
    slot_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    application_count integer,
    duration bigint,
    end_time bigint,
    is_completed boolean,
    rta_office_code character varying(255),
    scheduled_date bigint,
    scheduled_time bigint,
    service_category character varying(20),
    service_code character varying(255),
    slot_service_type character varying(255),
    start_time bigint
);
CREATE TABLE tax_type (
    tax_type_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    code character varying(255),
    name character varying(255),
    status boolean
);
CREATE TABLE transaction_history (
    trans_hist_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    application_id bigint,
    payment_type integer,
    request_parameter text,
    response_parameter text,
    service_type integer,
    status integer NOT NULL,
    transaction_no character varying(255),
    transaction_detail_id bigint
);
CREATE TABLE user_sessions (
    session_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    aadhar_number character varying(255),
    completion_status integer,
    key_type character varying(255),
    login_time bigint,
    service_code character varying(255),
    unique_key character varying(255),
    vehicle_rc_id bigint
);
CREATE TABLE vehicle_class_mst (
    vehicle_class character varying(255) NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    is_active character varying(255),
    vehicle_class_description character varying(255),
    vehicle_class_group character varying(255),
    vehicle_class_type character varying(255),
    vehicle_transport_type character varying(255)
);
CREATE TABLE vehicle_class_ref (
    vehicle_class_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    age_group_cd character varying(255),
    badge_available boolean,
    hazardous boolean,
    idp_class character varying(50),
    licence_class_type character varying(255),
    max_age integer,
    requires_doctor_cert boolean,
    validity_period integer,
    vehicle_class character varying(50)
);
CREATE TABLE vehicle_class_tests_mst (
    vehicle_class_tests_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    test_type character varying(255),
    vehicle_class character varying(255)
);
CREATE TABLE vehicle_inspection (
    vehicle_inspection_id bigint NOT NULL,
    created_by character varying(50),
    created_on bigint,
    modified_by character varying(50),
    modified_on bigint,
    inspection_date bigint,
    inspection_status integer DEFAULT 8 NOT NULL,
    revocation_status integer DEFAULT 2 NOT NULL,
    schedule_inspection_date bigint,
    user_id bigint,
    application_id bigint NOT NULL
);
ALTER TABLE application ADD CONSTRAINT fk_soxl0s9kshcr43jqkmg86ij2b FOREIGN KEY (session_id) REFERENCES user_sessions(session_id);
ALTER TABLE application_approval_history ADD CONSTRAINT fk_scooixdv6r39ypgk4srl8b1da FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE application_attachments ADD CONSTRAINT fk_1sshdja6e0eckcqijr5hprair FOREIGN KEY (document_id) REFERENCES document_master(document_id);
ALTER TABLE application_attachments ADD CONSTRAINT fk_7f9m6u6e6exrx43blsmmytq2 FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE application_bank_transaction_detail ADD CONSTRAINT fk_4jfwv8cjwd7rhe5h2h2oyadmc FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE application_fee_detail ADD CONSTRAINT fk_ofrid8jot3bwakca0qnffyxit FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE application_form_data ADD CONSTRAINT fk_9ow7cvpax9i55eabu45bwws5j FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE application_tax_detail ADD CONSTRAINT fk_6sn2plkxmfusirwcgnq7ixre9 FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE citizen_address ADD CONSTRAINT fk_bo1kh230i39ckwf4s63t5blu7 FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE citizen_address_outside_ap ADD CONSTRAINT fk_au1a1oj92mo88w3biw7md3jtn FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE citizen_invoice ADD CONSTRAINT fk_38one40e0j8majc57bs6bx2dt FOREIGN KEY (fee_dtl_id) REFERENCES application_fee_detail(fee_dtl_id);
ALTER TABLE citizen_invoice ADD CONSTRAINT fk_qbsc0magj50ivyi2alaakxxqq FOREIGN KEY (tax_dtl_id) REFERENCES application_tax_detail(tax_dtl_id);
ALTER TABLE citizen_invoice ADD CONSTRAINT fk_rde96tk23bwkjth73bms3tmgh FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE license_holder_approved_details ADD CONSTRAINT fk_qtgf606j8da38kmurmbwyshoi FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE license_permit_details ADD CONSTRAINT fk_pjjmtqa6sv78evxnh2fq6n80x FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE license_permit_details_history ADD CONSTRAINT fk_d9y6vca8mar1qm2ytr5m3gxyx FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE ot_token ADD CONSTRAINT fk_j1b13kn68i29614cgry9aby0s FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE pending_username ADD CONSTRAINT fk_pmjyvju8u7x72yc818n227mvo FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE question_options ADD CONSTRAINT fk_degt87nkjq9hg8uedqxqtlsee FOREIGN KEY (question_id) REFERENCES questions(question_id);
ALTER TABLE questionnaire_feedback ADD CONSTRAINT fk_a6iu65y3cy6wpk7130raoovnk FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE rta_office_test_config ADD CONSTRAINT fk_qemv0tcj1wwnreplb19dt24aq FOREIGN KEY (rta_office_schedule_id) REFERENCES rta_office_schedule(rta_office_schedule_id);
ALTER TABLE slot_applications ADD CONSTRAINT fk_80789x895y2rw9ep44343leur FOREIGN KEY (application_id) REFERENCES application(application_id);
ALTER TABLE slot_applications ADD CONSTRAINT fk_ks98mvndyiyvatcs5mh46jx4a FOREIGN KEY (slot_id) REFERENCES slots(slot_id);
ALTER TABLE transaction_history ADD CONSTRAINT fk_f05gqohhuixplg0hfk5k654pd FOREIGN KEY (transaction_detail_id) REFERENCES application_bank_transaction_detail(transaction_id);
ALTER TABLE vehicle_inspection ADD CONSTRAINT fk_6l9fhsk0ggt8ica721nmpvgqd FOREIGN KEY (application_id) REFERENCES application(application_id);
