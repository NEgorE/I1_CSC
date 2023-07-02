--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),
-- Связь межде Employee_ID и Common_ID
t1 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::text::integer AS Employee_ID,
unnest(xpath('//Employee/Common/ID/text()',unnest(xpath('//Employee',XMLSTR))))::text::integer AS Common_ID

FROM sml_str postgres
)


insert into emp.REL_EMP_COMM
select
t1.Employee_ID::integer as emp_id,
t1.Common_ID::integer as comm_id
from t1