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