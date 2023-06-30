-- Table: emp.emp

DROP TABLE IF EXISTS emp.emp;

CREATE TABLE IF NOT EXISTS emp.emp
(
    employee_id integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS emp.emp
    OWNER to postgres;