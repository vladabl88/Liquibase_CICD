--liquibase formatted sql

--changeset vladimir.blazevic:1 labels:DEV context:example-context endDelimiter:/
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