create or replace  FUNCTION some_query() RETURNS JSON AS
$$ SELECT '{"items":[
{"id":31033,"name":"АО \"Волга-флот\"","order":0,"active":true,"parent":null,"deep":0,"foreign":"50600174","meta":null},
{"id":31034,"name":"АО \"Волга-флот\"","order":1,"active":true,"parent":31033,"deep":1,"foreign":"50600206","meta":null},
{"id":31035,"name":"АДМИНИСТРАТИВНО-ХОЗЯЙСТВЕННАЯ ДИРЕКЦИЯ","order":2,"active":true,"parent":31034,"deep":2,"foreign":"50600203","meta":null},
{"id":31036,"name":"Отдел безопасности","order":3,"active":true,"parent":31035,"deep":3,"foreign":"50600402","meta":null},
{"id":31037,"name":"Отдел документационного обеспечения","order":4,"active":true,"parent":31035,"deep":3,"foreign":"50600406","meta":null},
{"id":31038,"name":"Отдел транспортной безопасности","order":5,"active":true,"parent":31035,"deep":3,"foreign":"50600436","meta":null},
{"id":31039,"name":"Хозяйственный отдел","order":6,"active":true,"parent":31035,"deep":3,"foreign":"50600522","meta":null},
{"id":31040,"name":"ДИРЕКЦИЯ ПО БЕЗОПАСНОСТИ СУДОХОДСТВА","order":7,"active":true,"parent":31034,"deep":2,"foreign":"50600311","meta":null},
{"id":31041,"name":"Группа главного штурмана","order":8,"active":true,"parent":31040,"deep":3,"foreign":"50600307","meta":null},
{"id":31042,"name":"Управление по морскому сухогруз-му флоту","order":9,"active":true,"parent":31040,"deep":3,"foreign":"50637652","meta":null},
{"id":31043,"name":"Отдел безопасности судовождения","order":10,"active":true,"parent":31042,"deep":4,"foreign":"50637658","meta":null},
{"id":31044,"name":"Отдел системы управления безопасностью","order":11,"active":true,"parent":31042,"deep":4,"foreign":"50637657","meta":null},
{"id":31045,"name":"Управление по наливному флоту","order":12,"active":true,"parent":31040,"deep":3,"foreign":"50653848","meta":null},
{"id":31046,"name":"Отдел безопасности судовождения","order":13,"active":true,"parent":31045,"deep":4,"foreign":"50653898","meta":null},
{"id":31047,"name":"Отдел качества и веттинг-контроля","order":14,"active":true,"parent":31045,"deep":4,"foreign":"50653899","meta":null},
{"id":31048,"name":"Отдел системы управления безопасностью","order":15,"active":true,"parent":31045,"deep":4,"foreign":"50653897","meta":null},
{"id":31049,"name":"Управление по речному сухогруз-му флоту","order":16,"active":true,"parent":31040,"deep":3,"foreign":"50637653","meta":null},
{"id":31050,"name":"Отдел безопасности судовождения","order":17,"active":true,"parent":31049,"deep":4,"foreign":"50637660","meta":null},
{"id":31051,"name":"Отдел системы управления безопасностью","order":18,"active":true,"parent":31049,"deep":4,"foreign":"50637659","meta":null},
{"id":31052,"name":"ДИРЕКЦИЯ ПО КОММЕРЦИИ","order":19,"active":true,"parent":31034,"deep":2,"foreign":"50645128","meta":null},
{"id":31053,"name":"Отдел оперативного маркетинга","order":20,"active":true,"parent":31052,"deep":3,"foreign":"50649422","meta":null},
{"id":31054,"name":"Отдел оперативного сопр-ия контрактов","order":21,"active":true,"parent":31052,"deep":3,"foreign":"50645200","meta":null},
{"id":31055,"name":"Отдел по аналитике и учету","order":22,"active":true,"parent":31052,"deep":3,"foreign":"50645196","meta":null},
{"id":31056,"name":"Управление по фрахту мор-го сух-го флота","order":23,"active":true,"parent":31052,"deep":3,"foreign":"50645179","meta":null},
{"id":31057,"name":"Управление по фрахту наливного флота","order":24,"active":true,"parent":31052,"deep":3,"foreign":"50645129","meta":null},
{"id":31058,"name":"Управление по фрахту реч. сух-го флота","order":25,"active":true,"parent":31052,"deep":3,"foreign":"50645142","meta":null},
{"id":31059,"name":"ДИРЕКЦИЯ ПО ПРАВОВОМУ ОБЕСПЕЧЕНИЮ","order":26,"active":true,"parent":31034,"deep":2,"foreign":"50600313","meta":null},
{"id":31060,"name":"Отдел корпоративного сопровождения","order":27,"active":true,"parent":31059,"deep":3,"foreign":"50654250","meta":null},
{"id":31061,"name":"Отдел таможенного оформления и таможен","order":28,"active":true,"parent":31059,"deep":3,"foreign":"50654249","meta":null},
{"id":31062,"name":"Юридический отдел","order":29,"active":true,"parent":31059,"deep":3,"foreign":"50600525","meta":null},
{"id":31063,"name":"ДИРЕКЦИЯ ПО СНАБЖЕНИЮ","order":30,"active":true,"parent":31034,"deep":2,"foreign":"50637602","meta":null},
{"id":31064,"name":"Отдел закупок","order":31,"active":true,"parent":31063,"deep":3,"foreign":"50637603","meta":null},
{"id":31065,"name":"Отдел складского хозяйства","order":32,"active":true,"parent":31063,"deep":3,"foreign":"50637606","meta":null},
{"id":31066,"name":"Отдел сопровождения закупок","order":33,"active":true,"parent":31063,"deep":3,"foreign":"50637605","meta":null},
{"id":31067,"name":"ДИРЕКЦИЯ ПО СТРАТЕГИИ И РАЗВИТИЮ","order":34,"active":true,"parent":31034,"deep":2,"foreign":"50641395","meta":null},
{"id":31068,"name":"Группа по операционной эффективности","order":35,"active":true,"parent":31067,"deep":3,"foreign":"50713615","meta":null},
{"id":31069,"name":"ДИРЕКЦИЯ ПО УПРАВЛЕНИЮ ПЕРСОНАЛОМ","order":36,"active":true,"parent":31034,"deep":2,"foreign":"50600316","meta":null},
{"id":31070,"name":"Отдел автоматизации HR процессов и цифро","order":37,"active":true,"parent":31069,"deep":3,"foreign":"50647600","meta":null},
{"id":31071,"name":"Отдел охраны труда","order":38,"active":true,"parent":31069,"deep":3,"foreign":"50652985","meta":null},
{"id":31072,"name":"Отдел оценки и обучения персонала","order":39,"active":true,"parent":31069,"deep":3,"foreign":"50629510","meta":null},
{"id":31073,"name":"Отдел по внешним и внутренним коммуникац","order":40,"active":true,"parent":31069,"deep":3,"foreign":"50654301","meta":null},
{"id":31074,"name":"Отдел труда и заработной платы","order":41,"active":true,"parent":31069,"deep":3,"foreign":"50600438","meta":null},
{"id":31075,"name":"Управление организационного развития, ко","order":42,"active":true,"parent":31069,"deep":3,"foreign":"50684964","meta":null},
{"id":31076,"name":"Управление по работе с персоналом","order":43,"active":true,"parent":31069,"deep":3,"foreign":"50600507","meta":null},
{"id":31077,"name":"Группа подбора","order":44,"active":true,"parent":31076,"deep":4,"foreign":"50686085","meta":null},
{"id":31078,"name":"Отдел по работе с плавсоставом МФ","order":45,"active":true,"parent":31076,"deep":4,"foreign":"50685873","meta":null},
{"id":31079,"name":"Отдел по работе с плавсоставом РФ","order":46,"active":true,"parent":31076,"deep":4,"foreign":"50686084","meta":null},
{"id":31080,"name":"ДИРЕКЦИЯ ПО ФИНАНСАМ И ЭКОНОМИКЕ","order":47,"active":true,"parent":31034,"deep":2,"foreign":"50600318","meta":null},
{"id":31081,"name":"Отдел страхования и претензий","order":48,"active":true,"parent":31080,"deep":3,"foreign":"50600432","meta":null},
{"id":31082,"name":"Планово-экономический отдел","order":49,"active":true,"parent":31080,"deep":3,"foreign":"50600445","meta":null},
{"id":31083,"name":"Финансовый отдел","order":50,"active":true,"parent":31080,"deep":3,"foreign":"50600517","meta":null},
{"id":31084,"name":"ДИРЕКЦИЯ ПО ЭКСПЛУАТАЦИИ","order":51,"active":true,"parent":31034,"deep":2,"foreign":"50644773","meta":null},
{"id":31085,"name":"Диспетчерская","order":52,"active":true,"parent":31084,"deep":3,"foreign":"50644801","meta":null},
{"id":31086,"name":"Отдел комплексного обслуживания","order":53,"active":true,"parent":31084,"deep":3,"foreign":"50653837","meta":null},
{"id":31087,"name":"Отдел по аналитике и учету","order":54,"active":true,"parent":31084,"deep":3,"foreign":"50644800","meta":null},
{"id":31088,"name":"Управление по эксп-ции мор. сух-го флота","order":55,"active":true,"parent":31084,"deep":3,"foreign":"50644804","meta":null},
{"id":31089,"name":"Управление по эксп-ции реч. сух-го флота","order":56,"active":true,"parent":31084,"deep":3,"foreign":"50644802","meta":null},
{"id":31090,"name":"Управление по экспл-ции наливного флота","order":57,"active":true,"parent":31084,"deep":3,"foreign":"50644774","meta":null},
{"id":31091,"name":"Дирекция по информационным технологиям","order":58,"active":true,"parent":31034,"deep":2,"foreign":"50653911","meta":null},
{"id":31092,"name":"Отдел внутреннего аудита и управления рисками","order":59,"active":true,"parent":31034,"deep":2,"foreign":"50654229","meta":null},
{"id":31093,"name":"Проектный офис","order":60,"active":true,"parent":31034,"deep":2,"foreign":"50734602","meta":null},
{"id":31094,"name":"Группа операционной эффективности","order":61,"active":true,"parent":31093,"deep":3,"foreign":"50736000","meta":null},
{"id":31095,"name":"РУКОВОДСТВО","order":62,"active":true,"parent":31034,"deep":2,"foreign":"50600458","meta":null},
{"id":31096,"name":"Специальный отдел","order":63,"active":true,"parent":31034,"deep":2,"foreign":"50600489","meta":null},
{"id":31097,"name":"ТЕХНИЧЕСКАЯ ДИРЕКЦИЯ","order":64,"active":true,"parent":31034,"deep":2,"foreign":"50600494","meta":null},
{"id":31098,"name":"Отдел нормирования и диагностики","order":65,"active":true,"parent":31097,"deep":3,"foreign":"50644564","meta":null},
{"id":31099,"name":"Отдел пожарной безопасности, экологии","order":66,"active":true,"parent":31097,"deep":3,"foreign":"50652974","meta":null},
{"id":31100,"name":"Отдел учета","order":67,"active":true,"parent":31097,"deep":3,"foreign":"50654256","meta":null},
{"id":31101,"name":"Техническое управление по МорСухФлоту","order":68,"active":true,"parent":31097,"deep":3,"foreign":"50600496","meta":null},
{"id":31102,"name":"Техническое управление по НаливномуФлоту","order":69,"active":true,"parent":31097,"deep":3,"foreign":"50641814","meta":null},
{"id":31103,"name":"Техническое управление по РечСухогрФлот","order":70,"active":true,"parent":31097,"deep":3,"foreign":"50600499","meta":null},
{"id":31104,"name":"Борская БТОФ","order":71,"active":true,"parent":31033,"deep":1,"foreign":"50600209","meta":null},
{"id":31105,"name":"Береговой производственный персонал","order":72,"active":true,"parent":31104,"deep":2,"foreign":"50600207","meta":null},
{"id":31106,"name":"Группа по эксплуатации жилого фонда","order":73,"active":true,"parent":31104,"deep":2,"foreign":"50600308","meta":null},
{"id":31107,"name":"Караванная служба","order":74,"active":true,"parent":31104,"deep":2,"foreign":"50600343","meta":null},
{"id":31108,"name":"Управление","order":75,"active":true,"parent":31104,"deep":2,"foreign":"50600502","meta":null},
{"id":31109,"name":"Волжская БТОФ","order":76,"active":true,"parent":31033,"deep":1,"foreign":"50600279","meta":null},
{"id":31110,"name":"БПУ","order":77,"active":true,"parent":31109,"deep":2,"foreign":"50600210","meta":null},
{"id":31111,"name":"Караванная служба по охране флота","order":78,"active":true,"parent":31109,"deep":2,"foreign":"50600344","meta":null},
{"id":31112,"name":"Управление","order":79,"active":true,"parent":31109,"deep":2,"foreign":"50600503","meta":null},
{"id":31113,"name":"ПАО \"Северо-Западное пароходство\"","order":80,"active":true,"parent":31033,"deep":1,"foreign":"50639056","meta":null}],
"meta":{"levels":5,"has_inactive":false}}'::JSON $$ LANGUAGE sql IMMUTABLE;



with jsdata as (
select some_query() as jscol
)
--select * from jsdata
,




json_elements as (
select json_array_elements(jscol->'items')::jsonb AS js1 from jsdata
)
--select * from json_elements
,




row_json as (
select
	js1 ->> 'id' as "id"
	, js1 ->> 'name' as "name"
	, js1 ->> 'order' as "order"
	, js1 ->> 'active' as "active"	
	, js1 ->> 'parent' as "parent"		
	, js1 ->> 'deep' as "deep"	
	, js1 ->> 'foreign' as "foreign"	
	, js1 ->> 'meta' as "meta"		
from json_elements
)
select * from row_json



select 
"id"::int as "id"
,  name::text as "name"
, "order"::int as "order"
, "active"::bool as "active"
, "parent"::int as "parent"
, "deep"::int as "deep"
, "foreign"::int as "foreign"
, "meta"::text as "meta"
into json_tbl
from  row_json;


select * from json_tbl;


drop table json_tbl;










