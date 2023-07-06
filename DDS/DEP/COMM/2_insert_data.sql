with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\OrgStructure.QH1\1873351.xml'), 'UTF8')) as XMLSTR
),

t2 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//OrganisationalStructureItem/ID',XMLSTR))))[1]::text::integer AS dep_id,
unnest(xpath('//Common/Name/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::varchar(100) AS "name",
unnest(xpath('//Common/Abbreviation/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::varchar(50) AS abreviation,
unnest(xpath('//Common/LanguageCode/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::varchar(2) AS languagecode,
unnest(xpath('//Common/ValidityPeriod/StartDate/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::date AS common_startdate,
unnest(xpath('//Common/ValidityPeriod/EndDate/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::date AS common_enddate
	
	FROM sml_str postgres
)

insert into dep.comm
SELECT *
FROM t2;
