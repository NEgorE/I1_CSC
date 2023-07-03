--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),

t7 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/ID',XMLSTR))))[1]::text::integer AS WAG_ID,
(xpath('//TypeCode/text()',unnest(xpath('//Employee/Employment/WorkAgreement/TypeCode',XMLSTR))))[1]::text::integer AS TypeCode,	
(xpath('//TypeName/text()',unnest(xpath('//Employee/Employment/WorkAgreement/TypeName',XMLSTR))))[1]::varchar(50) AS TypeName,
(xpath('//AdministrativeCategoryCode/text()',unnest(xpath('//Employee/Employment/WorkAgreement/AdministrativeCategoryCode',XMLSTR))))[1]::text AS AdministrativeCategoryCode,
(xpath('//AdministrativeCategoryName/text()',unnest(xpath('//Employee/Employment/WorkAgreement/AdministrativeCategoryName',XMLSTR))))[1]::varchar(50) AS AdministrativeCategoryName,	
(xpath('//Percent/text()',unnest(xpath('//Employee/Employment/WorkAgreement/CapacityUtilisationLevel/Percent',XMLSTR))))[1]::text::numeric(5,1) AS CapacityUtilisationLevel_Percent,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/CapacityUtilisationLevel/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS CapacityUtilisationLevel_StartDate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/CapacityUtilisationLevel/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS CapacityUtilisationLevel_EndDate,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS OrganisationalAssignment_StartDate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS OrganisationalAssignment_EndDate,	
(xpath('//EmployeeAssignmentPercent/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/EmployeeAssignmentPercent',XMLSTR))))[1]::text::numeric(5,1)  AS EmployeeAssignmentPercent
FROM sml_str postgres
)

insert into emp.workagreement
select distinct * 
from t7