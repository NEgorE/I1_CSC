-- Table: emp.rel_emp_ent

DROP TABLE IF EXISTS emp.rel_emp_ent;

CREATE TABLE IF NOT EXISTS emp.rel_emp_ent
(
    emp_id integer,
    ent_id character varying(24) COLLATE pg_catalog."default"
)
