-- Source: https://github.com/weibinshen/microservices-demo/blob/72d4f4fee10edb271b8a670c7d8d760698d7d7a2/elastic-query-service/src/main/resources/init-schema.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE public.users
(
    id uuid NOT NULL,
    username character varying COLLATE pg_catalog."default",
    firstname character varying COLLATE pg_catalog."default",
    lastname character varying COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id)
)

    TABLESPACE pg_default;

CREATE TABLE public.documents
(
    id uuid NOT NULL,
    document_id character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT documents_pkey PRIMARY KEY (id)
)

    TABLESPACE pg_default;

CREATE TABLE public.user_permissions
(
    user_id uuid NOT NULL,
    document_id uuid NOT NULL,
    user_permission_id uuid NOT NULL,
    permission_type character varying COLLATE pg_catalog."default",
    CONSTRAINT document_fk FOREIGN KEY (document_id)
        REFERENCES public.documents (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_fk FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

