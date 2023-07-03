--replace 1st section by STG part
with sml_str as
(SELECT
XMLPARSE(DOCUMENT convert_from(
     pg_read_binary_file('C:\Users\111\Desktop\CKR_S\empl.HRA.01.xml'), 'UTF8')) as XMLSTR
),

-- Employment_tree
t6 as (
SELECT
(xpath('//ID/text()',unnest(xpath('//Employee/Employment/ID',XMLSTR))))[1]::varchar(24) AS Ent_ID,
(xpath('//CompanyID/text()',unnest(xpath('//Employee/Employment/CompanyID',XMLSTR))))[1]::text::integer AS Company_ID,	
--(xpath('//CompanyName/text()',unnest(xpath('//Employee/Employment/CompanyName',XMLSTR))))[1]::varchar(255) AS CompanyName,
(xpath('//StatusCode/text()',unnest(xpath('//Employee/Employment/StatusCode',XMLSTR))))[1]::text::integer AS StatusCode,
(xpath('//CountryCode/text()',unnest(xpath('//Employee/Employment/CountryCode',XMLSTR))))[1]::varchar(10) AS CountryCode,	
(xpath('//StartDate/text()',unnest(xpath('//Employee/Employment/ValidityPeriod/StartDate',XMLSTR))))[1]::text::date AS Emp_StartDate,	
(xpath('//EndDate/text()',unnest(xpath('//Employee/Employment/ValidityPeriod/EndDate',XMLSTR))))[1]::text::date AS Emp_EndDate
		
FROM sml_str postgres
)

insert into emp.employment
select * from t6