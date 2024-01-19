-- ***************************************************************
-- * File Name:                  dbs_test_data.sql               *
-- * File Creator:               Knolle                          *
-- * Revision:                                                   *
-- * LastDate:                   5.12.2022                       *
-- *                                                             *
-- * <ChangeLogDate>             <ChangeLogText>                 *
-- ***************************************************************

-- ***************************************************************
-- * SQL*plus Job Control Section

set echo on
set linesize 256
set pagesize 50
--spool dbs_test_data.log

SELECT * FROM dbs_tab_ANSCHRIFT;
SELECT * FROM dbs_tab_FACHBEREICH;
SELECT * FROM dbs_tab_GEBAEUDE;
SELECT * FROM dbs_tab_HOCHSCHULANGEHOERIGER;
SELECT * FROM dbs_tab_LV_ORT;
SELECT * FROM dbs_tab_MITARBEITER;
SELECT * FROM dbs_tab_LEHRVERANSTALTUNG;
SELECT * FROM dbs_tab_PROF_HAELT_LV;
SELECT * FROM dbs_tab_PROFESSOR;
SELECT * FROM dbs_tab_STUDENT;
SELECT * FROM dbs_tab_VORNAME;
SELECT * FROM dbs_tab_PRUEFUNG;

-- ***************************************************************
-- * SQL*plus Job Control Section

--spool off