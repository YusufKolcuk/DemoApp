\echo ========================= Creating Tables ==============================
SET SEARCH_PATH TO demoapp;

CREATE TABLE cities (
    id				bigint NOT NULL UNIQUE,
    name			character varying(255),
    temp			double precision,
    tempmin			double precision,
    tempmax			double precision,
    pressure		double precision,
    humidity		double precision,
    descr			character varying(255),
    lat				double precision,
    lon				double precision
);
ALTER TABLE cities OWNER TO :usr;



CREATE TABLE users (
    id	            BIGSERIAL,
    active        	boolean,
    create_date     timestamp without time zone,
    email      		character varying(255),
	keyreg			character varying(255),
	name			character varying(255),
	pass			character varying(255),
	surname			character varying(255),
	username		character varying(255)
);
ALTER TABLE users OWNER TO :usr;


CREATE TABLE roles (
    id	            bigint NOT NULL,
	name			character varying(255)
);
ALTER TABLE roles OWNER TO :usr;

CREATE TABLE user_roles (
    usr_id	        bigint,
	role_id			bigint
);