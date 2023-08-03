select *  from emp.rel_emp_ent
select *  from emp.employment order by 7 desc

select *  from emp.rel_ent_wag
select *  from emp.workagreement

select *  from emp.rel_wag_pos
select *  from emp.position


select
	ree.emp_id,
	ree.ent_id,
	ent.emp_startdate as ent_startdate,
	ent.emp_enddate as ent_enddate
	
from emp.rel_emp_ent ree
inner join emp.employment ent on ent.ent_id = ree.ent_id
-----------------------------------------------------------------------------------
with cal1 as (
select
    '2023-01-01'::date + i as f1,
	left(cast('2023-01-01'::date + i as varchar(10)),7)::varchar(7) as f2
from generate_series(0, current_date - '2023-01-01'::date - 1) i
),
cal2 as (
select 
	f2 as YM,
	max(f1) as DATE_OTH
from cal1
group by f2
),
emp_ent as (
select
	ree.emp_id,
	ree.ent_id,
	ent.emp_startdate as ent_startdate,
	ent.emp_enddate as ent_enddate
from emp.rel_emp_ent ree
inner join emp.employment ent on ent.ent_id = ree.ent_id
),
s1 as (
select 
* 
from cal2 c2
left join emp_ent ee on c2.DATE_OTH between ee.ent_startdate and ee.ent_enddate
),
vid1 as (
select 
	date_oth,
	count(emp_id) as EMP_COUNT_FACT
from s1
group by date_oth
order by 1 desc
) 
select * from vid1
-----------------------------------------------------------------------------------
