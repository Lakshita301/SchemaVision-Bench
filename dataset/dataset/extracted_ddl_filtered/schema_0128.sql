-- Source: https://github.com/DAINTINESS-Group/Schema_Evolution_Datasets/blob/9a5b20bd52424fc31e41d22c50f3847e1c7574ad/SchemaEvolutionDatasets2017/CERN/Atlas/schemata/1187709923.sql?raw=true
-- Tables detected: 59 | FK/REFERENCES mentions: 125

CREATE TABLE l1_random_rates (
	l1rr_id				NUMBER(10) 	NOT NULL,
	l1rr_rate			VARCHAR2(30) 	NOT NULL,
	l1rr_active_from		TIMESTAMP	
	);

CREATE TABLE l1_prescale_set_alias (
	l1pa_id				NUMBER(10) 	NOT NULL,
	l1pa_prescale_set_id		NUMBER(10) 	NOT NULL,
	l1pa_alias 			VARCHAR2(30)  	NOT NULL,
	l1pa_default			CHAR		default 0 NOT NULL,
	l1pa_username 			VARCHAR2(30)	,
	l1pa_modified_time 		TIMESTAMP 	,
	l1pa_used 			CHAR		NOT NULL,
	CONSTRAINT 			l1pa_pk		PRIMARY KEY(l1pa_id)
	);

CREATE TABLE hlt_prescale_set_alias (
  hpsa_id                 NUMBER(10)      NOT NULL,
  hpsa_prescale_set_id    NUMBER(10)      NOT NULL,
  hpsa_alias              VARCHAR2(30)    NOT NULL,
  hpsa_default            CHAR  default 0 NOT NULL,
  hpsa_username           VARCHAR2(30),
  hpsa_modified_time      TIMESTAMP,
  hpsa_used               CHAR            NOT NULL,
  CONSTRAINT   hpsa_pk    PRIMARY KEY(hpsa_id)
  );

CREATE TABLE trigger_alias (
	tal_id                      NUMBER(10)   NOT NULL,
	tal_super_master_table_id  	NUMBER(10)   NOT NULL,
	tal_trigger_alias           VARCHAR2(30) NOT NULL,
	tal_default			            CHAR         default 0 NOT NULL,
	tal_username 			          VARCHAR2(30),
	tal_modified_time           TIMESTAMP,
	tal_used                    CHAR         NOT NULL,
	CONSTRAINT     tal_pk       PRIMARY KEY(tal_id)
	);

CREATE TABLE l1_trigger_type (
	l1tty_id		NUMBER(10)	NOT NULL,
	l1tty_name		VARCHAR2(20)	NOT NULL,
	l1tty_version		NUMBER(11)	NOT NULL,
	l1tty_bit0		VARCHAR2(64) 	NOT NULL,
	l1tty_bit1		VARCHAR2(64) 	NOT NULL,
	l1tty_bit2		VARCHAR2(64) 	NOT NULL,
	l1tty_bit3		VARCHAR2(64) 	NOT NULL,
	l1tty_bit4		VARCHAR2(64) 	NOT NULL,
	l1tty_bit5		VARCHAR2(64) 	NOT NULL,
	l1tty_bit6		VARCHAR2(64) 	NOT NULL,
	l1tty_bit7		VARCHAR2(64) 	NOT NULL,
	l1tty_username		VARCHAR2(30)	,
	l1tty_modified_time	TIMESTAMP	,
	l1tty_used		CHAR		NOT NULL,
	CONSTRAINT		l1tty_pk	PRIMARY KEY (l1tty_id),
	CONSTRAINT 		l1tty_nmver	UNIQUE (l1tty_name, l1tty_version)
	);

CREATE TABLE l1_muctpi_info (
	l1mi_id 		NUMBER(10) 	NOT NULL,
	l1mi_name 		VARCHAR2(20) 	NOT NULL,
	l1mi_version 		NUMBER(11) 	NOT NULL,
	l1mi_low_pt 		NUMBER(10)	NOT NULL,
	l1mi_high_pt 		NUMBER(10) 	NOT NULL,
	l1mi_max_cand 		NUMBER(10) 	NOT NULL,
	l1mi_username		VARCHAR2(30)	,
	l1mi_modified_time	TIMESTAMP	,
	l1mi_used		CHAR		NOT NULL,
	CONSTRAINT 		muctpi_pk 	PRIMARY KEY (l1mi_id),
	CONSTRAINT		muctpi_nmver	UNIQUE (l1mi_name, l1mi_version)
	);

CREATE TABLE l1_dead_time ( 
	l1dt_id 		NUMBER(10) 	NOT NULL,
	l1dt_name 		VARCHAR2(20) 	NOT NULL,
	l1dt_version 		NUMBER(11)	NOT NULL,
	l1dt_simple 		NUMBER(10) 	NOT NULL,
	l1dt_complex1_rate 	NUMBER(10) 	NOT NULL,
	l1dt_complex1_level	NUMBER(10) 	NOT NULL,
	l1dt_complex2_rate 	NUMBER(10) 	NOT NULL,
	l1dt_complex2_level	NUMBER(10) 	NOT NULL,
	l1dt_username		VARCHAR2(30)	,
	l1dt_modified_time	TIMESTAMP 	,
	l1dt_used		CHAR 		NOT NULL,
	CONSTRAINT		l1dt_pk		PRIMARY KEY (l1dt_id),
	CONSTRAINT 		l1dt_nmver	UNIQUE (l1dt_name, l1dt_version)
	);

CREATE TABLE l1_random (
	l1r_id 			NUMBER(10) 	NOT NULL,
	l1r_name 		VARCHAR2(10) 	NOT NULL,
	l1r_version 		NUMBER(11)	NOT NULL,
	l1r_rate1 		NUMBER(10) 	NOT NULL,
	l1r_rate2 		NUMBER(10) 	NOT NULL,
	l1r_autoseed1		CHAR		NOT NULL,
	l1r_autoseed2		CHAR		NOT NULL,
	l1r_seed1		NUMBER(10)	NOT NULL,
	l1r_seed2		NUMBER(10)	NOT NULL,
	l1r_username		VARCHAR2(30)	,
	l1r_modified_time	TIMESTAMP 	,
	l1r_used		CHAR		NOT NULL,
	CONSTRAINT		l1r_pk		PRIMARY KEY (l1r_id),
	CONSTRAINT		l1r_nmver	UNIQUE (l1r_name, l1r_version)
	);

CREATE TABLE l1_prescaled_clock (
	l1pc_id 		NUMBER(10) 	NOT NULL,
	l1pc_name 		VARCHAR2(10) 	NOT NULL,
	l1pc_version 		NUMBER(11)	NOT NULL,
	l1pc_clock1 		NUMBER(10) 	NOT NULL,
	l1pc_clock2 		NUMBER(10) 	NOT NULL,
	l1pc_username 		VARCHAR2(30)	,
	l1pc_modified_time	TIMESTAMP	,
	l1pc_used		CHAR		NOT NULL,
	CONSTRAINT		psc_pk		PRIMARY KEY (l1pc_id),
	CONSTRAINT		psc_nmver	UNIQUE (l1pc_name, l1pc_version)
	);

CREATE TABLE l1_jet_input (
	l1ji_id 		NUMBER(10) 	NOT NULL,
	l1ji_name 		VARCHAR2(10) 	NOT NULL,
	l1ji_version 		NUMBER(11)	NOT NULL,
	l1ji_type		VARCHAR2(6)	NOT NULL,
	l1ji_value 		NUMBER(10) 	NOT NULL,
	l1ji_eta_min 		NUMBER(10) 	NOT NULL,
	l1ji_eta_max 		NUMBER(10) 	NOT NULL,
	l1ji_phi_min 		NUMBER(10) 	NOT NULL,
	l1ji_phi_max 		NUMBER(10) 	NOT NULL,
	l1ji_username		VARCHAR2(30)	,
	l1ji_modified_time	TIMESTAMP 	,
	l1ji_used		CHAR 		NOT NULL,
	CONSTRAINT		l1ji_pk		PRIMARY KEY (l1ji_id),
	CONSTRAINT 		l1ji_nmver	UNIQUE (l1ji_name, l1ji_version)
	);

CREATE TABLE l1_calo_sin_cos (
	l1csc_id 		NUMBER(10) 	NOT NULL,
	l1csc_name 		VARCHAR2(10) 	NOT NULL,
	l1csc_version 		NUMBER(11)	NOT NULL,
	l1csc_val1 		NUMBER(10) 	NOT NULL,
	l1csc_val2 		NUMBER(10) 	NOT NULL,
	l1csc_val3 		NUMBER(10) 	NOT NULL,
	l1csc_val4 		NUMBER(10) 	NOT NULL,
	l1csc_val5 		NUMBER(10) 	NOT NULL,
	l1csc_val6 		NUMBER(10) 	NOT NULL,
	l1csc_val7 		NUMBER(10) 	NOT NULL,
	l1csc_val8 		NUMBER(10) 	NOT NULL,
	l1csc_eta_min 		NUMBER(10) 	NOT NULL,
	l1csc_eta_max 		NUMBER(10) 	NOT NULL,
	l1csc_phi_min 		NUMBER(10) 	NOT NULL,
	l1csc_phi_max 		NUMBER(10) 	NOT NULL,
	l1csc_username		VARCHAR2(30)	,
	l1csc_modified_time	TIMESTAMP 	,
	l1csc_used		CHAR 		NOT NULL,
	CONSTRAINT		l1csc_pk	PRIMARY KEY (l1csc_id),
	CONSTRAINT		l1csc_nmver	UNIQUE (l1csc_name, l1csc_version)
	);

CREATE TABLE l1_bunch_group_set (
	l1bgs_id		NUMBER(10)	NOT NULL,
	l1bgs_name 		VARCHAR2(10)	NOT NULL,
	l1bgs_version		NUMBER(11)	NOT NULL,
	l1bgs_username		VARCHAR2(30)	,
	l1bgs_modified_time	TIMESTAMP	,
	l1bgs_used		CHAR		NOT NULL,
	CONSTRAINT		l1bgs_pk	PRIMARY KEY (l1bgs_id),
	CONSTRAINT		l1bgs_nmver	UNIQUE (l1bgs_name, l1bgs_version)
	);

CREATE TABLE l1_bunch_group (
	l1bg_id			NUMBER(10)	NOT NULL,
	l1bg_name 		VARCHAR2(10)	NOT NULL,
	l1bg_version		NUMBER(11)	NOT NULL,
	l1bg_username		VARCHAR2(30)	,
	l1bg_modified_time	TIMESTAMP	,
	l1bg_used		CHAR		NOT NULL,
	CONSTRAINT		l1bg_pk		PRIMARY KEY (l1bg_id),
	CONSTRAINT 		l1bg_nmver	UNIQUE (l1bg_name, l1bg_version)
	);

CREATE TABLE l1_ctp_files ( 
	l1cf_id 		NUMBER(10) 	NOT NULL,
	l1cf_name 		VARCHAR2(15) 	NOT NULL,
	l1cf_version 		NUMBER(11)	NOT NULL,
	l1cf_lut		CLOB		,
	l1cf_cam		CLOB		,
	l1cf_username		VARCHAR2(30)	,
	l1cf_modified_time	TIMESTAMP	,
	l1cf_used		CHAR		NOT NULL,
	CONSTRAINT 		l1cf_pk		PRIMARY KEY (l1cf_id),
	CONSTRAINT 		l1cf_nmver	UNIQUE (l1cf_name, l1cf_version)
	);

CREATE TABLE l1_ctp_smx (
	l1smx_id		NUMBER(10)	NOT NULL,
	l1smx_name 		VARCHAR2(15)	NOT NULL,
	l1smx_version		NUMBER(11)	NOT NULL,
	l1smx_output		CLOB		,
	l1smx_vhdl_slot7	CLOB		,
	l1smx_vhdl_slot8	CLOB		,
	l1smx_vhdl_slot9	CLOB		,
	l1smx_bin_slot7		BLOB		,
	l1smx_bin_slot8		BLOB		,
	l1smx_bin_slot9		BLOB		,		
	l1smx_username		VARCHAR2(30)	,
	l1smx_modified_time	TIMESTAMP	,
	l1smx_used		CHAR		NOT NULL,
	CONSTRAINT		l1smx_pk	PRIMARY KEY (l1smx_id),
	CONSTRAINT		l1smx_nmver	UNIQUE (l1smx_name, l1smx_version)
	);

CREATE TABLE l1_trigger_menu (
	l1tm_id 		NUMBER(10) 	NOT NULL,
	l1tm_name 		VARCHAR2(15) 	NOT NULL,
	l1tm_version 		NUMBER(11)	NOT NULL,
	l1tm_phase 		VARCHAR2(20) 	NOT NULL,
	l1tm_ctp_safe		CHAR		NOT NULL,
	l1tm_ctp_files_id	NUMBER(10) 	,
	l1tm_ctp_smx_id		NUMBER(10)	,
	l1tm_username		VARCHAR2(30)	,
	l1tm_modified_time	TIMESTAMP	,
	l1tm_used		CHAR		NOT NULL,
	CONSTRAINT		l1tm_fk_cf	FOREIGN KEY (l1tm_ctp_files_id)
						REFERENCES l1_ctp_files(l1cf_id),
	CONSTRAINT		l1tm_fk_smx	FOREIGN KEY (l1tm_ctp_smx_id)
						REFERENCES l1_ctp_smx(l1smx_id),
	CONSTRAINT 		l1tm_pk		PRIMARY KEY (l1tm_id),
	CONSTRAINT 		l1tm_nmver	UNIQUE (l1tm_name, l1tm_version)
	);

CREATE TABLE l1_trigger_item (
	l1ti_id 		NUMBER(10) 	NOT NULL,
	l1ti_name 		VARCHAR2(20) 	NOT NULL,
	l1ti_version 		NUMBER(11)	NOT NULL,
	l1ti_comment		VARCHAR2(50)	,
	l1ti_ctp_id		NUMBER(10) 	NOT NULL,
	l1ti_priority		VARCHAR2(6)	NOT NULL,
	l1ti_definition		VARCHAR2(64)	NOT NULL,
	l1ti_group		NUMBER(10)	NOT NULL,
	l1ti_trigger_type	NUMBER(4) 	,
	l1ti_username		VARCHAR2(30)	,
	l1ti_modified_time	TIMESTAMP	,
	l1ti_used		CHAR		NOT NULL,
	CONSTRAINT		l1ti_pk		PRIMARY KEY (l1ti_id),
	CONSTRAINT		l1ti_nmver	UNIQUE (l1ti_name, l1ti_version)
	);

CREATE TABLE l1_trigger_threshold (
	l1tt_id 		NUMBER(10) 	NOT NULL ,
	l1tt_name 		VARCHAR2(20) 	NOT NULL,
	l1tt_version 		NUMBER(11)	NOT NULL,
	l1tt_type 		VARCHAR2(6) 	NOT NULL,
	l1tt_bitnum 		NUMBER(10) 	NOT NULL,
	l1tt_active     NUMBER(1),
	l1tt_mapping    NUMBER(10)  NOT NULL,
	l1tt_username		VARCHAR2(30)	,
	l1tt_modified_time	TIMESTAMP	,
	l1tt_used		CHAR		NOT NULL,
	CONSTRAINT		l1tt_pk		PRIMARY KEY (l1tt_id),
	CONSTRAINT 		l1tt_nmver	UNIQUE (l1tt_name, l1tt_version)
	);

CREATE TABLE l1_trigger_threshold_value (
	l1ttv_id 		NUMBER(10) 	NOT NULL,
	l1ttv_name 		VARCHAR2(20) 	NOT NULL,
	l1ttv_version 		NUMBER(11)	NOT NULL,
	l1ttv_type		VARCHAR2(10)	NOT NULL,
	l1ttv_pt_cut 		FLOAT(24) 	NOT NULL,
	l1ttv_eta_min 		NUMBER(10) 	,
	l1ttv_eta_max 		NUMBER(10) 	,
	l1ttv_phi_min 		NUMBER(10) 	,
	l1ttv_phi_max 		NUMBER(10) 	,
	l1ttv_em_isolation 	FLOAT(24) 	,
	l1ttv_had_isolation 	FLOAT(24) 	,
	l1ttv_had_veto 		FLOAT(24) 	,
	l1ttv_window 		NUMBER(10) 	,
	l1ttv_priority		FLOAT(24)	,
	l1ttv_username		VARCHAR2(30)	,
	l1ttv_modified_time	TIMESTAMP	,
	l1ttv_used		CHAR		NOT NULL,
	CONSTRAINT		l1ttv_pk	PRIMARY KEY (l1ttv_id),
	CONSTRAINT		l1ttv_nmver	UNIQUE (l1ttv_name, l1ttv_version)
	);

CREATE TABLE l1_calo_info (
        l1ci_id         	        NUMBER(10)      NOT NULL,
        l1ci_name	                VARCHAR2(20)    NOT NULL,
        l1ci_version                    NUMBER(11)      NOT NULL,
	l1ci_global_scale		FLOAT(24)   	NOT NULL,
	l1ci_jet_weight1		NUMBER(10)	NOT NULL,
	l1ci_jet_weight2		NUMBER(10)	NOT NULL,
	l1ci_jet_weight3		NUMBER(10)	NOT NULL,
	l1ci_jet_weight4		NUMBER(10)	NOT NULL,
	l1ci_jet_weight5		NUMBER(10)	NOT NULL,
	l1ci_jet_weight6		NUMBER(10)	NOT NULL,
	l1ci_jet_weight7		NUMBER(10)	NOT NULL,
	l1ci_jet_weight8		NUMBER(10)	NOT NULL,
	l1ci_jet_weight9		NUMBER(10)	NOT NULL,
	l1ci_jet_weight10		NUMBER(10)	NOT NULL,
	l1ci_jet_weight11		NUMBER(10)	NOT NULL,
	l1ci_jet_weight12		NUMBER(10)	NOT NULL,
	l1ci_username      	        VARCHAR2(30)    ,
        l1ci_modified_time 		TIMESTAMP       ,
        l1ci_used               	CHAR            NOT NULL,
        CONSTRAINT              	l1ci_pk         PRIMARY KEY (l1ci_id)
	);

CREATE TABLE l1_muon_threshold_sets (
	l1mts_id 		NUMBER(10) 	NOT NULL ,
	l1mts_name 		VARCHAR2(20) 	NOT NULL,
	l1mts_version 		NUMBER(11)	NOT NULL,
	l1mts_pt1 		NUMBER(5) 	NOT NULL,
	l1mts_pt2 		NUMBER(5) 	NOT NULL,
	l1mts_pt3 		NUMBER(5) 	NOT NULL,
	l1mts_pt4 		NUMBER(5) 	NOT NULL,
	l1mts_pt5 		NUMBER(5) 	NOT NULL,
	l1mts_pt6 		NUMBER(5) 	NOT NULL,
	l1mts_avl		CHAR		NOT NULL,
	l1mts_avl_onl		CHAR		NOT NULL,
	l1mts_username		VARCHAR2(30)	,
	l1mts_modified_time	TIMESTAMP	,
	l1mts_used		CHAR		NOT NULL,
	CONSTRAINT		l1mts_pk	PRIMARY KEY (l1mts_id),
	CONSTRAINT 		l1mts_nmver	UNIQUE (l1mts_name, l1mts_version)
	);

CREATE TABLE l1_tm_to_ti ( 
	l1tm2ti_id 			NUMBER(10) 	NOT NULL,
	l1tm2ti_trigger_menu_id 	NUMBER(10) 	NOT NULL,
	l1tm2ti_trigger_item_id 	NUMBER(10) 	NOT NULL,
	l1tm2ti_username 		VARCHAR2(30)	,
	l1tm2ti_modified_time		TIMESTAMP	,
	l1tm2ti_used			CHAR		NOT NULL,
	CONSTRAINT			l1tm2ti_pk	PRIMARY KEY (l1tm2ti_id),
	CONSTRAINT			l1tm2ti_fk_tm	FOREIGN KEY (l1tm2ti_trigger_menu_id) 
							REFERENCES l1_trigger_menu(l1tm_id),
	CONSTRAINT			l1tm2ti_fk_ti 	FOREIGN KEY (l1tm2ti_trigger_item_id) 
							REFERENCES l1_trigger_item(l1ti_id)
	);

CREATE TABLE l1_ti_to_tt ( 
	l1ti2tt_id 			NUMBER(10) 	NOT NULL,
	l1ti2tt_trigger_item_id 	NUMBER(10) 	NOT NULL,
	l1ti2tt_trigger_threshold_id 	NUMBER(10) 	NOT NULL,
	l1ti2tt_position		NUMBER(10)	NOT NULL,
	l1ti2tt_multiplicity		NUMBER(10)	NOT NULL,
	l1ti2tt_username 		VARCHAR2(30)	,
	l1ti2tt_modified_time		TIMESTAMP	,
	l1ti2tt_used			CHAR		NOT NULL,
	CONSTRAINT			l1ti2tt_pk	PRIMARY KEY (l1ti2tt_id),
	CONSTRAINT			l1ti2tt_fk_ti	FOREIGN KEY (l1ti2tt_trigger_item_id) 
							REFERENCES l1_trigger_item(l1ti_id),
	CONSTRAINT			l1ti2tt_fk_tt	FOREIGN KEY (l1ti2tt_trigger_threshold_id)
							REFERENCES l1_trigger_threshold(l1tt_id)
	);

CREATE TABLE l1_tt_to_ttv (
	l1tt2ttv_id 				NUMBER(10) 	NOT NULL, 
	l1tt2ttv_trigger_threshold_id 		NUMBER(10) 	NOT NULL, 
	l1tt2ttv_trig_thres_value_id 		NUMBER(10) 	NOT NULL,
	l1tt2ttv_username 			VARCHAR2(30)	,
	l1tt2ttv_modified_time			TIMESTAMP	,
	l1tt2ttv_used				CHAR		NOT NULL,
	CONSTRAINT				l1tt2ttv_pk	PRIMARY KEY (l1tt2ttv_id),
	CONSTRAINT				l1tt2ttv_fk_tt	FOREIGN KEY (l1tt2ttv_trigger_threshold_id)
								REFERENCES l1_trigger_threshold(l1tt_id),
	CONSTRAINT				l1tt2ttv_fk_ttv	FOREIGN KEY (l1tt2ttv_trig_thres_value_id)
								REFERENCES l1_trigger_threshold_value(l1ttv_id)
	);

CREATE TABLE l1_tm_to_tt_forced ( 
	l1tm2ttf_id 			NUMBER(10) 	NOT NULL,
	l1tm2ttf_trigger_menu_id 	NUMBER(10) 	NOT NULL,
	l1tm2ttf_trigger_threshold_id 	NUMBER(10) 	NOT NULL,
	l1tm2ttf_username 		VARCHAR2(30)	,
	l1tm2ttf_modified_time		TIMESTAMP	,
	l1tm2ttf_used			CHAR		NOT NULL,
	CONSTRAINT			l1tm2ttf_pk	PRIMARY KEY (l1tm2ttf_id),
	CONSTRAINT			l1tm2ttf_fk_tm	FOREIGN KEY (l1tm2ttf_trigger_menu_id) 
							REFERENCES l1_trigger_menu(l1tm_id),
	CONSTRAINT			l1tm2ttf_fk_tt	FOREIGN KEY (l1tm2ttf_trigger_threshold_id)
							REFERENCES l1_trigger_threshold(l1tt_id)
	);

CREATE TABLE l1_tm_to_tt ( 
	l1tm2tt_id 			NUMBER(10) 	NOT NULL,
	l1tm2tt_trigger_menu_id 	NUMBER(10) 	NOT NULL,
	l1tm2tt_trigger_threshold_id 	NUMBER(10) 	NOT NULL,
	l1tm2tt_cable_name		VARCHAR2(5)	NOT NULL,
	l1tm2tt_cable_ctpin		VARCHAR2(5)	NOT NULL,
	l1tm2tt_cable_connector		VARCHAR2(5)	NOT NULL,
	l1tm2tt_cable_start		NUMBER(10)	NOT NULL,
	l1tm2tt_cable_end		NUMBER(10)	NOT NULL,
	l1tm2tt_username 		VARCHAR2(30)	,
	l1tm2tt_modified_time		TIMESTAMP	,
	l1tm2tt_used			CHAR		NOT NULL,
	CONSTRAINT			l1tm2tt_pk	PRIMARY KEY (l1tm2tt_id),
	CONSTRAINT			l1tm2tt_fk_tm	FOREIGN KEY (l1tm2tt_trigger_menu_id) 
							REFERENCES l1_trigger_menu(l1tm_id),
	CONSTRAINT			l1tm2tt_fk_tt	FOREIGN KEY (l1tm2tt_trigger_threshold_id)
							REFERENCES l1_trigger_threshold(l1tt_id)
	);

CREATE TABLE l1_bgs_to_bg (
	l1bgs2bg_id 			NUMBER(10) 	NOT NULL, 
	l1bgs2bg_bunch_group_set_id 	NUMBER(10) 	NOT NULL, 
	l1bgs2bg_bunch_group_id 	NUMBER(10) 	NOT NULL,
	l1bgs2bg_internal_number	NUMBER(2)	NOT NULL,
	l1bgs2bg_username		VARCHAR2(30)	,
	l1bgs2bg_modified_time		TIMESTAMP	,
	l1bgs2bg_used			CHAR		NOT NULL,
	CONSTRAINT			l1bgs2bg_pk	PRIMARY KEY (l1bgs2bg_id),
	CONSTRAINT			l1bgs2bg_fk_bgs	FOREIGN KEY (l1bgs2bg_bunch_group_set_id)
							REFERENCES l1_bunch_group_set(l1bgs_id),
	CONSTRAINT			l1bgs2bg_fk_bg	FOREIGN KEY (l1bgs2bg_bunch_group_id)
							REFERENCES l1_bunch_group(l1bg_id)
	);

CREATE TABLE l1_bg_to_b (
	l1bg2b_id 			NUMBER(10) 	NOT NULL, 
	l1bg2b_bunch_group_id 		NUMBER(10) 	NOT NULL,
	l1bg2b_bunch_number		NUMBER(10)	NOT NULL,
	l1bg2b_username			VARCHAR2(30)	,
	l1bg2b_modified_time		TIMESTAMP	,
	l1bg2b_used			CHAR		NOT NULL,
	CONSTRAINT			l1bg2b_pk	PRIMARY KEY (l1bg2b_id),
	CONSTRAINT			l1bg2b_fk_bg	FOREIGN KEY (l1bg2b_bunch_group_id)
							REFERENCES l1_bunch_group(l1bg_id)
	);

CREATE TABLE l1_ci_to_csc (
	l1ci2csc_id                       NUMBER(10)      NOT NULL,
        l1ci2csc_calo_info_id             NUMBER(10)      NOT NULL,
        l1ci2csc_calo_sin_cos_id          NUMBER(10)      NOT NULL,
        l1ci2csc_username                 VARCHAR2(30)    ,
        l1ci2csc_modified_time            TIMESTAMP       ,
        l1ci2csc_used                     CHAR            NOT NULL,
        CONSTRAINT                        l1ci2csc_pk     PRIMARY KEY (l1ci2csc_id),
        CONSTRAINT                        l1ci2csc_fk_ci  FOREIGN KEY (l1ci2csc_calo_info_id)
                                                          REFERENCES l1_calo_info(l1ci_id),
        CONSTRAINT                        l1ci2csc_fk_csc FOREIGN KEY (l1ci2csc_calo_sin_cos_id)
                                                          REFERENCES l1_calo_sin_cos(l1csc_id)
	);

CREATE TABLE l1_prescale_set (
	l1ps_id			NUMBER(10)	NOT NULL,
	l1ps_name		VARCHAR2(20)	NOT NULL,
	l1ps_version		NUMBER(11)	NOT NULL,
	l1ps_lumi		FLOAT		NOT NULL,
	l1ps_trigger_menu_id	NUMBER(10)	NOT NULL,
	l1ps_shift_safe		CHAR		NOT NULL,
	l1ps_default		CHAR		NOT NULL,
	l1ps_val1		NUMBER(10)	NOT NULL,
	l1ps_val2		NUMBER(10)	NOT NULL,
	l1ps_val3		NUMBER(10)	NOT NULL,
	l1ps_val4		NUMBER(10)	NOT NULL,
	l1ps_val5		NUMBER(10)	NOT NULL,
	l1ps_val6		NUMBER(10)	NOT NULL,
	l1ps_val7		NUMBER(10)	NOT NULL,
	l1ps_val8		NUMBER(10)	NOT NULL,
	l1ps_val9		NUMBER(10)	NOT NULL,
	l1ps_val10		NUMBER(10)	NOT NULL,
	l1ps_val11		NUMBER(10)	NOT NULL,
	l1ps_val12		NUMBER(10)	NOT NULL,
	l1ps_val13		NUMBER(10)	NOT NULL,
	l1ps_val14		NUMBER(10)	NOT NULL,
	l1ps_val15		NUMBER(10)	NOT NULL,
	l1ps_val16		NUMBER(10)	NOT NULL,
	l1ps_val17		NUMBER(10)	NOT NULL,
	l1ps_val18		NUMBER(10)	NOT NULL,
	l1ps_val19		NUMBER(10)	NOT NULL,
	l1ps_val20		NUMBER(10)	NOT NULL,
	l1ps_val21		NUMBER(10)	NOT NULL,
	l1ps_val22		NUMBER(10)	NOT NULL,
	l1ps_val23		NUMBER(10)	NOT NULL,
	l1ps_val24		NUMBER(10)	NOT NULL,
	l1ps_val25		NUMBER(10)	NOT NULL,
	l1ps_val26		NUMBER(10)	NOT NULL,
	l1ps_val27		NUMBER(10)	NOT NULL,
	l1ps_val28		NUMBER(10)	NOT NULL,
	l1ps_val29		NUMBER(10)	NOT NULL,
	l1ps_val30		NUMBER(10)	NOT NULL,
	l1ps_val31		NUMBER(10)	NOT NULL,
	l1ps_val32		NUMBER(10)	NOT NULL,
	l1ps_val33		NUMBER(10)	NOT NULL,
	l1ps_val34		NUMBER(10)	NOT NULL,
	l1ps_val35		NUMBER(10)	NOT NULL,
	l1ps_val36		NUMBER(10)	NOT NULL,
	l1ps_val37		NUMBER(10)	NOT NULL,
	l1ps_val38		NUMBER(10)	NOT NULL,
	l1ps_val39		NUMBER(10)	NOT NULL,
	l1ps_val40		NUMBER(10)	NOT NULL,
	l1ps_val41		NUMBER(10)	NOT NULL,
	l1ps_val42		NUMBER(10)	NOT NULL,
	l1ps_val43		NUMBER(10)	NOT NULL,
	l1ps_val44		NUMBER(10)	NOT NULL,
	l1ps_val45		NUMBER(10)	NOT NULL,
	l1ps_val46		NUMBER(10)	NOT NULL,
	l1ps_val47		NUMBER(10)	NOT NULL,
	l1ps_val48		NUMBER(10)	NOT NULL,
	l1ps_val49		NUMBER(10)	NOT NULL,
	l1ps_val50		NUMBER(10)	NOT NULL,
	l1ps_val51		NUMBER(10)	NOT NULL,
	l1ps_val52		NUMBER(10)	NOT NULL,
	l1ps_val53		NUMBER(10)	NOT NULL,
	l1ps_val54		NUMBER(10)	NOT NULL,
	l1ps_val55		NUMBER(10)	NOT NULL,
	l1ps_val56		NUMBER(10)	NOT NULL,
	l1ps_val57		NUMBER(10)	NOT NULL,
	l1ps_val58		NUMBER(10)	NOT NULL,
	l1ps_val59		NUMBER(10)	NOT NULL,
	l1ps_val60		NUMBER(10)	NOT NULL,
	l1ps_val61		NUMBER(10)	NOT NULL,
	l1ps_val62		NUMBER(10)	NOT NULL,
	l1ps_val63		NUMBER(10)	NOT NULL,
	l1ps_val64		NUMBER(10)	NOT NULL,
	l1ps_val65		NUMBER(10)	NOT NULL,
	l1ps_val66		NUMBER(10)	NOT NULL,
	l1ps_val67		NUMBER(10)	NOT NULL,
	l1ps_val68		NUMBER(10)	NOT NULL,
	l1ps_val69		NUMBER(10)	NOT NULL,
	l1ps_val70		NUMBER(10)	NOT NULL,
	l1ps_val71		NUMBER(10)	NOT NULL,
	l1ps_val72		NUMBER(10)	NOT NULL,
	l1ps_val73		NUMBER(10)	NOT NULL,
	l1ps_val74		NUMBER(10)	NOT NULL,
	l1ps_val75		NUMBER(10)	NOT NULL,
	l1ps_val76		NUMBER(10)	NOT NULL,
	l1ps_val77		NUMBER(10)	NOT NULL,
	l1ps_val78		NUMBER(10)	NOT NULL,
	l1ps_val79		NUMBER(10)	NOT NULL,
	l1ps_val80		NUMBER(10)	NOT NULL,
	l1ps_val81		NUMBER(10)	NOT NULL,
	l1ps_val82		NUMBER(10)	NOT NULL,
	l1ps_val83		NUMBER(10)	NOT NULL,
	l1ps_val84		NUMBER(10)	NOT NULL,
	l1ps_val85		NUMBER(10)	NOT NULL,
	l1ps_val86		NUMBER(10)	NOT NULL,
	l1ps_val87		NUMBER(10)	NOT NULL,
	l1ps_val88		NUMBER(10)	NOT NULL,
	l1ps_val89		NUMBER(10)	NOT NULL,
	l1ps_val90		NUMBER(10)	NOT NULL,
	l1ps_val91		NUMBER(10)	NOT NULL,
	l1ps_val92		NUMBER(10)	NOT NULL,
	l1ps_val93		NUMBER(10)	NOT NULL,
	l1ps_val94		NUMBER(10)	NOT NULL,
	l1ps_val95		NUMBER(10)	NOT NULL,
	l1ps_val96		NUMBER(10)	NOT NULL,
	l1ps_val97		NUMBER(10)	NOT NULL,
	l1ps_val98		NUMBER(10)	NOT NULL,
	l1ps_val99		NUMBER(10)	NOT NULL,
	l1ps_val100		NUMBER(10)	NOT NULL,
	l1ps_val101		NUMBER(10)	NOT NULL,
	l1ps_val102		NUMBER(10)	NOT NULL,
	l1ps_val103		NUMBER(10)	NOT NULL,
	l1ps_val104		NUMBER(10)	NOT NULL,
	l1ps_val105		NUMBER(10)	NOT NULL,
	l1ps_val106		NUMBER(10)	NOT NULL,
	l1ps_val107		NUMBER(10)	NOT NULL,
	l1ps_val108		NUMBER(10)	NOT NULL,
	l1ps_val109		NUMBER(10)	NOT NULL,
	l1ps_val110		NUMBER(10)	NOT NULL,
	l1ps_val111		NUMBER(10)	NOT NULL,
	l1ps_val112		NUMBER(10)	NOT NULL,
	l1ps_val113		NUMBER(10)	NOT NULL,
	l1ps_val114		NUMBER(10)	NOT NULL,
	l1ps_val115		NUMBER(10)	NOT NULL,
	l1ps_val116		NUMBER(10)	NOT NULL,
	l1ps_val117		NUMBER(10)	NOT NULL,
	l1ps_val118		NUMBER(10)	NOT NULL,
	l1ps_val119		NUMBER(10)	NOT NULL,
	l1ps_val120		NUMBER(10)	NOT NULL,
	l1ps_val121		NUMBER(10)	NOT NULL,
	l1ps_val122		NUMBER(10)	NOT NULL,
	l1ps_val123		NUMBER(10)	NOT NULL,
	l1ps_val124		NUMBER(10)	NOT NULL,
	l1ps_val125		NUMBER(10)	NOT NULL,
	l1ps_val126		NUMBER(10)	NOT NULL,
	l1ps_val127		NUMBER(10)	NOT NULL,
	l1ps_val128		NUMBER(10)	NOT NULL,
	l1ps_val129		NUMBER(10)	NOT NULL,
	l1ps_val130		NUMBER(10)	NOT NULL,
	l1ps_val131		NUMBER(10)	NOT NULL,
	l1ps_val132		NUMBER(10)	NOT NULL,
	l1ps_val133		NUMBER(10)	NOT NULL,
	l1ps_val134		NUMBER(10)	NOT NULL,
	l1ps_val135		NUMBER(10)	NOT NULL,
	l1ps_val136		NUMBER(10)	NOT NULL,
	l1ps_val137		NUMBER(10)	NOT NULL,
	l1ps_val138		NUMBER(10)	NOT NULL,
	l1ps_val139		NUMBER(10)	NOT NULL,
	l1ps_val140		NUMBER(10)	NOT NULL,
	l1ps_val141		NUMBER(10)	NOT NULL,
	l1ps_val142		NUMBER(10)	NOT NULL,
	l1ps_val143		NUMBER(10)	NOT NULL,
	l1ps_val144		NUMBER(10)	NOT NULL,
	l1ps_val145		NUMBER(10)	NOT NULL,
	l1ps_val146		NUMBER(10)	NOT NULL,
	l1ps_val147		NUMBER(10)	NOT NULL,
	l1ps_val148		NUMBER(10)	NOT NULL,
	l1ps_val149		NUMBER(10)	NOT NULL,
	l1ps_val150		NUMBER(10)	NOT NULL,
	l1ps_val151		NUMBER(10)	NOT NULL,
	l1ps_val152		NUMBER(10)	NOT NULL,
	l1ps_val153		NUMBER(10)	NOT NULL,
	l1ps_val154		NUMBER(10)	NOT NULL,
	l1ps_val155		NUMBER(10)	NOT NULL,
	l1ps_val156		NUMBER(10)	NOT NULL,
	l1ps_val157		NUMBER(10)	NOT NULL,
	l1ps_val158		NUMBER(10)	NOT NULL,
	l1ps_val159		NUMBER(10)	NOT NULL,
	l1ps_val160		NUMBER(10)	NOT NULL,
	l1ps_val161		NUMBER(10)	NOT NULL,
	l1ps_val162		NUMBER(10)	NOT NULL,
	l1ps_val163		NUMBER(10)	NOT NULL,
	l1ps_val164		NUMBER(10)	NOT NULL,
	l1ps_val165		NUMBER(10)	NOT NULL,
	l1ps_val166		NUMBER(10)	NOT NULL,
	l1ps_val167		NUMBER(10)	NOT NULL,
	l1ps_val168		NUMBER(10)	NOT NULL,
	l1ps_val169		NUMBER(10)	NOT NULL,
	l1ps_val170		NUMBER(10)	NOT NULL,
	l1ps_val171		NUMBER(10)	NOT NULL,
	l1ps_val172		NUMBER(10)	NOT NULL,
	l1ps_val173		NUMBER(10)	NOT NULL,
	l1ps_val174		NUMBER(10)	NOT NULL,
	l1ps_val175		NUMBER(10)	NOT NULL,
	l1ps_val176		NUMBER(10)	NOT NULL,
	l1ps_val177		NUMBER(10)	NOT NULL,
	l1ps_val178		NUMBER(10)	NOT NULL,
	l1ps_val179		NUMBER(10)	NOT NULL,
	l1ps_val180		NUMBER(10)	NOT NULL,
	l1ps_val181		NUMBER(10)	NOT NULL,
	l1ps_val182		NUMBER(10)	NOT NULL,
	l1ps_val183		NUMBER(10)	NOT NULL,
	l1ps_val184		NUMBER(10)	NOT NULL,
	l1ps_val185		NUMBER(10)	NOT NULL,
	l1ps_val186		NUMBER(10)	NOT NULL,
	l1ps_val187		NUMBER(10)	NOT NULL,
	l1ps_val188		NUMBER(10)	NOT NULL,
	l1ps_val189		NUMBER(10)	NOT NULL,
	l1ps_val190		NUMBER(10)	NOT NULL,
	l1ps_val191		NUMBER(10)	NOT NULL,
	l1ps_val192		NUMBER(10)	NOT NULL,
	l1ps_val193		NUMBER(10)	NOT NULL,
	l1ps_val194		NUMBER(10)	NOT NULL,
	l1ps_val195		NUMBER(10)	NOT NULL,
	l1ps_val196		NUMBER(10)	NOT NULL,
	l1ps_val197		NUMBER(10)	NOT NULL,
	l1ps_val198		NUMBER(10)	NOT NULL,
	l1ps_val199		NUMBER(10)	NOT NULL,
	l1ps_val200		NUMBER(10)	NOT NULL,
	l1ps_val201		NUMBER(10)	NOT NULL,
	l1ps_val202		NUMBER(10)	NOT NULL,
	l1ps_val203		NUMBER(10)	NOT NULL,
	l1ps_val204		NUMBER(10)	NOT NULL,
	l1ps_val205		NUMBER(10)	NOT NULL,
	l1ps_val206		NUMBER(10)	NOT NULL,
	l1ps_val207		NUMBER(10)	NOT NULL,
	l1ps_val208		NUMBER(10)	NOT NULL,
	l1ps_val209		NUMBER(10)	NOT NULL,
	l1ps_val210		NUMBER(10)	NOT NULL,
	l1ps_val211		NUMBER(10)	NOT NULL,
	l1ps_val212		NUMBER(10)	NOT NULL,
	l1ps_val213		NUMBER(10)	NOT NULL,
	l1ps_val214		NUMBER(10)	NOT NULL,
	l1ps_val215		NUMBER(10)	NOT NULL,
	l1ps_val216		NUMBER(10)	NOT NULL,
	l1ps_val217		NUMBER(10)	NOT NULL,
	l1ps_val218		NUMBER(10)	NOT NULL,
	l1ps_val219		NUMBER(10)	NOT NULL,
	l1ps_val220		NUMBER(10)	NOT NULL,
	l1ps_val221		NUMBER(10)	NOT NULL,
	l1ps_val222		NUMBER(10)	NOT NULL,
	l1ps_val223		NUMBER(10)	NOT NULL,
	l1ps_val224		NUMBER(10)	NOT NULL,
	l1ps_val225		NUMBER(10)	NOT NULL,
	l1ps_val226		NUMBER(10)	NOT NULL,
	l1ps_val227		NUMBER(10)	NOT NULL,
	l1ps_val228		NUMBER(10)	NOT NULL,
	l1ps_val229		NUMBER(10)	NOT NULL,
	l1ps_val230		NUMBER(10)	NOT NULL,
	l1ps_val231		NUMBER(10)	NOT NULL,
	l1ps_val232		NUMBER(10)	NOT NULL,
	l1ps_val233		NUMBER(10)	NOT NULL,
	l1ps_val234		NUMBER(10)	NOT NULL,
	l1ps_val235		NUMBER(10)	NOT NULL,
	l1ps_val236		NUMBER(10)	NOT NULL,
	l1ps_val237		NUMBER(10)	NOT NULL,
	l1ps_val238		NUMBER(10)	NOT NULL,
	l1ps_val239		NUMBER(10)	NOT NULL,
	l1ps_val240		NUMBER(10)	NOT NULL,
	l1ps_val241		NUMBER(10)	NOT NULL,
	l1ps_val242		NUMBER(10)	NOT NULL,
	l1ps_val243		NUMBER(10)	NOT NULL,
	l1ps_val244		NUMBER(10)	NOT NULL,
	l1ps_val245		NUMBER(10)	NOT NULL,
	l1ps_val246		NUMBER(10)	NOT NULL,
	l1ps_val247		NUMBER(10)	NOT NULL,
	l1ps_val248		NUMBER(10)	NOT NULL,
	l1ps_val249		NUMBER(10)	NOT NULL,
	l1ps_val250		NUMBER(10)	NOT NULL,
	l1ps_val251		NUMBER(10)	NOT NULL,
	l1ps_val252		NUMBER(10)	NOT NULL,
	l1ps_val253		NUMBER(10)	NOT NULL,
	l1ps_val254		NUMBER(10)	NOT NULL,
	l1ps_val255		NUMBER(10)	NOT NULL,
	l1ps_val256		NUMBER(10)	NOT NULL,
	l1ps_username		VARCHAR2(30)	,
	l1ps_modified_time	TIMESTAMP	,
	l1ps_used		CHAR		NOT NULL,
	CONSTRAINT		l1ps_pk		PRIMARY KEY (l1ps_id),
	CONSTRAINT		l1ps_fk_tm	FOREIGN KEY (l1ps_trigger_menu_id) 
						REFERENCES l1_trigger_menu(l1tm_id),
	CONSTRAINT 		l1ps_nmver	UNIQUE (l1ps_name, l1ps_version)
	);

CREATE TABLE l1_master_table (
	l1mt_id		 	NUMBER(10) 	NOT NULL,
	l1mt_name		VARCHAR2(20)	NOT NULL,
	l1mt_version		NUMBER(11)	NOT NULL,
	l1mt_trigger_menu_id	NUMBER(10) 	NOT NULL,
	l1mt_prescale_set_id	NUMBER(10)	NOT NULL,
	l1mt_dead_time_id	NUMBER(10)	NOT NULL,
	l1mt_muctpi_info_id	NUMBER(10) 	NOT NULL,
	l1mt_random_id		NUMBER(10)	NOT NULL,
	l1mt_prescaled_clock_id	NUMBER(10)	NOT NULL,
	l1mt_bunch_group_set_id	NUMBER(10)	NOT NULL,
	l1mt_calo_info_id	NUMBER(10)	NOT NULL,
	l1mt_username		VARCHAR2(30)	,
	l1mt_modified_time	TIMESTAMP	,
	l1mt_used		CHAR		NOT NULL,
	l1mt_status		NUMBER(2)	NOT NULL,
	CONSTRAINT		l1mt_pk		PRIMARY KEY (l1mt_id),
	CONSTRAINT		l1mt_fk_tm	FOREIGN KEY (l1mt_trigger_menu_id)
						REFERENCES l1_trigger_menu(l1tm_id),
	CONSTRAINT		l1mt_fk_ps	FOREIGN KEY (l1mt_prescale_set_id)
						REFERENCES l1_prescale_set(l1ps_id),
	CONSTRAINT		l1mt__fk_dt	FOREIGN KEY (l1mt_dead_time_id)
						REFERENCES l1_dead_time(l1dt_id),
	CONSTRAINT		l1mt_fk_mi	FOREIGN KEY (l1mt_muctpi_info_id)
						REFERENCES l1_muctpi_info(l1mi_id),
	CONSTRAINT		l1mt_fk_r	FOREIGN KEY (l1mt_random_id)
						REFERENCES l1_random(l1r_id),
	CONSTRAINT 		l1mt_fk_psc	FOREIGN KEY (l1mt_prescaled_clock_id)
						REFERENCES l1_prescaled_clock(l1pc_id),
	CONSTRAINT		l1mt_fk_bgs	FOREIGN KEY (l1mt_bunch_group_set_id)
						REFERENCES l1_bunch_group_set(l1bgs_id),
	CONSTRAINT		l1mt_fk_ci	FOREIGN KEY (l1mt_calo_info_id)
						REFERENCES l1_calo_info(l1ci_id),
	CONSTRAINT 		l1mt_nmver	UNIQUE (l1mt_name, l1mt_version)
);

CREATE TABLE hlt_parameter (
  hpa_id            NUMBER(10)      AUTO_INCREMENT NOT NULL,
  hpa_name          VARCHAR2(50)    NOT NULL,
  hpa_op            VARCHAR2(30)    NOT NULL,
  hpa_value         VARCHAR2(4000)	NOT NULL,
  hpa_username		  VARCHAR2(30),
  hpa_modified_time	TIMESTAMP,
  hpa_used		      CHAR  default 0 NOT NULL,
  CONSTRAINT        hpa_pk        PRIMARY KEY (hpa_id)
  );

CREATE TABLE hlt_component (
	hcp_id			NUMBER(10) AUTO_INCREMENT NOT NULL,
	hcp_name		VARCHAR2(200) 	NOT NULL,
	hcp_version	NUMBER(11)	    NOT NULL,
	hcp_alias		VARCHAR2(200)   NOT NULL,
	hcp_topalg  NUMBER(1)       NOT NULL,
	hcp_flag		VARCHAR2(50)	  NOT NULL,
	hcp_username      VARCHAR2(30),
	hcp_modified_time	TIMESTAMP	,
	hcp_used		      CHAR default 0 NOT NULL,
	CONSTRAINT		hcp_pk		PRIMARY KEY (hcp_id),
	CONSTRAINT		hcp_nmver 	UNIQUE (hcp_name, hcp_alias, hcp_version)
	);

CREATE TABLE hlt_cp_to_pa (
 	hcp2pa_id		NUMBER(10) AUTO_INCREMENT NOT NULL,
 	hcp2pa_component_id	NUMBER(10) 	NOT NULL,
 	hcp2pa_parameter_id	NUMBER(10) 	NOT NULL,
	hcp2pa_username		VARCHAR2(30)	,
	hcp2pa_modified_time	TIMESTAMP	,
	hcp2pa_used		CHAR		default 0 NOT NULL,
	CONSTRAINT	  	hcp2pa_pk	PRIMARY KEY (hcp2pa_id),
 	CONSTRAINT	  	hcp2pa_fk_cp	FOREIGN KEY (hcp2pa_component_id)
   						REFERENCES hlt_component (hcp_id),
 	CONSTRAINT	  	hcp2pa_fk_pa	FOREIGN KEY (hcp2pa_parameter_id)
   						REFERENCES hlt_parameter (hpa_id)
	);

CREATE TABLE hlt_setup (
	hst_id			NUMBER(10) AUTO_INCREMENT NOT NULL,
	hst_name		VARCHAR2(50)	NOT NULL,
	hst_version		NUMBER(11)	NOT NULL,
	hst_username		VARCHAR2(30)	,
	hst_modified_time	TIMESTAMP	,
	hst_used		CHAR		default 0 NOT NULL,
	CONSTRAINT		hst_pk		PRIMARY KEY (hst_id),
	CONSTRAINT		hst_nmver 	UNIQUE (hst_name, hst_version)
	);

CREATE TABLE hlt_force_dll (
-- 	hfd_id			NUMBER(10) AUTO_INCREMENT NOT NULL,
-- 	hfd_dll_name		VARCHAR2(50)	NOT NULL,
-- 	hfd_username		VARCHAR2(30)	,
-- 	hfd_modified_time	TIMESTAMP	,
-- 	hfd_used		CHAR		NOT NULL,
-- 	CONSTRAINT		hfd_pk 		PRIMARY KEY (hfd_id)
-- 	);

CREATE TABLE hlt_force_dll (
	hfd_id			NUMBER(10) AUTO_INCREMENT NOT NULL,
	hfd_dll_name		VARCHAR2(50)	NOT NULL,
    	hfd_setup_id            NUMBER(10)      NOT NULL,
	hfd_username		VARCHAR2(30)	,
	hfd_modified_time	TIMESTAMP	,
	hfd_used		CHAR		NOT NULL,
	CONSTRAINT		hfd_pk 		PRIMARY KEY (hfd_id),
  	CONSTRAINT    		hfd_fk_st 	FOREIGN KEY (hfd_setup_id) 
						REFERENCES hlt_setup(hst_id)
	);

CREATE TABLE hlt_st_to_cp (
	hst2cp_id		NUMBER(10) AUTO_INCREMENT NOT NULL,
	hst2cp_setup_id 	NUMBER(10) 	NOT NULL,
	hst2cp_component_id	NUMBER(10) 	NOT NULL,
	hst2cp_username		VARCHAR2(30)	,
	hst2cp_modified_time	TIMESTAMP	,
	hst2cp_used		CHAR		default 0 NOT NULL,
	CONSTRAINT		hst2cp_pk	PRIMARY KEY (hst2cp_id),
  	CONSTRAINT		hst2cp_fk_st	FOREIGN KEY (hst2cp_setup_id) 
						REFERENCES hlt_setup(hst_id),
	CONSTRAINT		hst2cp_fk_cp	FOREIGN KEY (hst2cp_component_id) 
						REFERENCES hlt_component(hcp_id)
	);

CREATE TABLE hlt_release (
	hre_id			NUMBER(10) AUTO_INCREMENT NOT NULL,
	hre_name 		VARCHAR2(50)	NOT NULL,
	hre_version		VARCHAR2(50)	NOT NULL,
	hre_username		VARCHAR2(30)	,
	hre_modified_time	TIMESTAMP	,
	hre_used		CHAR		default 0 NOT NULL,
	CONSTRAINT		hre_pk		PRIMARY KEY (hre_id),
	CONSTRAINT		hre_namever 	UNIQUE (hre_name, hre_version)
	);

CREATE TABLE hlt_trigger_menu ( 
	htm_id 			NUMBER(10) 	NOT NULL,
	htm_name 		VARCHAR2(15)    NOT NULL,
	htm_version 		NUMBER(11)      NOT NULL,
	htm_phase 		VARCHAR2(20) 	NOT NULL,
	htm_consistent		CHAR		NOT NULL,
	htm_username		VARCHAR2(30)	,
	htm_modified_time	TIMESTAMP	,
	htm_used		CHAR		NOT NULL,
	CONSTRAINT 		htm_pk		PRIMARY KEY (htm_id),
	CONSTRAINT 		htm_nmver	UNIQUE (htm_name, htm_version)
	);

CREATE TABLE hlt_trigger_chain (
  htc_id                 NUMBER(10)    NOT NULL,
  htc_name               VARCHAR2(20)  NOT NULL,
  htc_version            NUMBER(11)    NOT NULL, 
  htc_chain_counter      NUMBER(10)    NOT NULL,
  htc_lower_chain_name   VARCHAR2(20)  NOT NULL,
  htc_l2_or_ef           VARCHAR2(2)   NOT NULL,
  htc_pass_through_rate  NUMBER(10)    NOT NULL,
  htc_setup_id           NUMBER(10)    NOT NULL,
  htc_username           VARCHAR2(30),
  htc_modified_time      TIMESTAMP,
  htc_used               CHAR          NOT NULL,
  CONSTRAINT htc_pk      PRIMARY KEY (htc_id),
  CONSTRAINT htc_nmver   UNIQUE (htc_name, htc_version),
  CONSTRAINT htc_fk_st   FOREIGN KEY (htc_setup_id) REFERENCES hlt_setup(hst_id)
  );

CREATE TABLE hlt_trigger_signature ( 
	hts_id 			NUMBER(10) 	NOT NULL,
	hts_logic		NUMBER(2)	NOT NULL,
	hts_username 		VARCHAR2(30)	,
	hts_modified_time	TIMESTAMP	,
	hts_used		CHAR		NOT NULL,
	CONSTRAINT 		hts_pk		PRIMARY KEY (hts_id)
	);

CREATE TABLE hlt_trigger_element ( 
	hte_id            NUMBER(10)    NOT NULL,
	hte_name          VARCHAR2(100) NOT NULL,
	hte_version       NUMBER(11)    NOT NULL,
	hte_username      VARCHAR2(30),
	hte_modified_time TIMESTAMP,
	hte_used          CHAR          NOT NULL,
	CONSTRAINT hte_pk	PRIMARY KEY (hte_id)
  );

CREATE TABLE hlt_prescale_set ( 
  hps_id                    NUMBER(10)    NOT NULL,
  hps_name                  VARCHAR2(15)  NOT NULL,
  hps_version               NUMBER(11)    NOT NULL,
  hps_trigger_menu_id       NUMBER(10)    NOT NULL,
  hps_username              VARCHAR2(30),
  hps_modified_time         TIMESTAMP,
  hps_used                  CHAR          NOT NULL,
  CONSTRAINT  hps_pk        PRIMARY KEY (hps_id),
  CONSTRAINT  hps_fk_tm     FOREIGN KEY (hps_trigger_menu_id) 
                              REFERENCES hlt_trigger_menu(htm_id),
  CONSTRAINT  hps_nmver     UNIQUE (hps_name, hps_version)
  );

CREATE TABLE hlt_prescale (
  hpr_id              NUMBER(10)  NOT NULL,
  hpr_prescale_set_id  NUMBER(10)  NOT NULL,
  hpr_chain_counter    NUMBER(10)  NOT NULL,
  hpr_l2_or_ef        VARCHAR2(2) NOT NULL,
  hpr_prescale        NUMBER(10)  NOT NULL,
  hpr_username        VARCHAR2(30),
  hpr_modified_time   TIMESTAMP,
  hpr_used            CHAR        NOT NULL,
  CONSTRAINT     hpr_pk    PRIMARY KEY (hpr_id),
  CONSTRAINT    hpr_fk_ps  FOREIGN KEY (hpr_prescale_set_id) 
            REFERENCES hlt_prescale_set(hps_id)
  );

CREATE TABLE hlt_tm_to_tc ( 
	htm2tc_id 		NUMBER(10) 	NOT NULL,
	htm2tc_trigger_menu_id 	NUMBER(10) 	NOT NULL,
	htm2tc_trigger_chain_id NUMBER(10) 	NOT NULL,
	htm2tc_username 	VARCHAR2(30)	,
	htm2tc_modified_time	TIMESTAMP	,
	htm2tc_used		CHAR		NOT NULL,
	CONSTRAINT		htm2tc_pk	PRIMARY KEY (htm2tc_id),
	CONSTRAINT		htm2tc_fk_tm	FOREIGN KEY (htm2tc_trigger_menu_id) 
						REFERENCES hlt_trigger_menu(htm_id),
	CONSTRAINT		htm2tc_fk_tc	FOREIGN KEY (htm2tc_trigger_chain_id)
						REFERENCES hlt_trigger_chain(htc_id)
	);

CREATE TABLE hlt_tc_to_ts ( 
	htc2ts_id 			NUMBER(10) 	NOT NULL,
	htc2ts_trigger_chain_id 	NUMBER(10) 	NOT NULL,
	htc2ts_trigger_signature_id 		NUMBER(10) 	NOT NULL,
	htc2ts_signature_counter 		NUMBER(10) 	NOT NULL,
	htc2ts_username 		VARCHAR2(30)	,
	htc2ts_modified_time		TIMESTAMP	,
	htc2ts_used			CHAR		NOT NULL,
	CONSTRAINT			htc2ts_pk	PRIMARY KEY (htc2ts_id),
	CONSTRAINT			htc2ts_fk_tc	FOREIGN KEY (htc2ts_trigger_chain_id) 
						 	REFERENCES hlt_trigger_chain(htc_id),
	CONSTRAINT			htc2ts_fk_ts	FOREIGN KEY (htc2ts_trigger_signature_id)
							REFERENCES hlt_trigger_signature(hts_id)
	);

CREATE TABLE hlt_tc_to_st (
--         htc2st_id                       NUMBER(10)      NOT NULL,
--         htc2st_trigger_chain_id 	NUMBER(10)      NOT NULL,
--         htc2st_setup_id		        NUMBER(10)      NOT NULL,
--         htc2st_username                 VARCHAR2(30)    ,
--         htc2st_modified_time            TIMESTAMP       ,
--         htc2st_used                     CHAR            NOT NULL,
--         CONSTRAINT                      htc2st_pk       PRIMARY KEY (htc2st_id),
--         CONSTRAINT                      htc2st_fk_tc    FOREIGN KEY (htc2st_trigger_chain_id)
--                                                         REFERENCES hlt_trigger_chain(htc_id),
--         CONSTRAINT                      htc2st_fk_st    FOREIGN KEY (htc2st_setup_id)
--                                                         REFERENCES hlt_setup(hst_id)
--         );

CREATE TABLE hlt_trigger_group (
  htg_id                 NUMBER(10)   NOT NULL,
  htg_trigger_chain_id   NUMBER(10)   NOT NULL,
  htg_name               VARCHAR2(30) NOT NULL,
  htg_username           VARCHAR2(30),
  htg_modified_time      TIMESTAMP,
  htg_used               CHAR         NOT NULL,
  CONSTRAINT htg_pk      PRIMARY KEY (htg_id),
  CONSTRAINT htg_fk_tc   FOREIGN KEY (htg_trigger_chain_id)  REFERENCES hlt_trigger_chain(htc_id)
);

CREATE TABLE hlt_trigger_type (
  htt_id                 NUMBER(10)   NOT NULL,
  htt_trigger_chain_id   NUMBER(10),
  htt_typebit            NUMBER(10),
  htt_username           VARCHAR2(30),
  htt_modified_time      TIMESTAMP,
  htt_used               CHAR         NOT NULL,
  CONSTRAINT htt_pk      PRIMARY KEY (htt_id),
  CONSTRAINT htt_fk_tc   FOREIGN KEY (htt_trigger_chain_id)  REFERENCES hlt_trigger_chain(htc_id)
);

CREATE TABLE hlt_trigger_stream (
  htr_id                 NUMBER(10)    NOT NULL,
  htr_name        	     VARCHAR2(40)  NOT NULL,
  htr_description        VARCHAR2(200) NOT NULL,
  htr_type               VARCHAR2(25)  NOT NULL,
  htr_obeyLB             NUMBER(1)     NOT NULL,
  htr_username           VARCHAR2(30),
  htr_modified_time      TIMESTAMP,
  htr_used               CHAR          NOT NULL,
  CONSTRAINT htr_pk      PRIMARY KEY (htr_id)
);

CREATE TABLE hlt_tc_to_tr (
  htc2tr_id                      NUMBER(10)   NOT NULL,
  htc2tr_trigger_chain_id        NUMBER(10),
  htc2tr_trigger_stream_id       NUMBER(10),
  htc2tr_trigger_stream_prescale NUMBER(10),
  htc2tr_username                VARCHAR2(30),
  htc2tr_modified_time           TIMESTAMP,
  htc2tr_used                    CHAR         NOT NULL,
  CONSTRAINT htc2tr_pk           PRIMARY KEY (htc2tr_id),
  CONSTRAINT htc2tr_fk_tc        FOREIGN KEY (htc2tr_trigger_chain_id)  REFERENCES hlt_trigger_chain(htc_id),
  CONSTRAINT htc2tr_fk_tm        FOREIGN KEY (htc2tr_trigger_stream_id) REFERENCES hlt_trigger_stream(htr_id)
);

CREATE TABLE hlt_ts_to_te ( 
  hts2te_id                     NUMBER(10)    NOT NULL,
  hts2te_trigger_signature_id   NUMBER(10)    NOT NULL,
  hts2te_trigger_element_id     NUMBER(10)    NOT NULL,
  hts2te_element_counter        NUMBER(10)    NOT NULL,
  hts2te_username               VARCHAR2(30),
  hts2te_modified_time          TIMESTAMP,
  hts2te_used                   CHAR          NOT NULL,
  CONSTRAINT      hts2te_pk     PRIMARY KEY (hts2te_id),
  CONSTRAINT      hts2te_fk_ts  FOREIGN KEY (hts2te_trigger_signature_id) 
                                  REFERENCES hlt_trigger_signature(hts_id),
  CONSTRAINT      hts2te_fk_te  FOREIGN KEY (hts2te_trigger_element_id)
                                  REFERENCES hlt_trigger_element(hte_id)
  );

CREATE TABLE hlt_te_to_cp (
  hte2cp_id                 NUMBER(10)   NOT NULL,
  hte2cp_trigger_element_id NUMBER(10)   NOT NULL,
  hte2cp_component_id       NUMBER(10)   NOT NULL,
  hte2cp_algorithm_counter  NUMBER(10)   NOT NULL,
  hte2cp_username           VARCHAR2(30),
  hte2cp_modified_time      TIMESTAMP,
  hte2cp_used               CHAR         NOT NULL,
  CONSTRAINT  hte2cp_pk     PRIMARY KEY (hte2cp_id),
  CONSTRAINT  hte2cp_fk_te  FOREIGN KEY (hte2cp_trigger_element_id) 
                              REFERENCES hlt_trigger_element(hte_id),
  CONSTRAINT  hte2cp_fk_cp  FOREIGN KEY (hte2cp_component_id)
                              REFERENCES hlt_component(hcp_id)
  );

CREATE TABLE hlt_te_to_te (
  hte2te_id                  NUMBER(10)   NOT NULL,
  hte2te_te_id               NUMBER(10)   NOT NULL,
  hte2te_te_inp_id           VARCHAR2(30) NOT NULL,
  hte2te_te_inp_type         VARCHAR2(10) NOT NULL,
  hte2te_te_counter          NUMBER(3)    NOT NULL,
  hte2te_username            VARCHAR2(30),
  hte2te_modified_time       TIMESTAMP,
  hte2te_used                CHAR         NOT NULL,
  CONSTRAINT hte2te_pk       PRIMARY KEY (hte2te_id),
  CONSTRAINT hte2cte_fk_te   FOREIGN KEY (hte2te_te_id) 
                               REFERENCES hlt_trigger_element(hte_id)
  );

CREATE TABLE hlt_fd_to_st(
-- 	hfd2st_id		NUMBER(10)	NOT NULL,
-- 	hfd2st_force_dll_id	NUMBER(10)	NOT NULL,
-- 	hfd2st_setup_id		NUMBER(10)	NOT NULL,
-- 	CONSTRAINT		hfd2st_pk	PRIMARY KEY (hfd2st_id),
-- 	CONSTRAINT	 	hfd2st_fk_fd	FOREIGN KEY (hfd2st_force_dll_id) 
-- 						REFERENCES hlt_force_dll(hfd_id),
-- 	CONSTRAINT	 	hfd2st_fk_st	FOREIGN KEY (hfd2st_setup_id) 
-- 						REFERENCES hlt_setup(hst_id)
-- );

CREATE TABLE hlt_master_table (
  hmt_id               NUMBER(10) AUTO_INCREMENT NOT NULL,
  hmt_name             VARCHAR2(50) NOT NULL,
  hmt_version          NUMBER(11)   NOT NULL,
  hmt_prescale_set_id  NUMBER(10),
  hmt_trigger_menu_id  NUMBER(10),
  hmt_forced_setup_id  NUMBER(10),
  hmt_release_id       NUMBER(10),
  hmt_username         VARCHAR2(30),
  hmt_modified_time    TIMESTAMP,
  hmt_used             CHAR         NOT NULL,
  hmt_status           NUMBER(2)    NOT NULL,
  CONSTRAINT    hmt_pk       PRIMARY KEY (hmt_id),
  CONSTRAINT    hmt_fk_ps    FOREIGN KEY (hmt_prescale_set_id)
                               REFERENCES hlt_prescale_set(hps_id),
  CONSTRAINT    hmt_fk_tm    FOREIGN KEY (hmt_trigger_menu_id)
                               REFERENCES hlt_trigger_menu(htm_id),
--  CONSTRAINT    hmt_fk_fs    FOREIGN KEY (hmt_forced_setup_id)
--               REFERENCES hlt_setup(hst_id),
  CONSTRAINT    hmt_fk_re    FOREIGN KEY (hmt_release_id)
                               REFERENCES hlt_release(hre_id),
  CONSTRAINT    hmt_nmver    UNIQUE (hmt_name, hmt_version)
  );

CREATE TABLE super_master_table (
  smt_id                  NUMBER(10)   NOT NULL,
  smt_name                VARCHAR2(15) NOT NULL,
  smt_version             NUMBER(11)   NOT NULL,
  smt_l1_master_table_id  NUMBER(10)   NOT NULL,
  smt_hlt_master_table_id NUMBER(10)   NOT NULL,
  smt_username            VARCHAR2(30),
  smt_modified_time       TIMESTAMP,
  smt_used                CHAR         NOT NULL,
  smt_status              NUMBER(2)    NOT NULL,
  CONSTRAINT smt_pk       PRIMARY KEY (smt_id),
  CONSTRAINT smt_fk_l1mt  FOREIGN KEY (smt_l1_master_table_id)
                            REFERENCES l1_master_table(l1mt_id),
  CONSTRAINT smt_fk_hmt   FOREIGN KEY (smt_hlt_master_table_id)
                            REFERENCES hlt_master_table(hmt_id),
  CONSTRAINT smt_nmver    UNIQUE (smt_name, smt_version)
  );

CREATE TABLE trigger_next_run (
	tnr_id			NUMBER(10)	NOT NULL,
	tnr_super_master_table_id	NUMBER(10)	NOT NULL,
	tnr_username 		VARCHAR2(30)	,
	tnr_modified_time	TIMESTAMP	,
	tnr_used		CHAR		NOT NULL,
	CONSTRAINT		tnr_pk 		PRIMARY KEY (tnr_id),
	CONSTRAINT		tnr_fk_smt	FOREIGN KEY (tnr_super_master_table_id)
						REFERENCES super_master_table(smt_id)
	);

