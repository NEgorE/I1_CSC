--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),
t8 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/ID',XMLSTR))))[1]::text::integer AS wag_ID,	
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/ID',XMLSTR))))[1]::text::integer AS pos_ID
FROM sml_str postgres
)

insert into emp.rel_wag_pos
select distinct * 
from t8