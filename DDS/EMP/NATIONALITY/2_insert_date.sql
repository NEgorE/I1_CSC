--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),
-- Nationality_tree
t4 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Nationality/ID',XMLSTR))))[1]::text::integer AS nat_id,
(xpath('//CountryCode/text()',unnest(xpath('//Employee/Nationality/CountryCode',XMLSTR))))[1]::varchar(10) AS countrycode,
(xpath('//StartDate/text()',unnest(xpath('//Employee/Nationality/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS nat_startdate,
(xpath('//EndDate/text()',unnest(xpath('//Employee/Nationality/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS nat_enddate
FROM sml_str postgres
)

insert into emp.NATIONALITY
select distinct * 
from t4