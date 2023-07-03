--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),
t8 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/ID',XMLSTR))))[1]::text::integer AS pos_ID,
(xpath('//Description/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/Description',XMLSTR))))[1]::varchar(255) AS pos_desc,
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/OrganisationalCentre/ID',XMLSTR))))[1]::text::bigint AS OrganisationalCentre_ID--,
--(xpath('//BusinessCharacterCode/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/OrganisationalCentre/BusinessCharacterCode',XMLSTR))))[1]::text::integer AS OrganisationalCentre_BusinessCharacterCode,
--(xpath('//Name/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/OrganisationalCentre/Name',XMLSTR))))[1]::varchar(255) AS OrganisationalCentre_Name	

FROM sml_str postgres
)

insert into emp.position
select distinct *
from t8