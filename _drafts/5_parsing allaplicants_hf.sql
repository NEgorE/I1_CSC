CREATE table if not exists jsdata.allapplicants_tbl (
	id int4 NULL,
	tags jsonb NULL,
	email text NULL,
	links jsonb NULL,
	"money" text NULL,
	phone text NULL,
	photo bytea NULL,
	skype text NULL,
	social jsonb NULL,
	account int4 NULL,
	company text NULL,
	created timestamp NULL,
	doubles jsonb NULL,
	birthday date NULL,
	"external" jsonb NULL,
	"position" text NULL,
	agreement text NULL,
	last_name text NULL,
	photo_url text NULL,
	first_name text NULL,
	middle_name text NULL
);

-- делаю выборку json по условию "objecttype"
with jsdata as 
	(
	select json_content from "STG_HF".hf_commondata
	where objecttype = 'AllApplicants'
	),

-- забираю данные в элементе 'items' и записываю их в поле 'js1'
json_elements as (
select json_array_elements(json_content->'items')::jsonb AS js1 from jsdata
	),

--select * from json_elements

-- распарсил json в текствый формат в CTE
row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'tags' as "tags"	
	, js1 ->> 'email' as "email"		
	, js1 ->> 'links' as "links"	
	, js1 ->> 'money' as "money"	
	, js1 ->> 'phone' as "phone"	
	, js1 ->> 'photo' as "photo"	
	, js1 ->> 'skype' as "skype"		
	, js1 ->> 'social' as "social"
	, js1 ->> 'account' as "account"	
	, js1 ->> 'company' as "company"	
	, js1 ->> 'created' as "created"
	, js1 ->> 'doubles' as "doubles"	
	, js1 ->> 'birthday' as "birthday"
	, js1 ->> 'external' as "external"
	, js1 ->> 'position' as "position"
	, js1 ->> 'agreement' as "agreement"
	, js1 ->> 'last_name' as "last_name"
	, js1 ->> 'photo_url' as "photo_url"
	, js1 ->> 'first_name' as "first_name"
	, js1 ->> 'middle_name' as "middle_name"		
from json_elements
),
--select * from row_json

-- записал данные в CTE и изменил типы данных
final_data as (
select 
"id"::int as "id"
, "tags"::jsonb as "tags"
, "email"::text as "email"
, "links"::jsonb as "links"
, "money"::text as "money"
, "phone"::text as "phone"
, "photo"::bytea as "photo"
, "skype"::text as "skype"
, "social"::jsonb as "social"
, "account"::int as "account"
, "company"::text as "company"
, "created"::timestamp as "created"
, "doubles"::jsonb as "doubles"
, "birthday"::date as "birthday"
, "external"::jsonb as "external"
, "position"::text as "position"
, "agreement"::text as "agreement"
, "last_name"::text as "last_name"
, "photo_url"::text as "photo_url"
, "first_name"::text as "first_name"
, "middle_name"::text as "middle_name"
from  row_json
) 
select * from final_data
---------------------------------------------------------
    -- добавление данных в таблицу из CTE
   INSERT INTO jsdata.allapplicants_tbl
  (
	id 
	, tags 
	, email
	, links 
	, "money" 
	, phone 
	, photo
	, skype 
	, social 
	, account 
	, company 
	, created 
	, doubles
	, birthday 
	, "external" 
	, "position" 
	, agreement 
	, last_name 
	, photo_url
	, first_name
	, middle_name 
  )
   SELECT * from final_data;
-------------------------------------------
-- show data
select * from jsdata.allapplicants_tbl;


-- truncate table
truncate table jsdata.allapplicants_tbl;



