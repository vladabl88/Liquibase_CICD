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
--rollback drop table SASDEV.SANDBOX.TEST_TABLE_CICD

--changeset Vladimir.Blazevic:4 labels:TEST context:New_function
--comment: We are testing github actions
alter table SASDEV.SANDBOX.TEST_TABLE_CICD add column country varchar(2);
--rollback ALTER TABLE SASDEV.SANDBOX.TEST_TABLE_CICD DROP COLUMN country;

--changeset Vladimir.Blazevic:5 labels:TEST
--comment: Testing of update to tag sql
alter table SASDEV.SANDBOX.TEST_TABLE_CICD drop column country;
--rollback ALTER TABLE SASDEV.SANDBOX.TEST_TABLE_CICD add COLUMN country varchar(2);

--changeset Vladimir.Blazevic:6 labels:PROD context:New_function_2
--comment: Testing of update to tag sql
alter table SASDEV.SANDBOX.TEST_TABLE_CICD add column country varchar(2);
--rollback ALTER TABLE SASDEV.SANDBOX.TEST_TABLE_CICD DROP COLUMN country;

--changeset Vladimir.Blazevic:7 labels:PROD context:New_function_3
--comment: Testing of update to tag sql
drop table SASDEV.SANDBOX.TEST_TABLE_CICD;

--changeset Vladimir.Blazevic:7 labels:PROD context:New_function_3
--comment: Testing of update to tag sql
create or replace TABLE SASDEV.SANDBOX.TEST_TABLE_CICD (
	TEST_COLUMN varchar(),
    input_time datetime,
	country varchar(2)
);
--rollback drop table SASDEV.SANDBOX.TEST_TABLE_CICD