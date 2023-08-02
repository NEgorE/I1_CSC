create schema if not exists  jsdata;

-- create table hf_commondata, insert values 
-- list of tables ['OrgStrucure', 'RejectionReasons', 'CustomDictionaries', 'AllVacancies', 'AllApplicants'] 




CREATE table if not exists jsdata.rejectionreasons_tbl (
	id int4 null -- так как в данных есть значение null
	, "name" text NULL
	, "order" int4 NULL
);

-- делаю выборку json по условию "objecttype"
with jsdata as 
	(
	select json_content from jsdata.hf_commondata
	where objecttype like 'RejectionReasons'
	),

-- забираю данные в элементе 'items' и записываю их в поле 'js1'
json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),

-- распарсил json в текствый формат в CTE
row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'name' as "name"
	, js1 ->> 'order' as "order"	
from json_elements
),

-- записал данные в CTE и изменил типы данных
final_data as (
select 
"id"::int as "id"
,  name::text as "name"
, "order"::int as "order"
from  row_json
) 
---------------------------------------------------------
    -- добавление данных в таблицу из CTE
   INSERT INTO jsdata.rejectionreasons_tbl
  (
	id 
	, "name" 
	, "order"
  )
   SELECT * from final_data;
-------------------------------------------
-- show data
select * from jsdata.rejectionreasons_tbl;


-- truncate table
truncate table jsdata.rejectionreasons_tbl;



