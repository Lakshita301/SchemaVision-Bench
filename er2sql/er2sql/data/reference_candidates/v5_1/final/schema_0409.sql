-- Source: https://github.com/GMSteuart/chainlink-iris/blob/7d323c76ff61846d304942a08a1936f8fea40207/data/db/backup.sql?raw=true
-- Tables detected: 28 | FK/REFERENCES mentions: 38
CREATE TABLE bridge_types (
    name text NOT NULL,
    url text NOT NULL,
    confirmations bigint DEFAULT 0 NOT NULL,
    incoming_token_hash text NOT NULL,
    salt text NOT NULL,
    outgoing_token text NOT NULL,
    minimum_contract_payment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE configurations (
    id bigint NOT NULL,
    name text NOT NULL,
    value text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone
);
CREATE TABLE encrypted_secret_keys (
    public_key character varying(68) NOT NULL,
    vrf_key text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE encumbrances (
    id bigint NOT NULL,
    payment numeric(78,0),
    expiration bigint,
    end_at timestamp with time zone,
    oracles text,
    aggregator bytea NOT NULL,
    agg_initiate_job_selector bytea NOT NULL,
    agg_fulfill_selector bytea NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE eth_receipts (
    id bigint NOT NULL,
    tx_hash bytea NOT NULL,
    block_hash bytea NOT NULL,
    block_number bigint NOT NULL,
    transaction_index bigint NOT NULL,
    receipt jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT chk_hash_length CHECK (((octet_length(tx_hash) = 32) AND (octet_length(block_hash) = 32)))
);
CREATE TABLE eth_task_run_txes (
    task_run_id uuid NOT NULL,
    eth_tx_id bigint NOT NULL
);
CREATE TABLE eth_tx_attempts (
    id bigint NOT NULL,
    eth_tx_id bigint NOT NULL,
    gas_price numeric(78,0) NOT NULL,
    signed_raw_tx bytea NOT NULL,
    hash bytea NOT NULL,
    broadcast_before_block_num bigint,
    state public.eth_tx_attempts_state NOT NULL,
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT chk_cannot_broadcast_before_block_zero CHECK (((broadcast_before_block_num IS NULL) OR (broadcast_before_block_num > 0))),
    CONSTRAINT chk_eth_tx_attempts_fsm CHECK ((((state = 'in_progress'::public.eth_tx_attempts_state) AND (broadcast_before_block_num IS NULL)) OR (state = 'broadcast'::public.eth_tx_attempts_state))),
    CONSTRAINT chk_hash_length CHECK ((octet_length(hash) = 32)),
    CONSTRAINT chk_signed_raw_tx_present CHECK ((octet_length(signed_raw_tx) > 0))
);
CREATE TABLE eth_txes (
    id bigint NOT NULL,
    nonce bigint,
    from_address bytea NOT NULL,
    to_address bytea NOT NULL,
    encoded_payload bytea NOT NULL,
    value numeric(78,0) NOT NULL,
    gas_limit bigint NOT NULL,
    error text,
    broadcast_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    state public.eth_txes_state DEFAULT 'unstarted'::public.eth_txes_state NOT NULL,
    CONSTRAINT chk_broadcast_at_is_sane CHECK ((broadcast_at > '2019-01-01 00:00:00+00'::timestamp with time zone)),
    CONSTRAINT chk_error_cannot_be_empty CHECK (((error IS NULL) OR (length(error) > 0))),
    CONSTRAINT chk_eth_txes_fsm CHECK ((((state = 'unstarted'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'in_progress'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NULL))) OR ((state = 'fatal_error'::public.eth_txes_state) AND ((nonce IS NULL) AND (error IS NOT NULL) AND (broadcast_at IS NULL))) OR ((state = 'unconfirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))) OR ((state = 'confirmed'::public.eth_txes_state) AND ((nonce IS NOT NULL) AND (error IS NULL) AND (broadcast_at IS NOT NULL))))),
    CONSTRAINT chk_from_address_length CHECK ((octet_length(from_address) = 20)),
    CONSTRAINT chk_to_address_length CHECK ((octet_length(to_address) = 20))
);
CREATE TABLE external_initiators (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    name text NOT NULL,
    url text,
    access_key text NOT NULL,
    salt text NOT NULL,
    hashed_secret text NOT NULL,
    outgoing_secret text NOT NULL,
    outgoing_token text NOT NULL
);
CREATE TABLE flux_monitor_round_stats (
    id bigint NOT NULL,
    aggregator bytea NOT NULL,
    round_id integer NOT NULL,
    num_new_round_logs integer DEFAULT 0 NOT NULL,
    num_submissions integer DEFAULT 0 NOT NULL
);
CREATE TABLE heads (
    id bigint NOT NULL,
    hash bytea NOT NULL,
    number bigint NOT NULL,
    parent_hash bytea NOT NULL,
    created_at timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT chk_hash_size CHECK ((octet_length(hash) = 32)),
    CONSTRAINT chk_parent_hash_size CHECK ((octet_length(parent_hash) = 32))
);
CREATE TABLE initiators (
    id bigint NOT NULL,
    job_spec_id uuid NOT NULL,
    type text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    schedule text,
    "time" timestamp with time zone,
    ran boolean,
    address bytea,
    requesters text,
    name character varying(255),
    params jsonb,
    from_block numeric(78,0),
    to_block numeric(78,0),
    topics jsonb,
    request_data text,
    feeds text,
    threshold DOUBLE PRECISION,
    "precision" smallint,
    polling_interval bigint,
    absolute_threshold DOUBLE PRECISION,
    updated_at timestamp with time zone NOT NULL,
    poll_timer jsonb,
    idle_timer jsonb
);
CREATE TABLE job_runs (
    result_id bigint,
    run_request_id bigint,
    status public.run_status DEFAULT 'unstarted'::public.run_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    finished_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL,
    initiator_id bigint NOT NULL,
    deleted_at timestamp with time zone,
    creation_height numeric(78,0),
    observed_height numeric(78,0),
    payment numeric(78,0),
    job_spec_id uuid NOT NULL,
    id uuid NOT NULL
);
CREATE TABLE job_spec_errors (
    id bigint NOT NULL,
    job_spec_id uuid NOT NULL,
    description text NOT NULL,
    occurrences integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE job_specs (
    created_at timestamp with time zone NOT NULL,
    start_at timestamp with time zone,
    end_at timestamp with time zone,
    deleted_at timestamp with time zone,
    min_payment character varying(255),
    id uuid NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE keys (
    address bytea NOT NULL,
    json jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    next_nonce bigint,
    id integer NOT NULL,
    last_used timestamp with time zone,
    CONSTRAINT chk_address_length CHECK ((octet_length(address) = 20))
);
CREATE TABLE log_consumptions (
    id bigint NOT NULL,
    block_hash bytea NOT NULL,
    log_index bigint NOT NULL,
    job_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL
);
CREATE TABLE migrations (
    id character varying(255) NOT NULL
);
CREATE TABLE run_requests (
    id bigint NOT NULL,
    request_id bytea,
    tx_hash bytea,
    requester bytea,
    created_at timestamp with time zone NOT NULL,
    block_hash bytea,
    payment numeric(78,0),
    request_params jsonb DEFAULT '{}'::jsonb NOT NULL
);
CREATE TABLE run_results (
    id bigint NOT NULL,
    data jsonb,
    error_message text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE service_agreements (
    id text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    encumbrance_id bigint,
    request_body text,
    signature character varying(255),
    job_spec_id uuid,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE sessions (
    id text NOT NULL,
    last_used timestamp with time zone,
    created_at timestamp with time zone NOT NULL
);
CREATE TABLE sync_events (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    body text NOT NULL
);
CREATE TABLE task_runs (
    result_id bigint,
    status public.run_status DEFAULT 'unstarted'::public.run_status NOT NULL,
    task_spec_id bigint NOT NULL,
    minimum_confirmations bigint,
    created_at timestamp with time zone NOT NULL,
    confirmations bigint,
    job_run_id uuid NOT NULL,
    id uuid NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE task_specs (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    type text NOT NULL,
    confirmations bigint,
    params jsonb,
    job_spec_id uuid NOT NULL
);
CREATE TABLE tx_attempts (
    id bigint NOT NULL,
    tx_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    hash bytea NOT NULL,
    gas_price numeric(78,0) NOT NULL,
    confirmed boolean NOT NULL,
    sent_at bigint NOT NULL,
    signed_raw_tx bytea NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE txes (
    id bigint NOT NULL,
    surrogate_id text,
    "from" bytea NOT NULL,
    "to" bytea NOT NULL,
    data bytea NOT NULL,
    nonce bigint NOT NULL,
    value numeric(78,0) NOT NULL,
    gas_limit bigint NOT NULL,
    hash bytea NOT NULL,
    gas_price numeric(78,0) NOT NULL,
    confirmed boolean NOT NULL,
    sent_at bigint NOT NULL,
    signed_raw_tx bytea NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
CREATE TABLE users (
    email text NOT NULL,
    hashed_password text,
    created_at timestamp with time zone NOT NULL,
    token_key text,
    token_salt text,
    token_hashed_secret text,
    updated_at timestamp with time zone NOT NULL,
    token_secret text
);
ALTER TABLE eth_receipts ADD CONSTRAINT eth_receipts_tx_hash_fkey FOREIGN KEY (tx_hash) REFERENCES eth_tx_attempts(hash) ON DELETE CASCADE;
ALTER TABLE eth_task_run_txes ADD CONSTRAINT eth_task_run_txes_eth_tx_id_fkey FOREIGN KEY (eth_tx_id) REFERENCES eth_txes(id) ON DELETE CASCADE;
ALTER TABLE eth_task_run_txes ADD CONSTRAINT eth_task_run_txes_task_run_id_fkey FOREIGN KEY (task_run_id) REFERENCES task_runs(id) ON DELETE CASCADE;
ALTER TABLE eth_tx_attempts ADD CONSTRAINT eth_tx_attempts_eth_tx_id_fkey FOREIGN KEY (eth_tx_id) REFERENCES eth_txes(id) ON DELETE CASCADE;
ALTER TABLE eth_txes ADD CONSTRAINT eth_txes_from_address_fkey FOREIGN KEY (from_address) REFERENCES keys(address);
ALTER TABLE initiators ADD CONSTRAINT fk_initiators_job_spec_id FOREIGN KEY (job_spec_id) REFERENCES job_specs(id) ON DELETE RESTRICT;
ALTER TABLE job_runs ADD CONSTRAINT fk_job_runs_initiator_id FOREIGN KEY (initiator_id) REFERENCES initiators(id) ON DELETE CASCADE;
ALTER TABLE job_runs ADD CONSTRAINT fk_job_runs_result_id FOREIGN KEY (result_id) REFERENCES run_results(id) ON DELETE CASCADE;
ALTER TABLE job_runs ADD CONSTRAINT fk_job_runs_run_request_id FOREIGN KEY (run_request_id) REFERENCES run_requests(id) ON DELETE CASCADE;
ALTER TABLE job_runs ADD CONSTRAINT job_runs_job_spec_id_fkey FOREIGN KEY (job_spec_id) REFERENCES job_specs(id) ON DELETE CASCADE;
ALTER TABLE job_spec_errors ADD CONSTRAINT job_spec_errors_job_spec_id_fkey FOREIGN KEY (job_spec_id) REFERENCES job_specs(id) ON DELETE CASCADE;
ALTER TABLE log_consumptions ADD CONSTRAINT log_consumptions_job_id_fkey FOREIGN KEY (job_id) REFERENCES job_specs(id) ON DELETE CASCADE;
ALTER TABLE service_agreements ADD CONSTRAINT fk_service_agreements_encumbrance_id FOREIGN KEY (encumbrance_id) REFERENCES encumbrances(id) ON DELETE RESTRICT;
ALTER TABLE service_agreements ADD CONSTRAINT service_agreements_job_spec_id_fkey FOREIGN KEY (job_spec_id) REFERENCES job_specs(id) ON DELETE CASCADE;
ALTER TABLE task_runs ADD CONSTRAINT fk_task_runs_result_id FOREIGN KEY (result_id) REFERENCES run_results(id) ON DELETE CASCADE;
ALTER TABLE task_runs ADD CONSTRAINT fk_task_runs_task_spec_id FOREIGN KEY (task_spec_id) REFERENCES task_specs(id) ON DELETE CASCADE;
ALTER TABLE task_runs ADD CONSTRAINT task_runs_job_run_id_fkey FOREIGN KEY (job_run_id) REFERENCES job_runs(id) ON DELETE CASCADE;
ALTER TABLE task_specs ADD CONSTRAINT task_specs_job_spec_id_fkey FOREIGN KEY (job_spec_id) REFERENCES job_specs(id) ON DELETE CASCADE;
ALTER TABLE tx_attempts ADD CONSTRAINT tx_attempts_tx_id_fkey FOREIGN KEY (tx_id) REFERENCES txes(id) ON DELETE CASCADE;
