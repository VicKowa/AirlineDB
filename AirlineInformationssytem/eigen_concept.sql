-- ***************************************************************
-- * File Name:                  eigen_concept.sql               *
-- * File Creator:               Victor Kowalewski                      *
-- * CreationDate:               <Datum>                         *
-- ***************************************************************
--
-- *** Bitte verwenden Sie als Zeichenkodierung immer UTF-8    ***
--
-- ***************************************************************
-- * Datenbanksysteme WS 2023
-- * Übung 5
--
-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

set echo on
set linesize 80
set pagesize 50
spool ./eigen_concept.log

-- Kommentieren Sie die folgende Zeile ein, falls Sie möchten, dass der SQL-Developer beim ersten Fehler abbricht:
whenever sqlerror exit sql.sqlcode

-- </sqlplus>

-- ***************************************************************
-- * Clear Database Section
--
-- <clear>

DROP TABLE ais_tab_flugzeug CASCADE CONSTRAINTS;
DROP TABLE ais_tab_flug CASCADE CONSTRAINTS;
DROP TABLE ais_tab_fluglizenz CASCADE CONSTRAINTS;
DROP TABLE ais_tab_personal CASCADE CONSTRAINTS;
DROP TABLE ais_tab_pilot CASCADE CONSTRAINTS;
DROP TABLE ais_tab_duerfen_fliegen CASCADE CONSTRAINTS;
DROP TABLE ais_tab_zertifikat CASCADE CONSTRAINTS;

-- </clear>

-- ***************************************************************
-- * Table Section
--
-- <table>

CREATE TABLE ais_tab_personal (
 Personal_ID numeric(4),
 Nachname varchar(30),
 Status numeric(1),
 Geburtsdatum date,
 Adr_Strasse char(30),
 Adr_Hausnummer numeric(3),
 Adr_PLZ char(5),
 Adr_Ort char(20),
 Email char(30),
 Telefon numeric(11)

);

CREATE TABLE ais_tab_flug (
    Pilot_ID numeric(4),
    Copilot_ID numeric(4),
    Flugzeug_ID numeric(3),
    Flug_ID numeric(4),
    FlugNR char(5),
    VON char(3),
    ZU char(3),
    Abflug date,
    Ankunft date
);

CREATE TABlE ais_tab_fluglizenz (
    Personal_ID numeric(4),
    FL_ID numeric(1),
    lizenz varchar(100)
);

CREATE TABLE ais_tab_pilot (
    Personal_ID numeric(4),
    Flugstunden numeric(5)
);

CREATE TABLE ais_tab_flugzeug (
    Flugzeug_ID numeric(3),
    Zertifikat_ID numeric(3),
    Kennzeichen char(6),
    Typ char(20),
    Sitzplaetze numeric(3),
    War_Beschreibung char(200),
    War_Notwendig numeric(1)
);

CREATE TABLE ais_tab_duerfen_fliegen (
    Personal_ID numeric(4),
    Flugzeug_ID numeric(3)
);

CREATE TABLE ais_tab_zertifikat (
    Zertifikat_ID numeric(3),
    Zertifikatsname char(80),
    Gueltigkeitsdauer date
);

-- </table>

-- ***************************************************************
-- * NOT NULL Constraint Section
--
-- <notnull>

ALTER TABLE ais_tab_personal
 ADD CONSTRAINT ais_nn_personal_nachname
 CHECK (Nachname IS NOT NULL);
 
ALTER TABLE ais_tab_personal 
 ADD CONSTRAINT ais_nn_personal_status
 CHECK (Status IS NOT NULL);
 
ALTER TABLE ais_tab_personal
 ADD CONSTRAINT ais_nn_personal_geburtsdatum
 CHECK (Geburtsdatum IS NOT NULL);
 
ALTER TABLE ais_tab_personal
 ADD CONSTRAINT ais_nn_personal_adr_strasse
 CHECK (Adr_Strasse IS NOT NULL);
 
ALTER TABLE ais_tab_personal 
 ADD CONSTRAINT ais_nn_personal_adr_plz
 CHECK (Adr_PLZ IS NOT NULL);
 
ALTER TABLE ais_tab_personal 
 ADD CONSTRAINT ais_nn_personal_adr_ort
 CHECK (Adr_Ort IS NOT NULL);
 
ALTER TABLE ais_tab_personal 
 ADD CONSTRAINT ais_nn_personal_adr_hnr
 CHECK (Adr_Hausnummer IS NOT NULL);
 
ALTER TABLE ais_tab_personal 
 ADD CONSTRAINT ais_nn_personal_email
 CHECK (Email IS NOT NULL);
 
ALTER TABLE ais_tab_personal 
 ADD CONSTRAINT ais_nn_personal_telefon
 CHECK (Telefon IS NOT NULL);
 
 

ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_flugnr
 CHECK (FlugNr IS NOT NULL);

ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_von
 CHECK (VON IS NOT NULL); 
 
ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_zu
 CHECK (ZU IS NOT NULL);
 
ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_abflug
 CHECK (Abflug IS NOT NULL); 
 
ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_ankunft
 CHECK (Ankunft IS NOT NULL);
 
ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_pilotid
 CHECK (Pilot_ID IS NOT NULL);
 
ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_copilotid
 CHECK (Copilot_ID IS NOT NULL);

ALTER TABLE ais_tab_flug 
 ADD CONSTRAINT ais_nn_flug_flugzeugid
 CHECK (Flugzeug_ID IS NOT NULL);
 
 
 
ALTER TABLE ais_tab_fluglizenz 
 ADD CONSTRAINT ais_nn_fluglizenz_lizenz
 CHECK (lizenz IS NOT NULL);
 
 
 

ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_nn_flugzeug_kennzeichen
 CHECK (Kennzeichen IS NOT NULL);

ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_nn_flugzeug_typ
 CHECK (Typ IS NOT NULL);
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_nn_flugzeug_sitzplaetze
 CHECK (Sitzplaetze IS NOT NULL);
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_nn_flugzeug_war_beschrei
 CHECK (War_Beschreibung IS NOT NULL);
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_nn_flugzeug_war_notwendig
 CHECK (War_Notwendig IS NOT NULL);
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_nn_flugzeug_zertifikatid
 CHECK (Zertifikat_ID IS NOT NULL);



ALTER TABLE ais_tab_pilot
 ADD CONSTRAINT ais_nn_pilot_flugstunden
 CHECK (Flugstunden IS NOT NULL);



ALTER TABLE ais_tab_zertifikat
 ADD CONSTRAINT ais_nn_zertifikat_zertname
 CHECK (Zertifikatsname IS NOT NULL);

ALTER TABLE ais_tab_zertifikat
 ADD CONSTRAINT ais_nn_zertifikat_gueltdauer
 CHECK (Gueltigkeitsdauer IS NOT NULL);


-- </notnull>

-- ***************************************************************
-- * Primary Key Constraint Section
--
-- <pk>

ALTER TABLE ais_tab_personal
 ADD CONSTRAINT ais_pk_personal
 PRIMARY KEY (Personal_ID);
 
ALTER TABLE ais_tab_flug
 ADD CONSTRAINT ais_pk_flug
 PRIMARY KEY (Flug_ID);
 
ALTER TABLE ais_tab_fluglizenz
 ADD CONSTRAINT ais_pk_fluglizenz
 PRIMARY KEY (Personal_ID, FL_ID);

ALTER TABLE ais_tab_pilot
 ADD CONSTRAINT ais_pk_pilot
 PRIMARY KEY (Personal_ID);
 
ALTER TABLE ais_tab_duerfen_fliegen
 ADD CONSTRAINT ais_pk_duerfen_fliegen
 PRIMARY KEY (Personal_ID, Flugzeug_ID);
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_pk_flugzeug
 PRIMARY KEY (Flugzeug_ID);

ALTER TABLE ais_tab_zertifikat
 ADD CONSTRAINT ais_pk_zertifikat
 PRIMARY KEY (Zertifikat_ID);
-- </pk>

-- ***************************************************************
-- * Unique Key Constraint Section
--
-- <unique>


ALTER TABLE ais_tab_personal
 ADD CONSTRAINT ais_uk_personal_email
 UNIQUE (Email);
 
ALTER TABLE ais_tab_flug
 ADD CONSTRAINT ais_uk_flug_flugnr
 UNIQUE (FlugNr);
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_uk_flugzeug_kennzeichen
 UNIQUE (Kennzeichen);

ALTER TABLE ais_tab_zertifikat
 ADD CONSTRAINT ais_uk_zertifikat_zn_gd
 UNIQUE (Zertifikatsname, Gueltigkeitsdauer);
-- </unique>

-- ***************************************************************
-- * Foreign Key Constraint Section
--
-- <fk>

ALTER TABLE ais_tab_flug
 ADD CONSTRAINT ais_fk_flug_flugzeug
 FOREIGN KEY (Flugzeug_ID)
 REFERENCES ais_tab_flugzeug;

ALTER TABLE ais_tab_flug
 ADD CONSTRAINT ais_fk_flug_pilot
 FOREIGN KEY (Pilot_ID)
 REFERENCES ais_tab_pilot;
 
ALTER TABLE ais_tab_flug
 ADD CONSTRAINT ais_fk_flug_copilot
 FOREIGN KEY (Copilot_ID)
 REFERENCES ais_tab_pilot;
 


ALTER TABLE ais_tab_fluglizenz
 ADD CONSTRAINT ais_fk_fluglizenz_pilot
 FOREIGN KEY (Personal_ID)
 REFERENCES ais_tab_pilot;
 
 
ALTER TABLE ais_tab_pilot
 ADD CONSTRAINT ais_fk_pilot_personal
 FOREIGN KEY (Personal_ID)
 REFERENCES ais_tab_personal;



ALTER TABLE ais_tab_duerfen_fliegen
 ADD CONSTRAINT ais_fk_duerfen_pilot
 FOREIGN KEY (Personal_ID)
 REFERENCES ais_tab_pilot;

ALTER TABLE ais_tab_duerfen_fliegen
 ADD CONSTRAINT ais_fk_duerfen_flugzeug
 FOREIGN KEY (Flugzeug_ID)
 REFERENCES ais_tab_flugzeug;
 
 
 
ALTER TABLE ais_tab_flugzeug
 ADD CONSTRAINT ais_fk_flugzeug_zertifikat
 FOREIGN KEY (Zertifikat_ID)
 REFERENCES ais_tab_zertifikat;
-- </fk>

-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

spool off

-- </sqlplus>
