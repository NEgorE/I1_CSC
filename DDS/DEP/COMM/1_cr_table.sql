-- Table: dep.comm

DROP TABLE IF EXISTS dep.comm;

CREATE TABLE IF NOT EXISTS dep.comm
(
    dep_id integer,
    name character varying(100) COLLATE pg_catalog."default",
    abbreviation character varying(50) COLLATE pg_catalog."default",
    languagecode character varying(2) COLLATE pg_catalog."default",
    comm_startdate date,
    comm_enddate date
)