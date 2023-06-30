--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),
s1 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::varchar(50) AS Employee_ID
FROM sml_str postgres
)

insert into emp.EMP
select 
s1.Employee_ID::integer
from s1