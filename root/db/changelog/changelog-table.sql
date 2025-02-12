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

--changeset Vladimir.Blazevic:4 labels:TEST context:Testing of update to tag sql tag:version_1.0
--comment: example comment
alter table SASDEV.SANDBOX.TEST_TABLE_CICD add column country varchar(2);
--rollback ALTER TABLE SASDEV.SANDBOX.TEST_TABLE_CICD DROP COLUMN country;

--changeset Vladimir.Blazevic:5 labels:TEST tagDatabase:testtag
--comment: Testing of update to tag sql
alter table SASDEV.SANDBOX.TEST_TABLE_CICD drop column country;
--rollback ALTER TABLE SASDEV.SANDBOX.TEST_TABLE_CICD DROP COLUMN country;

--changeset Vladimir.Blazevic:6 labels:TEST tagDatabase:testtag
--comment: Testing of update to tag sql
alter table SASDEV.SANDBOX.TEST_TABLE_CICD add column country varchar(2);
--rollback ALTER TABLE SASDEV.SANDBOX.TEST_TABLE_CICD DROP COLUMN country;

--changeset liquibase-docs:tagDatabase-example
--tagDatabase: 'version_1.3'
