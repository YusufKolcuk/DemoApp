\echo ========================= Creating Tables ==============================

CREATE TABLE cities (
    bgjob_id             bigint NOT NULL,
    param_pos            bigint NOT NULL,
    param_name           character varying(4000) NOT NULL,
    param_value          character varying(4000)
);
ALTER TABLE bgjob_param OWNER TO :usr;



CREATE TABLE usertable (
    bgjob_id             bigint NOT NULL,
    param_pos            bigint NOT NULL,
    param_name           character varying(4000) NOT NULL,
    param_value          character varying(4000)
);
ALTER TABLE bgjob_param OWNER TO :usr;