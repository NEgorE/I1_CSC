-- View: DataMart.ch_02_emps

-- DROP MATERIALIZED VIEW IF EXISTS "DataMart".ch_02_emps;

CREATE MATERIALIZED VIEW IF NOT EXISTS "DataMart".ch_02_emps
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
        ), emp_ent2 AS (
         SELECT ree.emp_id AS emp_id2,
            "left"(min(ent.emp_startdate)::character varying(10)::text, 7)::character varying(7) AS min_ent_startdate2
           FROM emp.rel_emp_ent ree
             JOIN emp.employment ent ON ent.ent_id::text = ree.ent_id::text
             JOIN emp.rel_ent_wag rew ON rew.ent_id::text = ent.ent_id::text
             JOIN emp.workagreement w ON w.wag_id = rew.wag_id
          GROUP BY ree.emp_id
        ), emp_ent AS (
         SELECT ree.emp_id,
            "left"(min(ent.emp_startdate)::character varying(10)::text, 7)::character varying(7) AS min_ent_startdate
           FROM emp.rel_emp_ent ree
             JOIN emp.employment ent ON ent.ent_id::text = ree.ent_id::text
             JOIN emp.rel_ent_wag rew ON rew.ent_id::text = ent.ent_id::text
             JOIN emp.workagreement w ON w.wag_id = rew.wag_id
          WHERE w.typecode = ANY (ARRAY[1, 2])
          GROUP BY ree.emp_id
        ), s1 AS (
         SELECT c2.ym,
            c2.date_oth,
            ee.emp_id,
            ee.min_ent_startdate
           FROM cal2 c2
             LEFT JOIN emp_ent ee ON c2.ym::text = ee.min_ent_startdate::text
        ), s12 AS (
         SELECT c2.ym,
            c2.date_oth,
            ee2.emp_id2,
            ee2.min_ent_startdate2
           FROM cal2 c2
             LEFT JOIN emp_ent2 ee2 ON c2.ym::text = ee2.min_ent_startdate2::text
        ), vid3 AS (
         SELECT s1.date_oth,
            count(s1.emp_id) AS emp_count_fact
           FROM s1
          GROUP BY s1.date_oth
          ORDER BY s1.date_oth DESC
        ), vid32 AS (
         SELECT s12.date_oth,
            count(s12.emp_id2) AS emp_count_fact_sovm
           FROM s12
          GROUP BY s12.date_oth
          ORDER BY s12.date_oth DESC
        )
 SELECT v1.date_oth,
    v1.emp_count_fact,
    v2.emp_count_fact_sovm
   FROM vid3 v1
     JOIN vid32 v2 ON v1.date_oth = v2.date_oth
WITH DATA;

ALTER TABLE IF EXISTS "DataMart".ch_02_emps
    OWNER TO postgres;