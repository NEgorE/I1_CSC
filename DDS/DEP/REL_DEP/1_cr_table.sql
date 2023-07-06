-- Table: dep.rel_dep

DROP TABLE IF EXISTS dep.rel_dep;

CREATE TABLE IF NOT EXISTS dep.rel_dep
(
    dep_id integer,
    rel_dep_id integer,
    rel_startdate date,
    rel_enddate date
)