DROP MATERIALIZED VIEW IF EXISTS "DataMart".ch_03_leaders;
CREATE MATERIALIZED VIEW IF NOT EXISTS "DataMart".ch_03_leaders
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
            ent.emp_enddate AS ent_enddate,
			pos.organisationalcentre_id
           FROM emp.rel_emp_ent ree
             JOIN emp.employment ent ON ent.ent_id::text = ree.ent_id::text
			join emp.rel_ent_wag rew on rew.ent_id=ent.ent_id
			join emp.rel_wag_pos rwp on rwp.wag_id=rew.wag_id
			join emp.position pos on pos.pos_id=rwp.pos_id
        ), emp_ent2 AS (
         SELECT ree.emp_id AS emp_id2,
			pos.organisationalcentre_id,
            "left"(min(ent.emp_startdate)::character varying(10)::text, 7)::character varying(7) AS min_ent_startdate2
           FROM emp.rel_emp_ent ree
             JOIN emp.employment ent ON ent.ent_id::text = ree.ent_id::text
			join emp.rel_ent_wag rew on rew.ent_id=ent.ent_id
			join emp.rel_wag_pos rwp on rwp.wag_id=rew.wag_id
			join emp.position pos on pos.pos_id=rwp.pos_id
          GROUP BY ree.emp_id,
			pos.organisationalcentre_id
        ), s1 AS (
         SELECT c2.ym,
            c2.date_oth,
            ee.emp_id,
            ee.ent_id,
            ee.ent_startdate,
            ee.ent_enddate,
			ee.organisationalcentre_id
           FROM cal2 c2
             LEFT JOIN emp_ent ee ON c2.date_oth >= ee.ent_startdate AND c2.date_oth <= ee.ent_enddate
        ), vid1 AS (
         SELECT s1.date_oth, s1.ym,
			s1.organisationalcentre_id,
            count(s1.emp_id) AS emp_count_fact
           FROM s1
          GROUP BY s1.date_oth, s1.ym, s1.organisationalcentre_id
          ORDER BY s1.date_oth DESC
        ),
		vid2 as (
		select 
				ee2.min_ent_startdate2 as mym,
				ee2.organisationalcentre_id,
				 count(ee2.emp_id2) AS emp_count_new
		
		from emp_ent2 ee2
		group by ee2.min_ent_startdate2,
				ee2.organisationalcentre_id
		
		)
 SELECT vid1.date_oth, vid1.ym, vid1.organisationalcentre_id,
    vid1.emp_count_fact, vid2.emp_count_new
   FROM vid1
   left join vid2 on vid1.ym = vid2.mym and vid1.organisationalcentre_id=vid2.organisationalcentre_id
