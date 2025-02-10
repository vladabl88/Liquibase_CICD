--liquibase formatted sql

--changeset Vladimir.Blazevic:1
create or replace TABLE SASDEV.SANDBOX.TEST_TABLE_CICD (
	TEST_COLUMN VARIANT
);

--changeset Vladimir.Blazevic:2
create or replace TABLE SASDEV.SANDBOX.TEST_TABLE_CICD (
	TEST_COLUMN varchar(),
    input_time datetime
);

