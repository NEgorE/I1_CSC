-- Table: HF.custom_dictionaries

DROP TABLE IF EXISTS "HF".custom_dictionaries;

CREATE TABLE IF NOT EXISTS "HF".custom_dictionaries
(
    id integer,
    code text COLLATE pg_catalog."default",
    name text COLLATE pg_catalog."default",
    created timestamp without time zone,
    "foreign" integer
)
;