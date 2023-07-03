--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),

t5 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::text::integer  AS Emp_ID,
unnest(xpath('//Employee/Employment/ID/text()',unnest(xpath('//Employee',XMLSTR))))::varchar(24)  AS Ent_ID

FROM sml_str postgres
)

insert into emp.rel_emp_ent
select * 
from t5