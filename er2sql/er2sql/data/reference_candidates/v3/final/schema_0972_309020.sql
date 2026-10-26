-- Source: https://github.com/iuri/cif/blob/a6d642f7a7f58910728e7e088926094736cbf21f/packages/acs-lang/sql/postgresql/upgrade/upgrade-4.7d2-4.7d3.sql?raw=true
-- Tables detected: 3 | FK constraints: 1
create table temp (
    locale varchar(30),
    message text
);

create table lang_message_keys (
    message_key varchar(200)
                       constraint lang_message_keys_message_key_nn
                       not null,
    package_key varchar(100)
                       constraint lang_message_keys_fk
                       references apm_package_types(package_key)
                       constraint lang_message_keys_package_key_nn
                       not null,
    constraint lang_message_keys_pk
    primary key (message_key, package_key)
);

create table lang_messages (
    message_key varchar(200)
                       constraint lang_messages_message_key_nn
                       not null,
    package_key varchar(100)
                       constraint lang_messages_package_key_nn
                       not null,
    locale varchar(30) 
                       constraint lang_messages_locale_fk
                       references ad_locales(locale)
                       constraint lang_messages_locale_nn
                       not null,
    message text,
    constraint lang_messages_fk
    foreign key (message_key, package_key) 
    references lang_message_keys(message_key, package_key)
    on delete cascade,
    constraint lang_messages_pk 
    primary key (message_key, package_key, locale)
);
CREATE INDEX ON temp (200);
