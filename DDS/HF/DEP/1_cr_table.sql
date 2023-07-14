-- Table: HF.dep

DROP TABLE IF EXISTS "HF".dep;

CREATE TABLE IF NOT EXISTS "HF".dep
(
    id integer,
    name character varying(100) COLLATE pg_catalog."default",
    "order" integer,
    active boolean,
    parent integer,
    deep integer,
    "foreign" integer,
    meta character varying(100) COLLATE pg_catalog."default"
)
;