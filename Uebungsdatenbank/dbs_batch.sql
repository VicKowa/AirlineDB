-- ***************************************************************
-- * File Name:                  dbs_batch.sql                   *
-- * File Creator:               Knolle                          *
-- * Revision:                                                   *
-- * LastDate:                   5.12.2022                       *
-- *                                                             *
-- * <ChangeLogDate>             <ChangeLogText>                 *
-- ***************************************************************

-- ***************************************************************
-- * SQL*plus Job Control Section

set echo on
set linesize 80
set pagesize 50
spool ./dbs_batch.log

-- Conceptual Section 
-- _________________________________

start ./dbs_concept.sql


-- Test Conceptual Section 
-- _________________________________

start ./dbs_test_concept.sql


-- Internal Section 
-- _________________________________

start ./dbs_intern.sql


-- Data Section 
-- _________________________________

start ./dbs_data.sql


-- Test Data Section 
-- _________________________________

start ./dbs_test_data.sql

-- ***************************************************************
-- * SQL*plus Job Control Section

spool off
