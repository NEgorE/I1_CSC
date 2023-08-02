create schema if not exists  jsdata;

-- create table hf_commondata, insert values 
-- list of tables ['OrgStrucure', 'RejectionReasons', 'CustomDictionaries', 'AllVacancies', 'AllApplicants'] 




CREATE table if not exists jsdata.customdictionaries_tbl (
	id int4 primary key,
	code text NULL,
	"name" text NULL,
	created timestamp NULL,
	"foreign" int4 NULL
);

-- делаю выборку json по условию "objecttype"
with jsdata as 
	(
	select json_content from jsdata.hf_commondata
	where objecttype like 'CustomDictionaries'
	),

-- забираю данные в элементе 'items' и записываю их в поле 'js1'
json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),

-- распарсил json в текствый формат в CTE
row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'code' as "code"	
	, js1 ->> 'name' as "name"
	, js1 ->> 'created' as "created"	
	, js1 ->> 'foreign' as "foreign"	
from json_elements
),

-- записал данные в CTE и изменил типы данных
final_data as (
select 
"id"::int as "id"
, "code"::text as "code"
,  name::text as "name"
, "created"::timestamp as "created"
, "foreign"::int as "foreign"
from  row_json
) 
---------------------------------------------------------
    -- добавление данных в таблицу из CTE
   INSERT INTO jsdata.customdictionaries_tbl
  (
	id  
	, code 
	, "name" 
	, created 
	, "foreign" 
  )
   SELECT * from final_data;
-------------------------------------------
-- show data
select * from jsdata.customdictionaries_tbl;


-- truncate table
truncate table jsdata.customdictionaries_tbl;



