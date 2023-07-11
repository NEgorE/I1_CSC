-- drop table if exists OrganisationalStructureItem;

-- условие по которому выбирал теги выражение XPath [Common/ValidityPeriod/EndDate="9999-12-31"]

with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('D:OrganisationalStructureReplicationRequest.xml'), 'UTF8')) as XMLSTR
),

t2 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/ID',XMLSTR))))[1]::text::integer AS orgstructureitem_id,
(xpath('//TypeCode/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/TypeCode',XMLSTR))))[1]::text AS typecode,
(xpath('//CompanyCode/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/CompanyCode',XMLSTR))))[1]::text::integer AS companycode,	
(xpath('//StartDate/text()',unnest(xpath('//OrganisationalStructureItem/Common/ValidityPeriod[EndDate="9999-12-31"]/StartDate',XMLSTR))))[1]::text::date AS common_startdate,
(xpath('//EndDate/text()',unnest(xpath('//OrganisationalStructureItem/Common/ValidityPeriod[EndDate="9999-12-31"]/EndDate',XMLSTR))))[1]::text::date AS common_enddate,
(xpath('//Abbreviation/text()',unnest(xpath('//OrganisationalStructureItem/Common[ValidityPeriod/EndDate="9999-12-31"]/Abbreviation',XMLSTR))))[1]::text AS abreviation,
(xpath('//Name/text()',unnest(xpath('//OrganisationalStructureItem/Common[ValidityPeriod/EndDate="9999-12-31"]/Name',XMLSTR))))[1]::text AS "name",
(xpath('//LanguageCode/text()',unnest(xpath('//OrganisationalStructureItem/Common[ValidityPeriod/EndDate="9999-12-31"]/LanguageCode',XMLSTR))))[1]::text AS languagecode,	
(xpath('//RelatedObjectID/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/Relationship/RelatedObjectID',XMLSTR))))[1]::text::integer AS relatedobjectid,
(xpath('//StartDate/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/Relationship/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS relationship_startdate,
(xpath('//EndDate/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/Relationship/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS relationship_enddate,
(xpath('//RelationshipDirectionCode/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/Relationship/RelationshipDirectionCode',XMLSTR))))[1]::text AS relationshipdirectioncode,
(xpath('//RelationshipTypeCode/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/Relationship/RelationshipTypeCode',XMLSTR))))[1]::text AS relationshiptypecode,
(xpath('//RelatedObjectTypeCode/text()',unnest(xpath('//OrganisationalStructureItem[Common/ValidityPeriod/EndDate="9999-12-31"]/Relationship/RelatedObjectTypeCode',XMLSTR))))[1]::text AS relatedojecttypecode
	
	
	FROM sml_str postgres
)

SELECT 
orgstructureitem_id,
typecode,
companycode,
common_startdate,
common_enddate,
abreviation,
"name",
languagecode,
relatedobjectid,
relationship_startdate,
relationshipdirectioncode,
relationshiptypecode,
relatedojecttypecode

INTO OrganisationalStructureItem
FROM t2;
