--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),

t7 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/ID',XMLSTR))))[1]::varchar(24) AS ent_id,
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/ID',XMLSTR))))[1]::text::integer AS wag_id
FROM sml_str postgres
)

insert into emp.rel_ent_wag
select distinct * 
from t7