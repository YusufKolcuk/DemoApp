\echo ========================= Creating Tables ==============================
SET SEARCH_PATH TO demoapp;

CREATE TABLE cities (
    id				bigint NOT NULL,
    name			character varying(255),
    temp			double precision,
    tempmin			double precision,
    tempmax			double precision,
    pressure		double precision,
    humidity		double precision,
    key				bigint,
    descr			character varying(255),
    lat				double precision,
    lon				double precision
);
ALTER TABLE cities OWNER TO :usr;



CREATE TABLE usertable (
    id	            bigint NOT NULL,
    active        	boolean,
    create_date     timestamp without time zone,
    email      		character varying(255),
	keyreg			character varying(255),
	name			character varying(255),
	pass			character varying(255),
	surname			character varying(255),
	username		character varying(255)
);
ALTER TABLE usertable OWNER TO :usr;