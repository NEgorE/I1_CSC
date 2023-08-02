-- Table: HF.rejection_reasons

DROP TABLE IF EXISTS "HF".rejection_reasons;

CREATE TABLE IF NOT EXISTS "HF".rejection_reasons
(
    id integer,
    name text COLLATE pg_catalog."default",
    "order" integer
);