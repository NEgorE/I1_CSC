-- drop table if exists employee_id_common_id;
-- drop table if exists employee_id_nationality_id;
-- drop table if exists  employee_tree;
-- drop table if exists nationality_tree;
-- drop table if exists employment_tree;
-- drop table if exists employee_id_employment_id;
-- drop table if exists employee_id_employment_id_workagreement_id_tree;
-- drop table if exists org_assignment_pos_assignment_org_centre;

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Связь межде Employee_ID и Common_ID
t1 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::text::integer AS Employee_ID,
unnest(xpath('//Employee/Common/ID/text()',unnest(xpath('//Employee',XMLSTR))))::text::integer AS Common_ID

FROM sml_str postgres
)


SELECT employee_id, common_id
INTO employee_id_common_id
FROM t1;

----------------------------------------------------------------------------------------------------------------
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Common_tree
t2 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Common/ID',XMLSTR))))[1]::text::integer AS Common_ID,
(xpath('//GenderCode/text()',unnest(xpath('//Employee/Common/GenderCode',XMLSTR))))[1]::text::integer AS GenderCode,	
(xpath('//MaritalStatusCode/text()',unnest(xpath('//Employee/Common/MaritalStatusCode',XMLSTR))))[1]::text::integer AS MaritalStatusCode,	
(xpath('//NonVerbalCommunicationLanguageCode/text()',unnest(xpath('//Employee/Common/NonVerbalCommunicationLanguageCode',XMLSTR))))[1]::varchar(10) AS LanguageCode,	
(xpath('//FormOfAddressCode/text()',unnest(xpath('//Employee/Common/PersonName/FormOfAddressCode',XMLSTR))))[1]::text::integer AS FormOfAddressCode,
(xpath('//GivenName/text()',unnest(xpath('//Employee/Common/PersonName/GivenName',XMLSTR))))[1]::varchar(50) AS GivenName,
(xpath('//MiddleName/text()',unnest(xpath('//Employee/Common/PersonName/MiddleName',XMLSTR))))[1]::varchar(50) AS MiddleName,
(xpath('//FamilyName/text()',unnest(xpath('//Employee/Common/PersonName/FamilyName',XMLSTR))))[1]::varchar(50) AS FamilyName,
(xpath('//InitialsName/text()',unnest(xpath('//Employee/Common/PersonName/InitialsName',XMLSTR))))[1]::varchar(10) AS InitialsName,	
(xpath('//DeviatingFullName/text()',unnest(xpath('//Employee/Common/PersonName/DeviatingFullName',XMLSTR))))[1]::varchar(255) AS DeviatingFullName,	
(xpath('//NameFormatCode/text()',unnest(xpath('//Employee/Common/PersonName/NameFormatCode',XMLSTR))))[1]::varchar(10) AS NameFormatCode,	
(xpath('//BirthDate/text()',unnest(xpath('//Employee/Common/BirthDate',XMLSTR))))[1]::text::date AS BirthDate,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Common/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS Common_StartDate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Common/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS Common_EndDate
FROM sml_str postgres
)

SELECT
common_id,
gendercode,
maritalstatuscode,
languagecode,
formofaddresscode,
givenname,
middlename,
familyname,
initialsname,
deviatingfullname,
nameformatcode,
birthdate,
common_startdate,
common_enddate


INTO employee_tree
FROM t2;
-----------------------------------------------------------------------------------------------------------------------------

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Связь межде Employee_ID и Nationality_ID
t3 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::text::integer AS Employee_ID,
unnest(xpath('//Employee/Nationality/ID/text()',unnest(xpath('//Employee',XMLSTR))))::text::integer AS Nationality_ID

FROM sml_str postgres
)

SELECT employee_id, nationality_id
INTO employee_id_nationality_id
FROM t3;
-----------------------------------------------------------------------------------------------------------------------------

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Nationality_tree
t4 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Nationality/ID',XMLSTR))))[1]::text::integer AS nationality_id,
(xpath('//CountryCode/text()',unnest(xpath('//Employee/Nationality/CountryCode',XMLSTR))))[1]::varchar(10) AS countrycode,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Nationality/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS nationality_startdate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Nationality/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS nationality_enddate
FROM sml_str postgres
)

--select * from s5


SELECT
nationality_id,
countrycode,
nationality_startdate,
nationality_enddate

INTO nationality_tree
FROM t4;

---------------------------------------------------------------------------------------------------------------------------------------

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Связь межде Employee_ID и Employment_ID
t5 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/ID',XMLSTR))))[1]::text::integer  AS Employee_ID,
unnest(xpath('//Employee/Employment/ID/text()',unnest(xpath('//Employee',XMLSTR))))::text  AS Employment_ID

FROM sml_str postgres
)

SELECT employee_id, employment_id
INTO employee_id_employment_id
FROM t5;

---------------------------------------------------------------------------------------------------------------

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Employment_tree
t6 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/ID',XMLSTR))))[1]::text AS Employment_ID,
(xpath('//CompanyID/text()',unnest(xpath('//Employee/Employment/CompanyID',XMLSTR))))[1]::text::integer AS Company_ID,	
(xpath('//CompanyName/text()',unnest(xpath('//Employee/Employment/CompanyName',XMLSTR))))[1]::varchar(255) AS CompanyName,
(xpath('//StatusCode/text()',unnest(xpath('//Employee/Employment/StatusCode',XMLSTR))))[1]::text::integer AS StatusCode,
(xpath('//CountryCode/text()',unnest(xpath('//Employee/Employment/CountryCode',XMLSTR))))[1]::varchar(10) AS CountryCode,	
(xpath('//StartDate/text()',unnest(xpath('//Employee/Employment/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS Employment_StartDate,	
(xpath('//EndDate/text()',unnest(xpath('//Employee/Employment/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS Employment_EndDate
		
FROM sml_str postgres
)

SELECT
employment_id,
company_id,
companyname,
statuscode,
countrycode,
employment_startdate,
employment_enddate

INTO employment_tree
FROM t6;

--------------------------------------------------------------------------------------------------------------------------------

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),

-- Связь межде Employee_ID и Employment/WorkAgreement_ID
t7 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/ID',XMLSTR))))[1]::text AS Employment_ID,
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/ID',XMLSTR))))[1]::text::integer AS WorkAgreement_ID,
(xpath('//TypeCode/text()',unnest(xpath('//Employee/Employment/WorkAgreement/TypeCode',XMLSTR))))[1]::text::integer AS TypeCode,	
(xpath('//TypeName/text()',unnest(xpath('//Employee/Employment/WorkAgreement/TypeName',XMLSTR))))[1]::varchar(100) AS TypeName,
(xpath('//AdministrativeCategoryCode/text()',unnest(xpath('//Employee/Employment/WorkAgreement/AdministrativeCategoryCode',XMLSTR))))[1]::text AS AdministrativeCategoryCode,
(xpath('//AdministrativeCategoryName/text()',unnest(xpath('//Employee/Employment/WorkAgreement/AdministrativeCategoryName',XMLSTR))))[1]::varchar(100) AS AdministrativeCategoryName,	
(xpath('//Percent/text()',unnest(xpath('//Employee/Employment/WorkAgreement/CapacityUtilisationLevel/Percent',XMLSTR))))[1]::text::numeric(5,1) AS CapacityUtilisationLevel_Percent,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/CapacityUtilisationLevel/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS CapacityUtilisationLevel_StartDate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/CapacityUtilisationLevel/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS CapacityUtilisationLevel_EndDate,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date::varchar(50) AS OrganisationalAssignment_StartDate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS OrganisationalAssignment_EndDate,	
(xpath('//EmployeeAssignmentPercent/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/EmployeeAssignmentPercent',XMLSTR))))[1]::text::real  AS EmployeeAssignmentPercent,	
(xpath('//PositionMainIndicator/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/PositionMainIndicator',XMLSTR))))[1]::text::boolean  AS PositionMainIndicator,
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/ID',XMLSTR))))[1]::text::integer AS Position_ID	

FROM sml_str postgres
)

SELECT
employment_id,
workagreement_id,
typecode,
typename,
administrativecategorycode,
capacityutilisationlevel_percent,
capacityutilisationlevel_startdate,
capacityutilisationlevel_enddate,
organisationalassignment_startdate,
organisationalassignment_enddate,
employeeassignmentpercent,
positionmainindicator,
position_id

INTO employee_id_employment_id_workagreement_id_tree
FROM t7;
-----------------------------------------------------------------------------------------------------------------------------
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:empl.HCM.xml'), 'UTF8')) as XMLSTR
),


-- Связь между Employment/WorkAgreement_ID, OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position_ID 
-- и OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position_ID/OrganisationalCentre_ID
-- OrganisationalCentre_tree
t8 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/ID',XMLSTR))))[1]::text::integer AS WorkAgreement_ID,	
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/ID',XMLSTR))))[1]::text::integer AS OrgAssignmentPositionAssignment_Position_ID,
(xpath('//Description/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/Description',XMLSTR))))[1]::varchar(255) AS OrgAssignmentPositionAssignment_Position_Description,
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/OrganisationalCentre/ID',XMLSTR))))[1]::text::bigint AS OrganisationalCentre_ID,
(xpath('//BusinessCharacterCode/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/OrganisationalCentre/BusinessCharacterCode',XMLSTR))))[1]::text::integer AS OrganisationalCentre_BusinessCharacterCode,
(xpath('//Name/text()',unnest(xpath('//Employee/Employment/WorkAgreement/OrganisationalAssignment/OrganisationalAssignmentPositionAssignment/Position/OrganisationalCentre/Name',XMLSTR))))[1]::varchar(255) AS OrganisationalCentre_Name	

FROM sml_str postgres
)


SELECT
workagreement_id,
orgassignmentpositionassignment_position_id,
orgassignmentpositionassignment_position_description,
organisationalcentre_id,
organisationalcentre_businesscharactercode,
organisationalcentre_name


INTO org_assignment_pos_assignment_org_centre
FROM t8;




