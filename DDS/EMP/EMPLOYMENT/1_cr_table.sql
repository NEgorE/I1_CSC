-- Table: emp.employment

DROP TABLE IF EXISTS emp.employment;

CREATE TABLE IF NOT EXISTS emp.employment
(
    ent_id character varying(24) COLLATE pg_catalog."default",
    company_id integer,
    --companyname character varying(255) COLLATE pg_catalog."default",
    statuscode integer,
    countrycode character varying(10) COLLATE pg_catalog."default",
    emp_startdate date,
    emp_enddate date
)
