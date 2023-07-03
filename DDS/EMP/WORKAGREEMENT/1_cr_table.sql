-- Table: emp.workagreement

DROP TABLE IF EXISTS emp.workagreement;

CREATE TABLE IF NOT EXISTS emp.workagreement
(
    wag_id integer,
    typecode integer,
    typename character varying(50) COLLATE pg_catalog."default",
    administrativecategorycode text COLLATE pg_catalog."default",
    administrativecategoryname character varying(50) COLLATE pg_catalog."default",
    capacityutilisationlevel_percent numeric(5,1),
    capacityutilisationlevel_startdate date,
    capacityutilisationlevel_enddate date,
    organisationalassignment_startdate date,
    organisationalassignment_enddate date,
    employeeassignmentpercent numeric(5,1)
)