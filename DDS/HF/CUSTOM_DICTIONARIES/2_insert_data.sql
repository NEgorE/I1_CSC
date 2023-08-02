with jsdata as 
	(
	select json_content from "STG_HF".hf_commondata
	where objecttype = 'CustomDictionaries'
	),


json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),


row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'code' as "code"	
	, js1 ->> 'name' as "name"
	, js1 ->> 'created' as "created"	
	, js1 ->> 'foreign' as "foreign"	
from json_elements
),


final_data as (
select 
"id"::int as "id"
, "code"::text as "code"
,  name::text as "name"
, "created"::timestamp as "created"
, "foreign"::int as "foreign"
from  row_json
) 

insert into "HF".CUSTOM_DICTIONARIES
select * from final_data