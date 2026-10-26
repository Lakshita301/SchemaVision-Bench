-- Source: https://github.com/TimHughey/helen/blob/f987d71423648f3d2c402d01f8fd82406f685483/apps/helen/priv/repo/structure-test.sql?raw=true
-- Tables detected: 14 | FK/REFERENCES mentions: 14
CREATE TABLE public.pwm_alias (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    device_id bigint,
    description character varying(50) DEFAULT '<none>'::character varying,
    ttl_ms integer DEFAULT 60000 NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pio integer NOT NULL,
    cmd character varying(32) DEFAULT 'unknown'::character varying NOT NULL
);
CREATE TABLE public.pwm_cmd (
    id bigint NOT NULL,
    refid uuid,
    acked boolean DEFAULT false NOT NULL,
    orphaned boolean DEFAULT false NOT NULL,
    rt_latency_us integer DEFAULT 0 NOT NULL,
    sent_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    acked_at timestamp without time zone,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cmd character varying(32),
    alias_id bigint
);
CREATE TABLE public.pwm_device (
    id bigint NOT NULL,
    device character varying(255) NOT NULL,
    host character varying(255) NOT NULL,
    dev_latency_us integer DEFAULT 0,
    last_seen_at timestamp without time zone,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pio_count integer NOT NULL
);
CREATE TABLE public.remote (
    id bigint NOT NULL,
    host character varying(20) NOT NULL,
    name character varying(35) NOT NULL,
    firmware_vsn character varying(32) DEFAULT '0000000'::character varying NOT NULL,
    last_start_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    last_seen_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reset_reason character varying(25) DEFAULT 'unknown'::character varying,
    ap_rssi integer DEFAULT 0,
    ap_pri_chan integer DEFAULT 0,
    heap_free integer DEFAULT 0,
    heap_min integer DEFAULT 0,
    uptime_us bigint DEFAULT 0,
    idf_vsn character varying(32),
    app_elf_sha256 character varying(255),
    build_date character varying(16),
    build_time character varying(16),
    bssid character varying(255) DEFAULT 'xx:xx:xx:xx:xx:xx'::character varying,
    profile character varying(255) DEFAULT 'default'::character varying NOT NULL,
    firmware_etag character varying(24) DEFAULT '<none>'::character varying NOT NULL
);
CREATE TABLE public.remote_profile (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    version uuid NOT NULL,
    dalsemi_enable boolean DEFAULT true NOT NULL,
    dalsemi_core_stack integer DEFAULT 1536 NOT NULL,
    dalsemi_core_priority integer DEFAULT 1 NOT NULL,
    dalsemi_report_stack integer DEFAULT 3072 NOT NULL,
    dalsemi_report_priority integer DEFAULT 13 NOT NULL,
    dalsemi_command_stack integer DEFAULT 3072 NOT NULL,
    dalsemi_command_priority integer DEFAULT 14 NOT NULL,
    dalsemi_core_interval_ms integer DEFAULT 30000 NOT NULL,
    dalsemi_report_interval_ms integer DEFAULT 7000 NOT NULL,
    i2c_enable boolean DEFAULT true NOT NULL,
    i2c_use_multiplexer boolean DEFAULT false NOT NULL,
    i2c_core_stack integer DEFAULT 1536 NOT NULL,
    i2c_core_priority integer DEFAULT 1 NOT NULL,
    i2c_report_stack integer DEFAULT 3072 NOT NULL,
    i2c_report_priority integer DEFAULT 13 NOT NULL,
    i2c_command_stack integer DEFAULT 3072 NOT NULL,
    i2c_command_priority integer DEFAULT 14 NOT NULL,
    i2c_core_interval_ms integer DEFAULT 7000 NOT NULL,
    i2c_report_interval_ms integer DEFAULT 7000 NOT NULL,
    pwm_enable boolean DEFAULT true NOT NULL,
    pwm_core_stack integer DEFAULT 1536 NOT NULL,
    pwm_core_priority integer DEFAULT 1 NOT NULL,
    pwm_report_stack integer DEFAULT 2048 NOT NULL,
    pwm_report_priority integer DEFAULT 12 NOT NULL,
    pwm_report_interval_ms integer DEFAULT 7000 NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying(255) DEFAULT ' '::character varying,
    watch_stacks boolean DEFAULT false NOT NULL,
    core_loop_interval_ms integer DEFAULT 1000 NOT NULL,
    core_timestamp_ms integer DEFAULT 360000 NOT NULL,
    lightdesk_enable boolean DEFAULT false
);
CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);
CREATE TABLE public.sensor_alias (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    device_id bigint,
    description character varying(50) DEFAULT '<none>'::character varying,
    ttl_ms integer DEFAULT 60000 NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
CREATE TABLE public.sensor_datapoint (
    id bigint NOT NULL,
    temp_c DOUBLE PRECISION precision,
    relhum DOUBLE PRECISION precision,
    alias_id bigint,
    reading_at timestamp without time zone NOT NULL
);
CREATE TABLE public.sensor_device (
    id bigint NOT NULL,
    device character varying(255) NOT NULL,
    host character varying(255) NOT NULL,
    dev_latency_us integer DEFAULT 0 NOT NULL,
    last_seen_at timestamp without time zone,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
CREATE TABLE public.switch_alias (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    device_id bigint,
    description character varying(50),
    pio integer NOT NULL,
    ttl_ms integer DEFAULT 60000,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cmd character varying(255) DEFAULT 'unknown'::character varying NOT NULL
);
CREATE TABLE public.switch_cmd (
    id bigint NOT NULL,
    refid uuid NOT NULL,
    acked boolean DEFAULT false NOT NULL,
    orphan boolean DEFAULT false NOT NULL,
    rt_latency_us integer DEFAULT 0 NOT NULL,
    sent_at timestamp without time zone NOT NULL,
    ack_at timestamp without time zone,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    alias_id bigint,
    cmd character varying(32)
);
CREATE TABLE public.switch_device (
    id bigint NOT NULL,
    device character varying(255) NOT NULL,
    host character varying(255) NOT NULL,
    dev_latency_us integer DEFAULT 0 NOT NULL,
    last_seen_at timestamp without time zone NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pio_count integer DEFAULT 8 NOT NULL
);
CREATE TABLE public.worker_config (
    id bigint NOT NULL,
    module character varying(60) NOT NULL,
    comment text DEFAULT '<none>'::text,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
CREATE TABLE public.worker_config_line (
    id bigint NOT NULL,
    num integer NOT NULL,
    line text DEFAULT ' '::text NOT NULL,
    worker_config_id bigint
);
ALTER TABLE public.pwm_alias ADD CONSTRAINT pwm_alias_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.pwm_device(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.pwm_cmd ADD CONSTRAINT pwm_cmd_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES public.pwm_alias(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.sensor_alias ADD CONSTRAINT sensor_alias_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.sensor_device(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.sensor_datapoint ADD CONSTRAINT sensor_datapoint_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES public.sensor_alias(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.switch_alias ADD CONSTRAINT switch_alias_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.switch_device(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.switch_cmd ADD CONSTRAINT switch_cmd_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES public.switch_alias(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE public.worker_config_line ADD CONSTRAINT worker_config_line_worker_config_id_fkey FOREIGN KEY (worker_config_id) REFERENCES public.worker_config(id) ON UPDATE CASCADE ON DELETE CASCADE;
