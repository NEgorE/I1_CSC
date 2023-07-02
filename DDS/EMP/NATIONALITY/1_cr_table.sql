-- Table: emp.nationality

DROP TABLE IF EXISTS emp.nationality;

CREATE TABLE IF NOT EXISTS emp.nationality
(
    nat_id integer,
    countrycode character varying(10) COLLATE pg_catalog."default",
    nat_startdate date,
    nat_enddate date
)
