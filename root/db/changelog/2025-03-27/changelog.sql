--liquibase formatted sql

--changeset Vladimir.Blazevic:1 labels:2025-03-27 context:DEV
--comment: Testing of CICD2
create or replace TABLE PUBLIC.TEST_TABLE_CICD2 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD2;

--changeset Vladimir.Blazevic:2 labels:2025-03-27 context:TEST
--comment: Testing of CICD2
create or replace TABLE PUBLIC.TEST_TABLE_CICD2 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD2;

--changeset vladimir.blazevic:3 labels:2025-03-27 context:DEV endDelimiter:/
--comment: Test Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE2()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD2
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE()2;

--changeset vladimir.blazevic:4 labels:2025-03-27 context:TEST endDelimiter:/
--comment: Test Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE2()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD2
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE()2;