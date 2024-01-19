-- ***************************************************************
-- * File Name:                  dbs_concept.sql                 *
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
--spool dbs_concept.log

-- ***************************************************************
-- * Clear Database Section

DROP TABLE dbs_tab_anschrift 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_fachbereich 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_gebaeude 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_hochschulangehoeriger 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_lv_ort 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_mitarbeiter 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_lehrveranstaltung 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_prof_haelt_lv 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_professor 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_student 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_vorname 
	CASCADE CONSTRAINTS
;
DROP TABLE dbs_tab_pruefung 
	CASCADE CONSTRAINTS
;

-- ***************************************************************
-- * Table Section

CREATE TABLE dbs_tab_anschrift
    ( ho_nr 		NUMERIC(4)
    , an_nr 		NUMERIC(1)
    , plz       	NUMERIC(5)
    , ort			VARCHAR(30)
    , strasse		VARCHAR(30)
    , haus_nr		CHAR(5)
	)
;
CREATE TABLE dbs_tab_fachbereich
    ( fb_nr 		CHAR(1)
    , fb_name		VARCHAR(30)
    , dekan 		CHAR(10)
    )
;
CREATE TABLE dbs_tab_gebaeude
    ( gebaeude		CHAR(1)
    , strasse		VARCHAR(30)
    , haus_nr		CHAR(5)
    )
;
CREATE TABLE dbs_tab_hochschulangehoeriger
    ( ho_nr			NUMERIC(4)
    , ho_name		VARCHAR(30)
    )
;
CREATE TABLE dbs_tab_lv_ort 
    ( lv_nr			NUMERIC(5)
    , tag			CHAR(2)
    , zeit			CHAR(5)
    , gebaeude		CHAR(1)
    , raum			CHAR(5)
    )
;
CREATE TABLE dbs_tab_mitarbeiter
    ( pers_Nr		CHAR(10)
    , ho_nr			NUMERIC(4)
    , fb_nr			CHAR(1)
    , institution	VARCHAR(30)
    , beruf			VARCHAR(30)
    , gehalt		NUMERIC(6,2)
	, chef_nr		CHAR(10)
    )
;
CREATE TABLE dbs_tab_lehrveranstaltung 
    ( lv_nr			NUMERIC(5)
    , lv_name		VARCHAR(30)
    , fb_Nr			CHAR(1)
    )
;
CREATE TABLE dbs_tab_prof_haelt_lv 
    ( pers_nr		CHAR(10)
    , lv_nr			NUMERIC(5)
    , tag			CHAR(2)
    , zeit			CHAR(5)
    )
;
CREATE TABLE dbs_tab_professor 
    ( titel			VARCHAR(15)
    , pers_nr		CHAR(10)
    , fachgebiet	VARCHAR(30)
    )
;
CREATE TABLE dbs_tab_student 
    ( ho_nr			NUMERIC(4)
    , pers_Nr		CHAR(10)
    , matr_Nr		NUMERIC(10)
    , fb_nr			CHAR(1)
    )
;
CREATE TABLE dbs_tab_vorname 
    ( ho_nr			NUMERIC(4)
    , vo_Nr			NUMERIC(2)
    , vorname		VARCHAR(20)
    )
;
CREATE TABLE dbs_tab_pruefung 
    ( matr_Nr 		NUMERIC(10)
    , lv_nr 		NUMERIC(5)
    , professor		CHAR(10)
    , versuch		NUMERIC(1)
    , datum			DATE
    , note			NUMERIC(2,1)
    )
;

-- ***************************************************************
-- * NOT NULL Constraint Section

ALTER TABLE dbs_tab_anschrift 
	ADD CONSTRAINT dbs_nn_anschrift_plz
	CHECK (plz IS NOT NULL)
;
ALTER TABLE dbs_tab_anschrift 
	ADD CONSTRAINT dbs_nn_anschrift_ort
	CHECK (ort IS NOT NULL)
;
ALTER TABLE dbs_tab_anschrift 
	ADD CONSTRAINT dbs_nn_anschrift_strasse
	CHECK (strasse IS NOT NULL)
;
ALTER TABLE dbs_tab_fachbereich 
	ADD CONSTRAINT dbs_nn_fachbereich_dekan
	CHECK (dekan IS NOT NULL)
;
ALTER TABLE dbs_tab_fachbereich 
	ADD CONSTRAINT dbs_nn_fb_name
	CHECK (fb_name IS NOT NULL)
;
ALTER TABLE dbs_tab_gebaeude 
	ADD CONSTRAINT dbs_nn_gebaeude_strasse
	CHECK (strasse IS NOT NULL)
;
ALTER TABLE dbs_tab_hochschulangehoeriger 
	ADD CONSTRAINT dbs_nn_hochschulang_ho_name
	CHECK (ho_name IS NOT NULL)
;
ALTER TABLE dbs_tab_mitarbeiter 
	ADD CONSTRAINT dbs_nn_mitarbeiter_institution
	CHECK (institution IS NOT NULL)
;
ALTER TABLE dbs_tab_mitarbeiter 
	ADD CONSTRAINT dbs_nn_mitarbeiter_beruf
	CHECK (beruf IS NOT NULL)
;
ALTER TABLE dbs_tab_mitarbeiter 
	ADD CONSTRAINT dbs_nn_mitarbeiter_gehalt
	CHECK (gehalt IS NOT NULL)
;
ALTER TABLE dbs_tab_lehrveranstaltung 
	ADD CONSTRAINT dbs_nn_lehrveranst_lv_name
	CHECK (lv_name IS NOT NULL)
;
ALTER TABLE dbs_tab_lehrveranstaltung 
	ADD CONSTRAINT dbs_nn_lehrveranstaltung_fb_nr
	CHECK (fb_nr IS NOT NULL)
;
ALTER TABLE dbs_tab_professor 
	ADD CONSTRAINT dbs_nn_professor_titel
	CHECK (titel IS NOT NULL)
;
ALTER TABLE dbs_tab_professor 
	ADD CONSTRAINT dbs_nn_professor_fachgebiet
	CHECK (fachgebiet IS NOT NULL)
;
ALTER TABLE dbs_tab_student 
	ADD CONSTRAINT dbs_nn_student_ho_nr
	CHECK (ho_nr IS NOT NULL)
;
ALTER TABLE dbs_tab_student 
	ADD CONSTRAINT dbs_nn_student_fb_nr
	CHECK (fb_nr IS NOT NULL)
;
ALTER TABLE dbs_tab_vorname 
	ADD CONSTRAINT dbs_nn_vorname_vorname
	CHECK (vorname IS NOT NULL)
;

-- ***************************************************************
-- * Primary Key Constraint Section

ALTER TABLE dbs_tab_anschrift 
	ADD CONSTRAINT dbs_pk_anschrift 
	PRIMARY KEY (ho_nr, an_nr)
;
ALTER TABLE dbs_tab_fachbereich 
	ADD CONSTRAINT dbs_pk_fachbereich 
	PRIMARY KEY (fb_nr)
;
ALTER TABLE dbs_tab_gebaeude 
	ADD CONSTRAINT dbs_pk_gebaeude 
	PRIMARY KEY (gebaeude)
;
ALTER TABLE dbs_tab_hochschulangehoeriger 
	ADD CONSTRAINT dbs_pk_hochschulangehoeriger 
	PRIMARY KEY (ho_nr)
;
ALTER TABLE dbs_tab_lv_ort 
	ADD CONSTRAINT dbs_pk_lv_ort_ID 
	PRIMARY KEY (lv_nr, tag, zeit)
;
ALTER TABLE dbs_tab_mitarbeiter 
	ADD CONSTRAINT dbs_pk_mitarbeiter 
	PRIMARY KEY (pers_Nr)
;
ALTER TABLE dbs_tab_lehrveranstaltung 
	ADD CONSTRAINT dbs_pk_lehrveranstaltung 
	PRIMARY KEY (lv_nr)
;
ALTER TABLE dbs_tab_prof_haelt_lv 
	ADD CONSTRAINT dbs_pk_prof_haelt_lv 
	PRIMARY KEY (pers_Nr, lv_nr, tag, zeit)
;
ALTER TABLE dbs_tab_professor 
	ADD CONSTRAINT dbs_pk_professor 
	PRIMARY KEY (pers_Nr)
;
ALTER TABLE dbs_tab_student 
	ADD CONSTRAINT dbs_pk_student 
	PRIMARY KEY (matr_Nr)
;
ALTER TABLE dbs_tab_vorname 
	ADD CONSTRAINT dbs_pk_vorname 
	PRIMARY KEY (ho_nr, vo_Nr)
;
ALTER TABLE dbs_tab_pruefung 
	ADD CONSTRAINT dbs_pk_pruefung 
	PRIMARY KEY (matr_Nr, lv_nr, professor, versuch)
;

-- ***************************************************************
-- * Unique Key Constraint Section

ALTER TABLE dbs_tab_student 
	ADD CONSTRAINT dbs_uk_student_pers 
	UNIQUE (pers_nr)
;
ALTER TABLE dbs_tab_student 
	ADD CONSTRAINT dbs_uk_student_ho 
	UNIQUE (ho_nr)
;
ALTER TABLE dbs_tab_mitarbeiter 
	ADD CONSTRAINT dbs_uk_mitarbeiter_ho 
	UNIQUE (ho_nr)
;

-- ***************************************************************
-- * Foreign Key Constraint Section

ALTER TABLE dbs_tab_anschrift 
  ADD CONSTRAINT dbs_fk_anschrift_hochschulang
  FOREIGN KEY (ho_nr)
  REFERENCES dbs_tab_hochschulangehoeriger
;
ALTER TABLE dbs_tab_fachbereich 
  ADD CONSTRAINT dbs_fk_fachbereich_mitarbeiter
  FOREIGN KEY (dekan)
  REFERENCES dbs_tab_professor
;
ALTER TABLE dbs_tab_lv_ort 
  ADD CONSTRAINT dbs_fk_lv_ort_gebaeude
  FOREIGN KEY (gebaeude)
  REFERENCES dbs_tab_gebaeude
;
ALTER TABLE dbs_tab_lv_ort 
  ADD CONSTRAINT dbs_fk_lv_ort_lehrveranst
  FOREIGN KEY (lv_nr)
  REFERENCES dbs_tab_lehrveranstaltung
;
ALTER TABLE dbs_tab_mitarbeiter 
  ADD CONSTRAINT dbs_fk_mirarbeiter_fachbereich
  FOREIGN KEY (fb_Nr)
  REFERENCES dbs_tab_fachbereich
;
ALTER TABLE dbs_tab_mitarbeiter 
  ADD CONSTRAINT dbs_fk_mitarb_hochschulang
  FOREIGN KEY (ho_nr)
  REFERENCES dbs_tab_hochschulangehoeriger
;
ALTER TABLE dbs_tab_mitarbeiter 
  ADD CONSTRAINT dbs_fk_mitarbeiter_mitarbeiter
  FOREIGN KEY (chef_nr)
  REFERENCES dbs_tab_mitarbeiter
;
ALTER TABLE dbs_tab_lehrveranstaltung 
  ADD CONSTRAINT dbs_fk_lehrveranst_fachbereich
  FOREIGN KEY (fb_nr)
  REFERENCES dbs_tab_fachbereich
;
ALTER TABLE dbs_tab_prof_haelt_lv 
  ADD CONSTRAINT dbs_fk_prof_haelt_lv_professor
  FOREIGN KEY (pers_nr)
  REFERENCES dbs_tab_professor
;
ALTER TABLE dbs_tab_prof_haelt_lv 
  ADD CONSTRAINT dbs_fk_prof_haelt_lv_lv_ort
  FOREIGN KEY (lv_nr, tag, zeit)
  REFERENCES dbs_tab_lv_ort
;
ALTER TABLE dbs_tab_professor 
  ADD CONSTRAINT dbs_fk_professor_mitarbeiter
  FOREIGN KEY (pers_Nr)
  REFERENCES dbs_tab_mitarbeiter
;
ALTER TABLE dbs_tab_student 
  ADD CONSTRAINT dbs_fk_student_hochschulang
  FOREIGN KEY (ho_nr)
  REFERENCES dbs_tab_hochschulangehoeriger
;
ALTER TABLE dbs_tab_student 
  ADD CONSTRAINT dbs_fk_student_mitarbeiter
  FOREIGN KEY (pers_Nr)
  REFERENCES dbs_tab_mitarbeiter
;
ALTER TABLE dbs_tab_student 
  ADD CONSTRAINT dbs_fk_student_fachbereich
  FOREIGN KEY (fb_nr)
  REFERENCES dbs_tab_fachbereich
;
ALTER TABLE dbs_tab_vorname 
  ADD CONSTRAINT dbs_fk_vorname_hochschulang
  FOREIGN KEY (ho_nr)
  REFERENCES dbs_tab_hochschulangehoeriger
;
ALTER TABLE dbs_tab_pruefung 
  ADD CONSTRAINT dbs_fk_pruefung_lehrveranst
  FOREIGN KEY (lv_nr)
  REFERENCES dbs_tab_lehrveranstaltung
;
ALTER TABLE dbs_tab_pruefung 
  ADD CONSTRAINT dbs_fk_pruefung_professor
  FOREIGN KEY (professor)
  REFERENCES dbs_tab_professor
;
ALTER TABLE dbs_tab_pruefung 
  ADD CONSTRAINT dbs_fk_pruefung_student
  FOREIGN KEY (matr_NR)
  REFERENCES dbs_tab_student
;


-- ***************************************************************
-- * Integrity Check Constraint Section

-- things to do ... something like this 
-- ... but subqueries are not allowed here:

-- ALTER TABLE dbs_tab_fachbereich 
-- 	 ADD CONSTRAINT dbs_chk_mitarbeiter
--   CHECK	( EXISTS	( SELECT * 
-- 						  FROM dbs_tab_mitarbeiter
-- 						  WHERE dbs_tab_mitarbeiter.fb_Nr = fb_nr
-- 						)
-- 			)
-- ; 
-- ALTER TABLE dbs_tab_hochschulangehoeriger 
-- 	 ADD CONSTRAINT dbs_chk_vorname
--   CHECK	(	EXISTS	( SELECT * 
-- 						  FROM dbs_tab_vorname
-- 						  WHERE dbs_tab_vorname.ho_nr = ho_nr
-- 						)
-- 			)
-- ; 
-- ALTER TABLE dbs_tab_hochschulangehoeriger 
--   ADD CONSTRAINT dbs_chk_anschrit
--   CHECK	( EXISTS	( SELECT * 
-- 						  FROM dbs_tab_anschrift
-- 						  WHERE dbs_tab_anschrift.ho_nr = ho_nr
-- 						)
-- 			)
-- ; 
-- 
-- ***************************************************************
-- * SQL*plus Job Control Section

--spool off