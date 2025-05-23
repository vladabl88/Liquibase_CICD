--liquibase formatted sql

--changeset Vladimir.Blazevic:1 labels:2025-03-21 context:DEV
--comment: Testing of CICD
create or replace TABLE PUBLIC.TEST_TABLE_CICD (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD;

--changeset Vladimir.Blazevic:2 labels:2025-03-21 context:TEST
--comment: Testing of CICD
create or replace TABLE PUBLIC.TEST_TABLE_CICD (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD;

--changeset vladimir.blazevic:3 labels:2025-03-21 context:DEV endDelimiter:/
--comment: Test Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE();

--changeset vladimir.blazevic:4 labels:2025-03-21 context:TEST endDelimiter:/
--comment: Test Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE();