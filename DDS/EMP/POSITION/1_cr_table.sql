-- Table: emp.position

DROP TABLE IF EXISTS emp."position";

CREATE TABLE IF NOT EXISTS emp."position"
(
    pos_id integer,
    pos_desc character varying(255) COLLATE pg_catalog."default",
    organisationalcentre_id bigint
)