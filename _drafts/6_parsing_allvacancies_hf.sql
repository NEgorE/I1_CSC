create schema if not exists  jsdata;


CREATE table if not exists jsdata.allvacancies_tbl (
	id int4 primary key
	, "money" text NULL
	, state text NULL
	, hidden bool NULL
	, parent text NULL
	, company text NULL
	, created timestamp NULL
	, multiple bool NULL
	, "position" text NULL
	, priority int4 NULL
	, account_region text NULL
	, account_division int4 NULL
	, additional_fields_list jsonb NULL
	, account_vacancy_status_group text NULL
);

-- делаю выборку json по условию "objecttype"
with jsdata as 
	(
	select json_content from jsdata.hf_commondata
	where objecttype like 'AllVacancies'
	),

-- забираю данные в элементе 'items' и записываю их в поле 'js1'
json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),

-- распарсил json в текствый формат в CTE
row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'money' as "money"	
	, js1 ->> 'state' as "state"	
	, js1 ->> 'hidden' as "hidden"	
	, js1 ->> 'parent' as "parent"	
	, js1 ->> 'company' as "company"	
	, js1 ->> 'created' as "created"	
	, js1 ->> 'multiple' as "multiple"	
	, js1 ->> 'position' as "position"	
	, js1 ->> 'priority' as "priority"	
	, js1 ->> 'account_region' as "account_region"	
	, js1 ->> 'account_division' as "account_division"	
	, js1 ->> 'additional_fields_list' as "additional_fields_list"	
	, js1 ->> 'account_vacancy_status_group' as "account_vacancy_status_group"		
from json_elements
),

-- записал данные в CTE и изменил типы данных
final_data as (
select 
"id"::int as "id"
, "money"::text as "money"
, "state"::text as "state"
, "hidden"::boolean as "hidden"
, "parent"::text as "parent"
, "company"::text as "company"
, "created"::timestamp as "created"
, "multiple"::boolean as "multiple"
, "position"::text as "position"
, "priority"::int as "priority"
, "account_region"::text as "account_region"
, "account_division"::int as "account_division"
, "additional_fields_list"::jsonb as "additional_fields_list"
, "account_vacancy_status_group"::text as "account_vacancy_status_group"
from  row_json
) 
---------------------------------------------------------
    -- добавление данных в таблицу из CTE
   INSERT INTO jsdata.allvacancies_tbl
  (
	id
	, "money" 
	, state 
	, hidden 
	, parent
	, company
	, created
	, multiple 
	, "position" 
	, priority 
	, account_region
	, account_division 
	, additional_fields_list 
	, account_vacancy_status_group 
  )
   SELECT * from final_data;
-------------------------------------------
-- show data
select * from jsdata.allvacancies_tbl;


-- truncate table
truncate table jsdata.allvacancies_tbl ;

--CREATE TABLE jsdata.orgstrucure_tbl (LIKE jsdata.orgstrucure1 INCLUDING ALL);

