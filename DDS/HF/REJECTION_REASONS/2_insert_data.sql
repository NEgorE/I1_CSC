with jsdata as 
	(
	select json_content from "STG_HF".hf_commondata
	where objecttype = 'RejectionReasons'
	),


json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),


row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'name' as "name"
	, js1 ->> 'order' as "order"	
from json_elements
),


final_data as (
select 
"id"::int as "id"
,  name::text as "name"
, "order"::int as "order"
from  row_json
) 


insert into "HF".REJECTION_REASONS
select * from final_data