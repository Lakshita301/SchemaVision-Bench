-- Source: https://github.com/ArchivesPortalEuropeFoundation/ape-backend/blob/58704264d98e233e0dbef53f4ffb5c50b87af7f4/persistence/src/main/resources/dbScripts/db_script.sql?raw=true
-- Tables detected: 32 | FK/REFERENCES mentions: 92
CREATE TABLE ai_alternative_name
(
    ai_an_id integer NOT NULL,
    ai_a_name character varying(255) NOT NULL,
    ai_id integer NOT NULL,
    lng_id integer NOT NULL,
    primary_name boolean NOT NULL
);
CREATE TABLE archival_institution (
    ai_id integer NOT NULL,
    ainame character varying(255) NOT NULL,
    registration_date date,
    eag_path character varying(255),
    user_id integer default NULL,
    country_id integer NOT NULL,
    repositorycode character varying(20),
    autform character varying(255),
    isgroup boolean,
    parent_ai_id integer,
    alorder integer NOT NULL,
    internal_al_id character varying(100) NOT NULL
);
CREATE TABLE archival_institution_oai_pmh (
    aio_id integer NOT NULL,
    oai_pmh_id integer NOT NULL,
    oai_pmh_url character varying(100) NOT NULL,
    last_harvesting date,
    ai_id integer NOT NULL
);
CREATE TABLE c_level (
    cl_id bigint NOT NULL,
    ec_id bigint,
    parent_cl_id bigint,
    unittitle text,
    unitid character varying(255),
    level character varying(50),
    order_id integer,
    leaf boolean,
    xml text,
    href_eadid character varying(255)
);
CREATE TABLE cou_alternative_name (
    cou_an_id integer NOT NULL,
    cou_an_name character varying(255) NOT NULL,
    cou_id integer NOT NULL,
    lng_id integer NOT NULL
);
CREATE TABLE country (
    cou_id integer NOT NULL,
    cname character varying(120) NOT NULL,
    isoname character varying(2) NOT NULL,
    al_order integer
);
CREATE TABLE cpf_content (
    id bigint NOT NULL,
    ai_id bigint,
    cpf_id character varying(255),
    xml text
);
CREATE TABLE dpt_update (
    id bigint NOT NULL,
    version character varying(255)
);
CREATE TABLE ead_content (
    ec_id bigint NOT NULL,
    fa_id bigint,
    hg_id bigint,
    sg_id bigint,
    xml text,
    titleproper text,
    eadid character varying(255),
    unittitle text,
    display_intro boolean  NOT NULL DEFAULT TRUE,
    display_did boolean  NOT NULL  DEFAULT TRUE,
    visible boolean
);
CREATE TABLE ese (
    ese_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    modification_date timestamp with time zone,
    eset text NOT NULL,
    path character varying(255),
    es_id integer NOT NULL,
    mf_id integer NOT NULL,
    fa_id integer,
    path_html character varying(200),
    number_of_records integer DEFAULT 0,
    oai_identifier character varying(255)
);
CREATE TABLE ese_state (
    es_id integer NOT NULL,
    state character varying(20) NOT NULL
);
CREATE TABLE file_state (
    fs_id integer NOT NULL,
    state character varying(35) NOT NULL
);
CREATE TABLE file_type (
    ft_id integer NOT NULL,
    ftype character varying(20) NOT NULL
);
CREATE TABLE finding_aid (
    fa_id integer NOT NULL,
    fa_title text NOT NULL,
    upload_date timestamp without time zone NOT NULL,
    path_apenetead character varying(255) NOT NULL,
    fs_id integer NOT NULL,
    um_id integer NOT NULL,
    fa_eadid character varying(255) NOT NULL,
    ai_id integer NOT NULL,
    totalnumberofdaos bigint,
    totalnumberofunits bigint,
    totalnumberofunitswithdao bigint
);
CREATE TABLE holdings_guide (
    hg_id integer NOT NULL,
    hg_tittle text NOT NULL,
    upload_date timestamp without time zone NOT NULL,
    path_apenetead character varying(255) NOT NULL,
    ai_id integer NOT NULL,
    fs_id integer NOT NULL,
    um_id integer NOT NULL,
    hg_eadid character varying(255),
    path_html character varying(100),
    totalnumberofdaos bigint,
    totalnumberofunits bigint,
    totalnumberofunitswithdao bigint
);
CREATE TABLE item (
    it_id integer NOT NULL,
    u_id bigint NOT NULL,
    label character varying(40) NOT NULL,
    lt_id integer NOT NULL
);
CREATE TABLE index_queue
(
    iq_id integer NOT NULL,
    fa_id integer,
    hg_id integer,
    sg_id integer,
    position integer,
    queue_date timestamp without time zone NOT NULL,
    fs_id integer NOT NULL,
    errors text
);
CREATE TABLE lang (
    lng_id integer NOT NULL,
    lname character varying(20) NOT NULL,
    isoname character varying(3) NOT NULL,
    iso2name character varying(2) NOT NULL,
    lnativename character varying(20) NOT NULL
);
CREATE TABLE level_type (
    lt_id integer NOT NULL,
    ltype character varying(40) NOT NULL
);
CREATE TABLE metadata_format (
    mf_id integer NOT NULL,
    format character varying(20) NOT NULL
);
CREATE TABLE normal_user (
    u_id bigint NOT NULL,
    us_id bigint NOT NULL,
    nick character varying(60) NOT NULL,
    email_address character varying(100) NOT NULL,
    pwd character varying(60) NOT NULL,
    secret_question character varying(200),
    secret_answer character varying(200)
);
CREATE TABLE "user" (
    id integer NOT NULL,
    user_state_id integer NOT NULL,
    email_address character varying(256) UNIQUE NOT NULL,
    password character varying(60) NOT NULL,
    country_id integer default NULL,
    secret_question character varying(200),
    secret_answer character varying(200),
    user_role_id integer NOT NULL,
    first_name character varying(60) NOT NULL,
    last_name character varying(100) NOT NULL
);
CREATE TABLE resumption_token
(
    rt_id integer NOT NULL,
    expiration_date timestamp with time zone NOT NULL,
    from_date timestamp with time zone NOT NULL,
    until_date timestamp with time zone NOT NULL,
    "set" character varying(100),
    last_record_harvested character varying(100) NOT NULL,
    mf_id integer
);
CREATE TABLE user_role
(
    id integer NOT NULL,
    role character varying(40) NOT NULL
);
CREATE TABLE searches (
    sea_id bigint NOT NULL,
    search_string character varying(100) NOT NULL,
    label character varying(40),
    u_id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    view character varying(10) NOT NULL,
    navtreelang character varying(3),
    resultsperpage integer,
    searchbutton character varying(20),
    element character varying(5),
    fromdate character varying(30),
    todate character varying(30),
    typedocument character varying,
    dao character varying(30),
    method character varying(30),
    navigationtreenodesselected text,
    expandednodes text,
    resultsorder character varying(128),
    startdate character varying(128),
    enddate character varying(128),
    ai character varying(30),
    type character varying(5),
    datetype character varying(30),
    country character varying(30),
    pagenumber character varying(30)
);
CREATE TABLE sent_mail_register (
    smr_id integer NOT NULL,
    validation_link character varying(100) NOT NULL,
    date date NOT NULL,
    email_address character varying(100) NOT NULL,
    user_id integer,
    ai_id integer
);
CREATE TABLE source_guide (
    sg_id int4 not null,
    fs_id int4 not null,
    ai_id int4 not null,
    um_id int4 not null,
    title text not null,
    upload_date timestamp not null,
    path_apenetead varchar(255) not null,
    eadid varchar(255),
    totalnumberofdaos int8,
    totalnumberofunits int8,
    totalnumberofunitswithdao int8
);
CREATE TABLE up_file (
    uf_id integer NOT NULL,
    path character varying(255) NOT NULL,
    um_id integer NOT NULL,
    ufs_id integer NOT NULL,
    ai_id integer NOT NULL,
    ft_id integer NOT NULL,
    fname character varying(255) NOT NULL
);
CREATE TABLE up_file_state (
    ufs_id integer NOT NULL,
    state character varying(20) NOT NULL
);
CREATE TABLE upload_method (
    um_id integer NOT NULL,
    method character varying(20) NOT NULL
);
CREATE TABLE user_state (
    id integer NOT NULL,
    state character varying(20)
);
CREATE TABLE warnings (
    war_id integer NOT NULL,
    abstract text NOT NULL,
    hg_id integer,
    fa_id integer,
    sg_id integer,
    iswarning boolean
);
ALTER TABLE ai_alternative_name ADD CONSTRAINT archival_institution_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE ai_alternative_name ADD CONSTRAINT lang_lng_id_fkey FOREIGN KEY (lng_id) REFERENCES lang(lng_id);
ALTER TABLE archival_institution ADD CONSTRAINT archival_institution_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);
ALTER TABLE archival_institution ADD CONSTRAINT archival_institution_parent_ai_id_fkey FOREIGN KEY (parent_ai_id) REFERENCES archival_institution (ai_id);
ALTER TABLE archival_institution ADD CONSTRAINT archival_institution_cou_id_fkey FOREIGN KEY (country_id) REFERENCES country(cou_id);
ALTER TABLE archival_institution_oai_pmh ADD CONSTRAINT archival_institution_oai_pmh_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE c_level ADD CONSTRAINT c_level_ec_id_fkey FOREIGN KEY (ec_id) REFERENCES ead_content(ec_id) ON DELETE CASCADE;
ALTER TABLE c_level ADD CONSTRAINT c_level_parent_cl_id_fkey FOREIGN KEY (parent_cl_id) REFERENCES c_level(cl_id) ON DELETE CASCADE;
ALTER TABLE cou_alternative_name ADD CONSTRAINT country_cou_id_fkey FOREIGN KEY (cou_id) REFERENCES country(cou_id) ON DELETE CASCADE;
ALTER TABLE cou_alternative_name ADD CONSTRAINT lng_id FOREIGN KEY (lng_id) REFERENCES lang(lng_id);
ALTER TABLE cpf_content ADD CONSTRAINT cpf_content_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE ead_content ADD CONSTRAINT ead_content_fa_id_fkey FOREIGN KEY (fa_id) REFERENCES finding_aid(fa_id) ON DELETE CASCADE;
ALTER TABLE ead_content ADD CONSTRAINT ead_content_hg_id_fkey FOREIGN KEY (hg_id) REFERENCES holdings_guide(hg_id) ON DELETE CASCADE;
ALTER TABLE ead_content ADD CONSTRAINT ead_content_sg_id_fkey FOREIGN KEY (sg_id) REFERENCES source_guide(sg_id) ON DELETE CASCADE;
ALTER TABLE ese ADD CONSTRAINT ese_es_id_fkey FOREIGN KEY (es_id) REFERENCES ese_state(es_id);
ALTER TABLE ese ADD CONSTRAINT ese_fa_id_fkey FOREIGN KEY (fa_id) REFERENCES finding_aid(fa_id);
ALTER TABLE ese ADD CONSTRAINT ese_mf_id_fkey FOREIGN KEY (mf_id) REFERENCES metadata_format(mf_id);
ALTER TABLE finding_aid ADD CONSTRAINT finding_aid_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE finding_aid ADD CONSTRAINT finding_aid_fs_id_fkey FOREIGN KEY (fs_id) REFERENCES file_state(fs_id);
ALTER TABLE finding_aid ADD CONSTRAINT finding_aid_um_id_fkey FOREIGN KEY (um_id) REFERENCES upload_method(um_id);
ALTER TABLE holdings_guide ADD CONSTRAINT holdings_guide_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE holdings_guide ADD CONSTRAINT holdings_guide_fs_id_fkey FOREIGN KEY (fs_id) REFERENCES file_state(fs_id);
ALTER TABLE holdings_guide ADD CONSTRAINT holdings_guide_um_id_fkey FOREIGN KEY (um_id) REFERENCES upload_method(um_id);
ALTER TABLE item ADD CONSTRAINT item_lt_id_fkey FOREIGN KEY (lt_id) REFERENCES level_type(lt_id);
ALTER TABLE item ADD CONSTRAINT item_u_id_fkey FOREIGN KEY (u_id) REFERENCES normal_user(u_id);
ALTER TABLE index_queue ADD CONSTRAINT index_queue_fa_id_fkey FOREIGN KEY (fa_id) REFERENCES finding_aid (fa_id) ON DELETE CASCADE;
ALTER TABLE index_queue ADD CONSTRAINT index_queue_hg_id_fkey FOREIGN KEY (hg_id) REFERENCES holdings_guide (hg_id) ON DELETE CASCADE;
ALTER TABLE index_queue ADD CONSTRAINT index_queue_fs_id_fkey FOREIGN KEY (fs_id) REFERENCES file_state (fs_id);
ALTER TABLE index_queue ADD CONSTRAINT index_queue_sg_id_fkey FOREIGN KEY (sg_id) REFERENCES source_guide(sg_id);
ALTER TABLE normal_user ADD CONSTRAINT normal_user_us_id_fkey FOREIGN KEY (us_id) REFERENCES user_state(id);
ALTER TABLE "user" ADD CONSTRAINT user_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(cou_id);
ALTER TABLE "user" ADD CONSTRAINT user_user_state_id_fkey FOREIGN KEY (user_state_id) REFERENCES user_state(id);
ALTER TABLE "user" ADD CONSTRAINT user_user_role_id_fkey FOREIGN KEY (user_role_id) REFERENCES user_role (id);
ALTER TABLE resumption_token ADD CONSTRAINT resumption_token_mf_id_fkey FOREIGN KEY (mf_id) REFERENCES metadata_format (mf_id);
ALTER TABLE searches ADD CONSTRAINT searches_u_id_fkey FOREIGN KEY (u_id) REFERENCES normal_user(u_id);
ALTER TABLE sent_mail_register ADD CONSTRAINT sent_mail_register_p_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id)  ON DELETE CASCADE;
ALTER TABLE sent_mail_register ADD CONSTRAINT sent_mail_register_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution (ai_id);
ALTER TABLE source_guide ADD CONSTRAINT source_guide_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE source_guide ADD CONSTRAINT source_guide_fs_id_fkey FOREIGN KEY (fs_id) REFERENCES file_state(fs_id);
ALTER TABLE source_guide ADD CONSTRAINT source_guide_um_id_fkey FOREIGN KEY (um_id) REFERENCES upload_method(um_id);
ALTER TABLE up_file ADD CONSTRAINT file_type_ft_id_fkey FOREIGN KEY (ft_id) REFERENCES file_type(ft_id);
ALTER TABLE up_file ADD CONSTRAINT up_file_ai_id_fkey FOREIGN KEY (ai_id) REFERENCES archival_institution(ai_id);
ALTER TABLE up_file ADD CONSTRAINT up_file_ufs_id_fkey FOREIGN KEY (ufs_id) REFERENCES up_file_state(ufs_id);
ALTER TABLE up_file ADD CONSTRAINT up_file_um_id_fkey FOREIGN KEY (um_id) REFERENCES upload_method(um_id);
ALTER TABLE warnings ADD CONSTRAINT warnings_fa_id_fkey FOREIGN KEY (fa_id) REFERENCES finding_aid(fa_id);
ALTER TABLE warnings ADD CONSTRAINT warnings_hg_id_fkey FOREIGN KEY (hg_id) REFERENCES holdings_guide(hg_id);
ALTER TABLE warnings ADD CONSTRAINT warnings_sg_id_fkey FOREIGN KEY (sg_id) REFERENCES source_guide(sg_id);
