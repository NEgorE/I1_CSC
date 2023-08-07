-- View: DataMart.ch_01_fact

-- DROP MATERIALIZED VIEW IF EXISTS "DataMart".ch_01_fact;

CREATE MATERIALIZED VIEW IF NOT EXISTS "DataMart".ch_01_fact
TABLESPACE pg_default
AS
 WITH cal1 AS (
         SELECT '2023-01-01'::date + i.i AS f1,
            "left"((('2023-01-01'::date + i.i))::character varying(10)::text, 7)::character varying(7) AS f2
           FROM generate_series(0, CURRENT_DATE - '2023-01-01'::date - 1) i(i)
        ), cal2 AS (
         SELECT cal1.f2 AS ym,
            max(cal1.f1) AS date_oth
           FROM cal1
          GROUP BY cal1.f2
        ), emp_ent AS (
         SELECT ree.emp_id,
            ree.ent_id,
            ent.emp_startdate AS ent_startdate,
            ent.emp_enddate AS ent_enddate
           FROM emp.rel_emp_ent ree
             JOIN emp.employment ent ON ent.ent_id::text = ree.ent_id::text
        ), s1 AS (
         SELECT c2.ym,
            c2.date_oth,
            ee.emp_id,
            ee.ent_id,
            ee.ent_startdate,
            ee.ent_enddate
           FROM cal2 c2
             LEFT JOIN emp_ent ee ON c2.date_oth >= ee.ent_startdate AND c2.date_oth <= ee.ent_enddate
        ), vid1 AS (
         SELECT s1.date_oth,
            count(s1.emp_id) AS emp_count_fact
           FROM s1
          GROUP BY s1.date_oth
          ORDER BY s1.date_oth DESC
        )
 SELECT vid1.date_oth,
    vid1.emp_count_fact
   FROM vid1
WITH DATA;

ALTER TABLE IF EXISTS "DataMart".ch_01_fact
    OWNER TO postgres;