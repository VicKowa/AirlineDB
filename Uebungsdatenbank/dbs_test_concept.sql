-- ***************************************************************
-- * File Name:                  dbs_test_concept.sql            *
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
--spool dbs_test_concept.log


DESCRIBE user_tables;

SELECT table_name 
	FROM user_tables
	WHERE table_name LIKE 'DBS_TAB%'
;

DESCRIBE dbs_tab_ANSCHRIFT;
DESCRIBE dbs_tab_FACHBEREICH;
DESCRIBE dbs_tab_GEBAEUDE;
DESCRIBE dbs_tab_HOCHSCHULANGEHOERIGER;
DESCRIBE dbs_tab_LV_ORT;
DESCRIBE dbs_tab_MITARBEITER;
DESCRIBE dbs_tab_LEHRVERANSTALTUNG;
DESCRIBE dbs_tab_PROF_HAELT_LV;
DESCRIBE dbs_tab_PROFESSOR;
DESCRIBE dbs_tab_STUDENT;
DESCRIBE dbs_tab_VORNAME;
DESCRIBE dbs_tab_PRUEFUNG;

-- ***************************************************************
-- * SQL*plus Job Control Section

--spool off