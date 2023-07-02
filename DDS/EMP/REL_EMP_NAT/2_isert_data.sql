--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),

t3 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::text::integer AS EMP_ID,
unnest(xpath('//Employee/Nationality/ID/text()',unnest(xpath('//Employee',XMLSTR))))::text::integer AS NAT_ID
	
FROM sml_str postgres
)

insert into emp.REL_EMP_NAT
select * 
from t3	