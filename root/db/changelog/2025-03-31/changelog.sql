--liquibase formatted sql

--changeset Vladimir.Blazevic:1 labels:2025-03-31 context:DEV
--comment: Testing of CICD4
create TABLE PUBLIC.TEST_TABLE_CICD4 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD4;

--changeset Vladimir.Blazevic:2 labels:2025-03-31 context:TEST
--comment: Testing of CICD3
create or replace TABLE PUBLIC.TEST_TABLE_CICD4 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table PUBLIC.TEST_TABLE_CICD4;

--changeset vladimir.blazevic:3 labels:2025-03-31 context:DEV endDelimiter:/
--comment: Test Procedure3
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE4()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD4
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE4();

--changeset vladimir.blazevic:4 labels:2025-03-31 context:TEST endDelimiter:/
--comment: Test Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE4()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO TEST_TABLE_CICD4
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE PUBLIC.TEST_PROCEDURE4();

--changeset Vladimir.Blazevic:5 labels:2025-03-31 context:DEV
--comment: Testing of CICD4
ALTER TABLE PUBLIC.TEST_TABLE_CICD4 ADD COLUMN TEST_COLUMN2 VARCHAR(300);
--rollback ALTER TABLE PUBLIC.TEST_TABLE_CICD4 DROP COLUMN TEST_COLUMN2;

--changeset Vladimir.Blazevic:6 labels:2025-03-31 context:TEST
--comment: Testing of CICD4
ALTER TABLE PUBLIC.TEST_TABLE_CICD4 ADD COLUMN TEST_COLUMN2 VARCHAR(300);
--rollback ALTER TABLE PUBLIC.TEST_TABLE_CICD4 DROP COLUMN TEST_COLUMN2;