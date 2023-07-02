--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),
-- Common_tree
t2 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Common/ID',XMLSTR))))[1]::text::integer AS comm_id,
(xpath('//GenderCode/text()',unnest(xpath('//Employee/Common/GenderCode',XMLSTR))))[1]::text::integer AS GenderCode,	
(xpath('//MaritalStatusCode/text()',unnest(xpath('//Employee/Common/MaritalStatusCode',XMLSTR))))[1]::text::integer AS MaritalStatusCode,
(xpath('//GivenName/text()',unnest(xpath('//Employee/Common/PersonName/GivenName',XMLSTR))))[1]::varchar(50) AS GivenName,
(xpath('//MiddleName/text()',unnest(xpath('//Employee/Common/PersonName/MiddleName',XMLSTR))))[1]::varchar(50) AS MiddleName,
(xpath('//FamilyName/text()',unnest(xpath('//Employee/Common/PersonName/FamilyName',XMLSTR))))[1]::varchar(50) AS FamilyName,
(xpath('//InitialsName/text()',unnest(xpath('//Employee/Common/PersonName/InitialsName',XMLSTR))))[1]::varchar(10) AS InitialsName,	
(xpath('//DeviatingFullName/text()',unnest(xpath('//Employee/Common/PersonName/DeviatingFullName',XMLSTR))))[1]::varchar(255) AS DeviatingFullName,
(xpath('//BirthDate/text()',unnest(xpath('//Employee/Common/BirthDate',XMLSTR))))[1]::text::date AS BirthDate,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Common/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS Comm_StartDate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Common/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS Comm_EndDate
FROM sml_str postgres
)

insert into emp.COMM
select distinct * from t2