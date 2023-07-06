with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\OrgStructure.QH1\1873351.xml'), 'UTF8')) as XMLSTR
),

t2 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//OrganisationalStructureItem/ID',XMLSTR))))[1]::text::integer AS dep_id,

unnest(xpath('//Relationship/RelatedObjectID/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::integer AS rel_dep_id,
unnest(xpath('//Relationship/ValidityPeriod/StartDate/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::date AS rel_startdate,
unnest(xpath('//Relationship/ValidityPeriod/EndDate/text()',unnest(xpath('//OrganisationalStructureItem',XMLSTR))))::text::date AS rel_enddate
	
	FROM sml_str postgres
)

insert into dep.rel_dep
SELECT *
FROM t2;
