-- Table: emp.comm

DROP TABLE IF EXISTS emp.comm;

CREATE TABLE IF NOT EXISTS emp.comm
(
    comm_id integer,
    gendercode integer,
    maritalstatuscode integer,
    givenname character varying(50) COLLATE pg_catalog."default",
    middlename character varying(50) COLLATE pg_catalog."default",
    familyname character varying(50) COLLATE pg_catalog."default",
    initialsname character varying(10) COLLATE pg_catalog."default",
    deviatingfullname character varying(255) COLLATE pg_catalog."default",
    birthdate date,
    comm_startdate date,
    comm_enddate date
)
