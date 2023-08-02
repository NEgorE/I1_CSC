with jsdata as 
	(
	select json_content from "STG_HF".hf_commondata
	where objecttype = 'AllVacancies'
	),


json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),


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


insert into "HF".ALL_VACANCIES--AllVacancies
SELECT * from final_data;