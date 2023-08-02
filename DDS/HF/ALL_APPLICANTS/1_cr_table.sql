DROP TABLE IF EXISTS "HF".all_applicants;

CREATE TABLE IF NOT EXISTS "HF".all_applicants
(
    id integer,
    tags jsonb,
    email text COLLATE pg_catalog."default",
    links jsonb,
    money text COLLATE pg_catalog."default",
    phone text COLLATE pg_catalog."default",
    photo bytea,
    skype text COLLATE pg_catalog."default",
    social jsonb,
    account integer,
    company text COLLATE pg_catalog."default",
    created timestamp without time zone,
    doubles jsonb,
    birthday date,
    external jsonb,
    "position" text COLLATE pg_catalog."default",
    agreement text COLLATE pg_catalog."default",
    last_name text COLLATE pg_catalog."default",
    photo_url text COLLATE pg_catalog."default",
    first_name text COLLATE pg_catalog."default",
    middle_name text COLLATE pg_catalog."default"
)
;
