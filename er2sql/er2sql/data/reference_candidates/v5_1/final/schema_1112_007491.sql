-- Source: https://github.com/algone-io/l1-chain/blob/66138a40f6fe889def0d0c07a400a8332ab20fb1/l1-core/byteball-sqlite.sql?raw=true
-- Tables detected: 63 | FK constraints: 57
-- sha256 in base64
-- when it first appears
-- latest MC ball that is included in this ball (excluding itself)
-- sha256 in base64
-- sha256 in base64
--  count_witnesses TINYINT NOT NULL DEFAULT 0,
-- only for MC units with MCI divisible by 10: previous MC units divisible by 10
-- only with 1st ball from this address, and with next ball after definition change
-- percentage
-- might not be defined in definitions yet (almost always, it is not defined)
--    type ENUM('string', 'number') NOT NULL,
--	name VARCHAR(44) NOT NULL,
-- must subsequently publish and update the list of trusted attestors
-- in the initial attestor list: same as unit 
-- transfer
-- transfer
-- transfer
-- witnessing/hc
-- witnessing/hc
-- issue
-- issue
-- UNIQUE guarantees there'll be no double spend for type=transfer
-- UNIQUE guarantees there'll be no double spend for type=hc/witnessing
-- UNIQUE guarantees there'll be no double issue
-- NULL if hidden by output_hash
-- NULL if not stable yet
-- child unit that receives (and optionally redistributes) commission from parent units
-- address of the commission receiver: author of child unit or address named in earned_headers_commission_recipients
-- address of the commission receiver
-- witness address
--    witnessed_in_ball CHAR(44) NOT NULL, -- if expired, MC ball next after expiry. Or NULL?
-- NULL if expired
--    is_retrievable TINYINT NOT NULL,
-- in increasing level order
-- in increasing level order
-- domain or IP
-- wss:// address
-- domain or IP
-- domain or IP
-- domain or IP
-- IP
-- when all members notified me that they saw the wallet fully approved
-- the device this message is addressed to
-- domain name of the hub this address is subscribed to
-- no FK because xpubkey may arrive earlier than the wallet is approved by the user and written to the db
-- base58 encoded, see bip32, NULL while pending
-- when this member notified us that he has collected all member xpubkeys
-- own address is not present in correspondents
--    FOREIGN KEY byDeviceAddress(device_address) REFERENCES correspondent_devices(device_address)
-- no FK because xpubkey may arrive earlier than the wallet is approved by the user and written to the db
-- NULL if xpubkey arrived earlier than the wallet was approved by the user
-- own address is not present in correspondents
--    FOREIGN KEY byDeviceAddress(device_address) REFERENCES correspondent_devices(device_address)
-- path from root to member address
-- member address
-- json
-- own address is not present in correspondents
--    FOREIGN KEY byDeviceAddress(device_address) REFERENCES correspondent_devices(device_address),
-- full path to signing key which is a member of the member address
-- member address
-- path to signing key from root of the member address
-- where this signing key lives or is reachable through
-- own address is not present in correspondents
--    FOREIGN KEY byDeviceAddress(device_address) REFERENCES correspondent_devices(device_address)
-- the device this message is addressed to, no FK because of pairing case
-- filled only on the hub
-- added only if the same name is registered by different registries for different assets, equal to registry name
--	FOREIGN KEY (registry_address) REFERENCES addresses(address) -- addresses is not always filled on light
CREATE TABLE units (
    unit CHAR(44) NOT NULL PRIMARY KEY,
    creation_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    version VARCHAR(3) NOT NULL DEFAULT '1.0',
    alt VARCHAR(3) NOT NULL DEFAULT '1',
    witness_list_unit CHAR(44) NULL,
    last_ball_unit CHAR(44) NULL,
    content_hash CHAR(44) NULL,
    headers_commission INT NOT NULL,
    payload_commission INT NOT NULL,
    is_free SMALLINT NOT NULL DEFAULT 1,
    is_on_main_chain SMALLINT NOT NULL DEFAULT 0,
    main_chain_index INT NULL,
    latest_included_mc_index INT NULL,
    level INT NULL,
    witnessed_level INT NULL,
    is_stable SMALLINT NOT NULL DEFAULT 0,
    sequence TEXT CHECK (sequence IN('good','temp-bad','final-bad')) NOT NULL DEFAULT 'good',
    best_parent_unit CHAR(44) NULL,
    CONSTRAINT unitsByLastBallUnit FOREIGN KEY (last_ball_unit) REFERENCES units(unit),
    FOREIGN KEY (best_parent_unit) REFERENCES units(unit),
    CONSTRAINT unitsByWitnessListUnit FOREIGN KEY (witness_list_unit) REFERENCES units(unit)
);

CREATE TABLE balls (
    ball CHAR(44) NOT NULL PRIMARY KEY,
    creation_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    unit CHAR(44) NOT NULL UNIQUE,
    count_paid_witnesses SMALLINT NULL,
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE skiplist_units (
    unit CHAR(44) NOT NULL,
    skiplist_unit CHAR(44) NOT NULL,
    PRIMARY KEY (unit, skiplist_unit),
    FOREIGN KEY (unit) REFERENCES units(unit),
    FOREIGN KEY (skiplist_unit) REFERENCES units(unit)
);

CREATE TABLE parenthoods (
    child_unit CHAR(44) NOT NULL,
    parent_unit CHAR(44) NOT NULL,
    PRIMARY KEY (parent_unit, child_unit),
    CONSTRAINT parenthoodsByChild FOREIGN KEY (child_unit) REFERENCES units(unit),
    CONSTRAINT parenthoodsByParent FOREIGN KEY (parent_unit) REFERENCES units(unit)
);

CREATE TABLE definitions (
    definition_chash CHAR(32) NOT NULL PRIMARY KEY,
    definition TEXT NOT NULL,
    has_references SMALLINT NOT NULL
);

CREATE TABLE addresses (
    address CHAR(32) NOT NULL PRIMARY KEY,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE unit_authors (
    unit CHAR(44) NOT NULL,
    address CHAR(32) NOT NULL,
    definition_chash CHAR(32) NULL,
    _mci INT NULL,
    PRIMARY KEY (unit, address),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT unitAuthorsByAddress FOREIGN KEY (address) REFERENCES addresses(address),
    FOREIGN KEY (definition_chash) REFERENCES definitions(definition_chash)
);

CREATE TABLE authentifiers (
    unit CHAR(44) NOT NULL,
    address CHAR(32) NOT NULL,
    path VARCHAR(40) NOT NULL,
    authentifier VARCHAR(4096) NOT NULL,
    PRIMARY KEY (unit, address, path),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT authentifiersByAddress FOREIGN KEY (address) REFERENCES addresses(address)
);

CREATE TABLE unit_witnesses (
    unit CHAR(44) NOT NULL,
    address VARCHAR(32) NOT NULL,
    PRIMARY KEY (unit, address),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE witness_list_hashes (
    witness_list_unit CHAR(44) NOT NULL PRIMARY KEY,
    witness_list_hash CHAR(44) NOT NULL UNIQUE,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (witness_list_unit) REFERENCES units(unit)
);

CREATE TABLE earned_headers_commission_recipients (
    unit CHAR(44) NOT NULL,
    address VARCHAR(32) NOT NULL,
    earned_headers_commission_share INT NOT NULL,
    PRIMARY KEY (unit, address),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE messages (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    app VARCHAR(30) NOT NULL,
    payload_location TEXT CHECK (payload_location IN ('inline','uri','none')) NOT NULL,
    payload_hash VARCHAR(44) NOT NULL,
    payload TEXT NULL,
    payload_uri_hash VARCHAR(44) NULL,
    payload_uri VARCHAR(500) NULL,
    PRIMARY KEY (unit, message_index),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE spend_proofs (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    spend_proof_index SMALLINT NOT NULL,
    spend_proof CHAR(44) NOT NULL,
    address CHAR(32) NOT NULL,
    PRIMARY KEY (unit, message_index, spend_proof_index),
    UNIQUE (spend_proof, unit),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT spendProofsByAddress FOREIGN KEY (address) REFERENCES addresses(address)
);

CREATE TABLE address_definition_changes (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    address CHAR(32) NOT NULL,
    definition_chash VARCHAR(32) NOT NULL,
    PRIMARY KEY (unit, message_index),
    UNIQUE (address, unit),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT addressDefinitionChangesByAddress FOREIGN KEY (address) REFERENCES addresses(address)
);

CREATE TABLE data_feeds (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    feed_name VARCHAR(64) NOT NULL,
    value VARCHAR(64) NULL,
    int_value BIGINT NULL,
    PRIMARY KEY (unit, feed_name),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE polls (
    unit CHAR(44) NOT NULL PRIMARY KEY,
    message_index SMALLINT NOT NULL,
    question VARCHAR(4096) NOT NULL,
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE poll_choices (
    unit CHAR(44) NOT NULL,
    choice_index SMALLINT NOT NULL,
    choice VARCHAR(32) NOT NULL,
    PRIMARY KEY (unit, choice_index),
    UNIQUE (unit, choice),
    FOREIGN KEY (unit) REFERENCES polls(unit)
);

CREATE TABLE votes (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    poll_unit CHAR(44) NOT NULL,
    choice VARCHAR(32) NOT NULL,
    PRIMARY KEY (unit, message_index),
    UNIQUE (unit, choice),
    CONSTRAINT votesByChoice FOREIGN KEY (poll_unit, choice) REFERENCES poll_choices(unit, choice),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE attestations (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    attestor_address VARCHAR(32) NOT NULL,
    address VARCHAR(32) NOT NULL,
    PRIMARY KEY (unit, message_index),
    CONSTRAINT attestationsByAttestorAddress FOREIGN KEY (attestor_address) REFERENCES addresses(address),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE assets (
    unit CHAR(44) NOT NULL PRIMARY KEY,
    message_index SMALLINT NOT NULL,
    cap BIGINT NULL,
    is_private SMALLINT NOT NULL,
    is_transferrable SMALLINT NOT NULL,
    auto_destroy SMALLINT NOT NULL,
    fixed_denominations SMALLINT NOT NULL,
    issued_by_definer_only SMALLINT NOT NULL,
    cosigned_by_definer SMALLINT NOT NULL,
    spender_attested SMALLINT NOT NULL,
    issue_condition TEXT NULL,
    transfer_condition TEXT NULL,
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE asset_denominations (
    asset CHAR(44) NOT NULL,
    denomination INT NOT NULL,
    count_coins BIGINT NULL,
    max_issued_serial_number BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (asset, denomination),
    FOREIGN KEY (asset) REFERENCES assets(unit)
);

CREATE TABLE asset_attestors (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    asset CHAR(44) NOT NULL,
    attestor_address CHAR(32) NOT NULL,
    PRIMARY KEY (unit, message_index),
    UNIQUE (asset, attestor_address, unit),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT assetAttestorsByAsset FOREIGN KEY (asset) REFERENCES assets(unit)
);

CREATE TABLE inputs (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    input_index SMALLINT NOT NULL,
    asset CHAR(44) NULL,
    denomination INT NOT NULL DEFAULT 1,
    is_unique SMALLINT NULL DEFAULT 1,
    type TEXT CHECK (type IN('transfer','headers_commission','witnessing','issue')) NOT NULL,
    src_unit CHAR(44) NULL,
    src_message_index SMALLINT NULL,
    src_output_index SMALLINT NULL,
    from_main_chain_index INT NULL,
    to_main_chain_index INT NULL,
    serial_number BIGINT NULL,
    amount BIGINT NULL,
    address CHAR(32) NOT NULL,
    PRIMARY KEY (unit, message_index, input_index),
    UNIQUE (src_unit, src_message_index, src_output_index, is_unique),
    UNIQUE (type, from_main_chain_index, address, is_unique),
    UNIQUE (asset, denomination, serial_number, address, is_unique),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT inputsBySrcUnit FOREIGN KEY (src_unit) REFERENCES units(unit),
    CONSTRAINT inputsByAddress FOREIGN KEY (address) REFERENCES addresses(address),
    CONSTRAINT inputsByAsset FOREIGN KEY (asset) REFERENCES assets(unit)
);

CREATE TABLE outputs (
    output_id INTEGER NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    output_index SMALLINT NOT NULL,
    asset CHAR(44) NULL,
    denomination INT NOT NULL DEFAULT 1,
    address VARCHAR(32) NULL,
    amount BIGINT NOT NULL,
    blinding CHAR(16) NULL,
    output_hash CHAR(44) NULL,
    is_serial SMALLINT NULL,
    is_spent SMALLINT NOT NULL DEFAULT 0,
    UNIQUE (unit, message_index, output_index),
    FOREIGN KEY (unit) REFERENCES units(unit),
    CONSTRAINT outputsByAsset FOREIGN KEY (asset) REFERENCES assets(unit)
);

CREATE TABLE headers_commission_contributions (
    unit CHAR(44) NOT NULL,
    address CHAR(32) NOT NULL,
    amount BIGINT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (unit, address),
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE headers_commission_outputs (
    main_chain_index INT NOT NULL,
    address CHAR(32) NOT NULL,
    amount BIGINT NOT NULL,
    is_spent SMALLINT NOT NULL DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (main_chain_index, address)
);

CREATE TABLE paid_witness_events (
    unit CHAR(44) NOT NULL,
    address CHAR(32) NOT NULL,
    delay SMALLINT NULL,
    PRIMARY KEY (unit, address),
    FOREIGN KEY (unit) REFERENCES units(unit),
    FOREIGN KEY (address) REFERENCES addresses(address)
);

CREATE TABLE witnessing_outputs (
    main_chain_index INT NOT NULL,
    address CHAR(32) NOT NULL,
    amount BIGINT NOT NULL,
    is_spent SMALLINT NOT NULL DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (main_chain_index, address),
    FOREIGN KEY (address) REFERENCES addresses(address)
);

CREATE TABLE dependencies (
    unit CHAR(44) NOT NULL,
    depends_on_unit CHAR(44) NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (depends_on_unit, unit)
);

CREATE TABLE unhandled_joints (
    unit CHAR(44) NOT NULL PRIMARY KEY,
    peer VARCHAR(100) NOT NULL,
    json TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE archived_joints (
    unit CHAR(44) NOT NULL PRIMARY KEY,
    reason TEXT CHECK (reason IN('uncovered', 'voided')) NOT NULL,
    json TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE known_bad_joints (
    joint CHAR(44) NULL UNIQUE,
    unit CHAR(44) NULL UNIQUE,
    json TEXT NOT NULL,
    error TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE joints (
    unit CHAR(44) NOT NULL PRIMARY KEY,
    json TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE unhandled_private_payments (
    unit CHAR(44) NOT NULL,
    message_index SMALLINT NOT NULL,
    output_index SMALLINT NOT NULL,
    json TEXT NOT NULL,
    peer VARCHAR(100) NOT NULL,
    linked SMALLINT NOT NULL DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (unit, message_index, output_index)
);

CREATE TABLE hash_tree_balls (
    ball_index INTEGER NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    ball CHAR(44) NOT NULL UNIQUE,
    unit CHAR(44) NOT NULL UNIQUE
);

CREATE TABLE catchup_chain_balls (
    member_index INTEGER NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    ball CHAR(44) NOT NULL UNIQUE
);

CREATE TABLE peer_hosts (
    peer_host VARCHAR(100) NOT NULL PRIMARY KEY,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    count_new_good_joints INT NOT NULL DEFAULT 0,
    count_invalid_joints INT NOT NULL DEFAULT 0,
    count_nonserial_joints INT NOT NULL DEFAULT 0
);

CREATE TABLE peers (
    peer VARCHAR(100) NOT NULL PRIMARY KEY,
    peer_host VARCHAR(100) NOT NULL,
    learnt_from_peer_host VARCHAR(100) NULL,
    is_self SMALLINT NOT NULL DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (learnt_from_peer_host) REFERENCES peer_hosts(peer_host),
    FOREIGN KEY (peer_host) REFERENCES peer_hosts(peer_host)
);

CREATE TABLE peer_events (
    peer_host VARCHAR(100) NOT NULL,
    event_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    event TEXT CHECK (event IN('new_good', 'invalid', 'nonserial', 'known_good', 'known_bad')) NOT NULL,
    FOREIGN KEY (peer_host) REFERENCES peer_hosts(peer_host)
);

CREATE TABLE peer_host_urls (
    peer_host VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_active SMALLINT NULL DEFAULT 1,
    revocation_date TIMESTAMP NULL,
    UNIQUE (peer_host, is_active),
    FOREIGN KEY (peer_host) REFERENCES peer_hosts(peer_host)
);

CREATE TABLE wallets (
    wallet CHAR(44) NOT NULL PRIMARY KEY,
    account INT NOT NULL,
    definition_template TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_approval_date TIMESTAMP NULL,
    ready_date TIMESTAMP NULL
);

CREATE TABLE my_addresses (
    address CHAR(32) NOT NULL PRIMARY KEY,
    wallet CHAR(44) NOT NULL,
    is_change SMALLINT NOT NULL,
    address_index INT NOT NULL,
    definition TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (wallet, is_change, address_index),
    FOREIGN KEY (wallet) REFERENCES wallets(wallet)
);

CREATE TABLE my_witnesses (
    address VARCHAR(32) NOT NULL PRIMARY KEY
);

CREATE TABLE devices (
    device_address CHAR(33) NOT NULL PRIMARY KEY,
    pubkey CHAR(44) NOT NULL,
    temp_pubkey_package TEXT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE device_messages (
    message_hash CHAR(44) NOT NULL PRIMARY KEY,
    device_address CHAR(33) NOT NULL,
    message TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (device_address) REFERENCES devices(device_address)
);

CREATE TABLE correspondent_devices (
    device_address CHAR(33) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    pubkey CHAR(44) NOT NULL,
    hub VARCHAR(100) NOT NULL,
    is_confirmed SMALLINT NOT NULL DEFAULT 0,
    is_indirect SMALLINT NOT NULL DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pairing_secrets (
    pairing_secret VARCHAR(40) NOT NULL PRIMARY KEY,
    is_permanent SMALLINT NOT NULL DEFAULT 0,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expiry_date TIMESTAMP NOT NULL
);

CREATE TABLE extended_pubkeys (
    wallet CHAR(44) NOT NULL,
    extended_pubkey CHAR(112) NULL,
    device_address CHAR(33) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approval_date TIMESTAMP NULL,
    member_ready_date TIMESTAMP NULL,
    PRIMARY KEY (wallet, device_address)
);

CREATE TABLE wallet_signing_paths (
    wallet CHAR(44) NOT NULL,
    signing_path VARCHAR(255) NULL,
    device_address CHAR(33) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (wallet, signing_path),
    FOREIGN KEY (wallet) REFERENCES wallets(wallet)
);

CREATE TABLE shared_addresses (
    shared_address CHAR(32) NOT NULL PRIMARY KEY,
    definition TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pending_shared_addresses (
    definition_template_chash CHAR(32) NOT NULL PRIMARY KEY,
    definition_template TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pending_shared_address_signing_paths (
    definition_template_chash CHAR(32) NOT NULL,
    device_address CHAR(33) NOT NULL,
    signing_path TEXT NOT NULL,
    address CHAR(32) NULL,
    device_addresses_by_relative_signing_paths TEXT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approval_date TIMESTAMP NULL,
    PRIMARY KEY (definition_template_chash, signing_path),
    FOREIGN KEY (definition_template_chash) REFERENCES pending_shared_addresses(definition_template_chash)
);

CREATE TABLE shared_address_signing_paths (
    shared_address CHAR(32) NOT NULL,
    signing_path VARCHAR(255) NULL,
    address CHAR(32) NOT NULL,
    member_signing_path VARCHAR(255) NULL,
    device_address CHAR(33) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (shared_address, signing_path),
    FOREIGN KEY (shared_address) REFERENCES shared_addresses(shared_address)
);

CREATE TABLE outbox (
    message_hash CHAR(44) NOT NULL PRIMARY KEY,
    "to" CHAR(33) NOT NULL,
    message TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_error TEXT NULL
);

CREATE TABLE watched_light_addresses (
    peer VARCHAR(100) NOT NULL,
    address CHAR(32) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (peer, address)
);

CREATE TABLE IF NOT EXISTS push_registrations (
    registrationId TEXT,
    device_address TEXT NOT NULL,
    PRIMARY KEY (device_address)
);

CREATE TABLE chat_messages (
    id INTEGER NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    correspondent_address CHAR(33) NOT NULL,
    message TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_incoming INTEGER NOT NULL,
    type CHAR(15) NOT NULL DEFAULT 'text',
    FOREIGN KEY (correspondent_address) REFERENCES correspondent_devices(device_address) ON DELETE CASCADE
);

CREATE TABLE watched_light_units (
    peer VARCHAR(100) NOT NULL,
    unit CHAR(44) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (peer, unit)
);

CREATE TABLE bots (
    id INTEGER NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    rank INTEGER NOT NULL DEFAULT 0,
    name VARCHAR(100) NOT NULL UNIQUE,
    pairing_code VARCHAR(200) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE asset_metadata (
    asset CHAR(44) NOT NULL PRIMARY KEY,
    metadata_unit CHAR(44) NOT NULL,
    registry_address CHAR(32) NULL,
    suffix VARCHAR(20) NULL,
    name VARCHAR(20) NULL,
    decimals SMALLINT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (name, registry_address),
    FOREIGN KEY (asset) REFERENCES assets(unit),
    FOREIGN KEY (metadata_unit) REFERENCES units(unit)
);

CREATE TABLE sent_mnemonics (
    unit CHAR(44) NOT NULL,
    address CHAR(32) NOT NULL,
    mnemonic VARCHAR(107) NOT NULL,
    textAddress VARCHAR(120) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE private_profiles (
    private_profile_id INTEGER NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    unit CHAR(44) NOT NULL,
    payload_hash CHAR(44) NOT NULL,
    attestor_address CHAR(32) NOT NULL,
    address CHAR(32) NOT NULL,
    src_profile TEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (unit) REFERENCES units(unit)
);

CREATE TABLE private_profile_fields (
    private_profile_id INTEGER NOT NULL,
    field VARCHAR(50) NOT NULL,
    value VARCHAR(50) NOT NULL,
    blinding CHAR(16) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (private_profile_id, field),
    FOREIGN KEY (private_profile_id) REFERENCES private_profiles(private_profile_id)
);
