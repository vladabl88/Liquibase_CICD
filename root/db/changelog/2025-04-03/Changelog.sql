--liquibase formatted sql

--changeset Vladimir.Blazevic:1 labels:2025-04-01 context:DEV
--comment: Test comment for CICD5
create TABLE PUBLIC.TEST_TABLE_CICD5 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table CICD_DEV.PUBLIC.TEST_TABLE_CICD5;

--changeset Vladimir.Blazevic:2 labels:2025-04-01 context:TEST
--comment: Test comment for CICD5
create or replace TABLE PUBLIC.TEST_TABLE_CICD5 (
	TEST_COLUMN varchar(100),
	TEST_DATE DATETIME
);
--rollback drop table CICD_TEST.PUBLIC.TEST_TABLE_CICD5;

--changeset vladimir.blazevic:3 labels:2025-04-01 context:DEV endDelimiter:/
--comment: Test Test comment for CICD5 Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE5()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO PUBLIC.TEST_TABLE_CICD5
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE CICD_DEV.PUBLIC.TEST_PROCEDURE5();

--changeset vladimir.blazevic:4 labels:2025-04-01 context:TEST endDelimiter:/
--comment: Test Test comment for CICD5 Procedure
CREATE OR REPLACE PROCEDURE PUBLIC.TEST_PROCEDURE5()
RETURNS varchar
LANGUAGE SQL
AS
$$
INSERT INTO PUBLIC.TEST_TABLE_CICD5
SELECT 'Hello CICD', CURRENT_TIMESTAMP(2);
$$
;
/

--rollback DROP PROCEDURE CICD_TEST.PUBLIC.TEST_PROCEDURE5();

--changeset Vladimir.Blazevic:5 labels:2025-04-01 context:DEV
--comment: Testing of CICD4
ALTER TABLE PUBLIC.TEST_TABLE_CICD4 ADD COLUMN TEST_COLUMN3 VARCHAR(300);
--rollback ALTER TABLE CICD_DEV.PUBLIC.TEST_TABLE_CICD4 DROP COLUMN TEST_COLUMN3;

--changeset Vladimir.Blazevic:6 labels:2025-04-01 context:TEST
--comment: Testing of CICD4
ALTER TABLE PUBLIC.TEST_TABLE_CICD4 ADD COLUMN TEST_COLUMN3 VARCHAR(300);
--rollback ALTER TABLE CICD_TEST.PUBLIC.TEST_TABLE_CICD4 DROP COLUMN TEST_COLUMN3;

--changeset Vladimir.Blazevic:7 labels:2025-04-01 context:DEV
--comment: Testing of Data insert through CI/CD process
Insert into PUBLIC.TEST_TABLE_CICD5
SELECT 'Testing of Data insert through CI/CD process', CURRENT_TIMESTAMP(2);
--rollback DELETE FROM CICD_DEV.PUBLIC.TEST_TABLE_CICD5 WHERE TEST_COLUMN='Testing of Data insert through CI/CD process';

--changeset Vladimir.Blazevic:8 labels:2025-04-01 context:TEST
--comment: Testing of Data insert through CI/CD process
Insert into PUBLIC.TEST_TABLE_CICD5
SELECT 'Testing of Data insert through CI/CD process', CURRENT_TIMESTAMP(2);
--rollback DELETE FROM CICD_TEST.PUBLIC.TEST_TABLE_CICD5 WHERE TEST_COLUMN='Testing of Data insert through CI/CD process';

