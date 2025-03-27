--liquibase formatted sql

--changeset Vladimir.Blazevic:1 labels:2025-03-30 context:DEV
--comment: Testing of CICD3
create or replace TABLE PUBLIC.TEST_TABLE_CICD3 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD3;

--changeset Vladimir.Blazevic:2 labels:2025-03-30 context:TEST
--comment: Testing of CICD3
create or replace TABLE PUBLIC.TEST_TABLE_CICD3 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD3;

--changeset vladimir.blazevic:3 labels:2025-03-30 context:DEV endDelimiter:/
--comment: Test Procedure3
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE3()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD3
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE3();

--changeset vladimir.blazevic:4 labels:2025-03-30 context:TEST endDelimiter:/
--comment: Test Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE3()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD3
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE3();