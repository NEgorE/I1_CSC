-- Table: HF.all_vacancies

DROP TABLE IF EXISTS "HF".all_vacancies;

CREATE TABLE IF NOT EXISTS "HF".all_vacancies
(
    id integer,
    money text COLLATE pg_catalog."default",
    state text COLLATE pg_catalog."default",
    hidden boolean,
    parent text COLLATE pg_catalog."default",
    company text COLLATE pg_catalog."default",
    created timestamp without time zone,
    multiple boolean,
    "position" text COLLATE pg_catalog."default",
    priority integer,
    account_region text COLLATE pg_catalog."default",
    account_division integer,
    additional_fields_list jsonb,
    account_vacancy_status_group text COLLATE pg_catalog."default"
)
;