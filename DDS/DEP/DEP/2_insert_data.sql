with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\OrgStructure.QH1\1873351.xml'), 'UTF8')) as XMLSTR
),

t2 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//OrganisationalStructureItem/ID',XMLSTR))))[1]::text::integer AS orgstructureitem_id
	
	FROM sml_str postgres
)

insert into dep.dep
SELECT distinct
orgstructureitem_id as dep_id
FROM t2;
