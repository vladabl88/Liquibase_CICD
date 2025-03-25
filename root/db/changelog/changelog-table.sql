--liquibase formatted sql

--changeset Vladimir.Blazevic:1 labels:DEV context:example-context
create or replace TABLE PUBLIC.TEST_TABLE_CICD (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD;

--changeset Vladimir.Blazevic:2 labels:TEST context:Testing CICD
create or replace TABLE PUBLIC.TEST_TABLE_CICD (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD;

