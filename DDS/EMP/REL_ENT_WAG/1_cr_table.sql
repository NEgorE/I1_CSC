-- Table: emp.rel_ent_wag

DROP TABLE IF EXISTS emp.rel_ent_wag;

CREATE TABLE IF NOT EXISTS emp.rel_ent_wag
(
    ent_id character varying(24) COLLATE pg_catalog."default",
    wag_id integer
)
