-- ***************************************************************
-- * File Name:                  dbs_data.sql                    *
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
--spool dbs_data.log


-- Disable Foreign Key Constraint Section
-- ______________________________________

ALTER TABLE DBS_TAB_ANSCHRIFT DISABLE CONSTRAINT DBS_FK_ANSCHRIFT_HOCHSCHULANG;
ALTER TABLE DBS_TAB_FACHBEREICH DISABLE CONSTRAINT DBS_FK_FACHBEREICH_MITARBEITER;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG DISABLE CONSTRAINT DBS_FK_LEHRVERANST_FACHBEREICH;
ALTER TABLE DBS_TAB_LV_ORT DISABLE CONSTRAINT DBS_FK_LV_ORT_GEBAEUDE;
ALTER TABLE DBS_TAB_LV_ORT DISABLE CONSTRAINT DBS_FK_LV_ORT_LEHRVERANST;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_FK_MIRARBEITER_FACHBEREICH;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_FK_MITARB_HOCHSCHULANG;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_FK_MITARBEITER_MITARBEITER;
ALTER TABLE DBS_TAB_PROFESSOR DISABLE CONSTRAINT DBS_FK_PROFESSOR_MITARBEITER;
ALTER TABLE DBS_TAB_PROF_HAELT_LV DISABLE CONSTRAINT DBS_FK_PROF_HAELT_LV_LV_ORT;
ALTER TABLE DBS_TAB_PROF_HAELT_LV DISABLE CONSTRAINT DBS_FK_PROF_HAELT_LV_PROFESSOR;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_FK_STUDENT_FACHBEREICH;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_FK_STUDENT_HOCHSCHULANG;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_FK_STUDENT_MITARBEITER;
ALTER TABLE DBS_TAB_VORNAME DISABLE CONSTRAINT DBS_FK_VORNAME_HOCHSCHULANG;

ALTER TABLE DBS_TAB_PRUEFUNG DISABLE CONSTRAINT DBS_FK_PRUEFUNG_LEHRVERANST;
ALTER TABLE DBS_TAB_PRUEFUNG DISABLE CONSTRAINT DBS_FK_PRUEFUNG_PROFESSOR;
ALTER TABLE DBS_TAB_PRUEFUNG DISABLE CONSTRAINT DBS_FK_PRUEFUNG_STUDENT;


-- Disable Not Null Constraint Section
-- ______________________________________

ALTER TABLE DBS_TAB_ANSCHRIFT DISABLE CONSTRAINT DBS_NN_ANSCHRIFT_ORT;
ALTER TABLE DBS_TAB_ANSCHRIFT DISABLE CONSTRAINT DBS_NN_ANSCHRIFT_PLZ;
ALTER TABLE DBS_TAB_ANSCHRIFT DISABLE CONSTRAINT DBS_NN_ANSCHRIFT_STRASSE;
ALTER TABLE DBS_TAB_FACHBEREICH DISABLE CONSTRAINT DBS_NN_FACHBEREICH_DEKAN;
ALTER TABLE DBS_TAB_FACHBEREICH DISABLE CONSTRAINT DBS_NN_FB_NAME;
ALTER TABLE DBS_TAB_GEBAEUDE DISABLE CONSTRAINT DBS_NN_GEBAEUDE_STRASSE;
ALTER TABLE DBS_TAB_HOCHSCHULANGEHOERIGER DISABLE CONSTRAINT DBS_NN_HOCHSCHULANG_HO_NAME;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG DISABLE CONSTRAINT DBS_NN_LEHRVERANSTALTUNG_FB_NR;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG DISABLE CONSTRAINT DBS_NN_LEHRVERANST_LV_NAME;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_NN_MITARBEITER_BERUF;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_NN_MITARBEITER_GEHALT;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_NN_MITARBEITER_INSTITUTION;
ALTER TABLE DBS_TAB_PROFESSOR DISABLE CONSTRAINT DBS_NN_PROFESSOR_FACHGEBIET;
ALTER TABLE DBS_TAB_PROFESSOR DISABLE CONSTRAINT DBS_NN_PROFESSOR_TITEL;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_NN_STUDENT_FB_NR;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_NN_STUDENT_HO_NR;
ALTER TABLE DBS_TAB_VORNAME DISABLE CONSTRAINT DBS_NN_VORNAME_VORNAME;


-- Disable Primary Key Constraint Section
-- ______________________________________

ALTER TABLE DBS_TAB_ANSCHRIFT DISABLE CONSTRAINT DBS_PK_ANSCHRIFT;
ALTER TABLE DBS_TAB_FACHBEREICH DISABLE CONSTRAINT DBS_PK_FACHBEREICH;
ALTER TABLE DBS_TAB_GEBAEUDE DISABLE CONSTRAINT DBS_PK_GEBAEUDE;
ALTER TABLE DBS_TAB_HOCHSCHULANGEHOERIGER DISABLE CONSTRAINT DBS_PK_HOCHSCHULANGEHOERIGER;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG DISABLE CONSTRAINT DBS_PK_LEHRVERANSTALTUNG;
ALTER TABLE DBS_TAB_LV_ORT DISABLE CONSTRAINT DBS_PK_LV_ORT_ID;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_PK_MITARBEITER;
ALTER TABLE DBS_TAB_PROFESSOR DISABLE CONSTRAINT DBS_PK_PROFESSOR;
ALTER TABLE DBS_TAB_PROF_HAELT_LV DISABLE CONSTRAINT DBS_PK_PROF_HAELT_LV;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_PK_STUDENT;
ALTER TABLE DBS_TAB_VORNAME DISABLE CONSTRAINT DBS_PK_VORNAME;

ALTER TABLE DBS_TAB_PRUEFUNG DISABLE CONSTRAINT DBS_PK_PRUEFUNG;


-- Disable Unique Key Constraint Section
-- ______________________________________
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_UK_STUDENT_PERS;
ALTER TABLE DBS_TAB_STUDENT DISABLE CONSTRAINT DBS_UK_STUDENT_HO;
ALTER TABLE DBS_TAB_MITARBEITER DISABLE CONSTRAINT DBS_UK_MITARBEITER_HO;

-- Insert anschrift Section
-- ________________________

INSERT INTO dbs_tab_anschrift VALUES ( 1001 , 1 , 53111 , 'Bonn' , 'Hinter der Stadt' , '22' );
INSERT INTO dbs_tab_anschrift VALUES ( 1001 , 2 , 53721 , 'Siegburg' , 'Notstrasse' , '23 A' );
INSERT INTO dbs_tab_anschrift VALUES ( 1002 , 1 , 53111 , 'Bonn' , 'Im Pfaffenbach' , '55' );
INSERT INTO dbs_tab_anschrift VALUES ( 1003 , 1 , 53111 , 'Bonn' , 'Weidbrunner Gasse' , '14' );
INSERT INTO dbs_tab_anschrift VALUES ( 1004 , 1 , 53773 , 'Hennef', 'Im Ehrental' , '10'  );
INSERT INTO dbs_tab_anschrift VALUES ( 1004 , 2 , 53111 , 'Bonn' , 'Siegburger Strasse' , '43' );
INSERT INTO dbs_tab_anschrift VALUES ( 1005 , 1 , 53111 , 'Bonn' , 'Siegburger Strasse', '5' );
INSERT INTO dbs_tab_anschrift VALUES ( 1006 , 1 , 53111 , 'Bonn' , 'Stiller Tor' , '31' );
INSERT INTO dbs_tab_anschrift VALUES ( 1007 , 1 , 53111 , 'Bonn' , 'Rötweg' , '88' );
INSERT INTO dbs_tab_anschrift VALUES ( 1008 , 1 , 53859 , 'Niederkassel' , 'Gothaer Straße' , '23' );
INSERT INTO dbs_tab_anschrift VALUES ( 1008 , 2 , 53111 , 'Bonn' , 'Am neuen Teich' , '64 C' );
INSERT INTO dbs_tab_anschrift VALUES ( 1009 , 1 , 53111 , 'Bonn' , 'Am neuen Teich' , '10' );
INSERT INTO dbs_tab_anschrift VALUES ( 1010 , 1 , 53111 , 'Bonn' , 'Reichenbach' , '54' );
INSERT INTO dbs_tab_anschrift VALUES ( 1011 , 1 , 53111 , 'Bonn' , 'Weidbrunner Tor' , '119' );
INSERT INTO dbs_tab_anschrift VALUES ( 1012 , 1 , 53111 , 'Bonn' , 'Brackstrasse' , '24' );
INSERT INTO dbs_tab_anschrift VALUES ( 1013 , 1 , 53111 , 'Bonn' , 'Brunnenweg' , '86' );
INSERT INTO dbs_tab_anschrift VALUES ( 1013 , 2 , 98574 , 'Schmalkalden' , 'Blechhammer' , NULL );
INSERT INTO dbs_tab_anschrift VALUES ( 1014 , 1 , 53111 , 'Bonn' , 'Allendestrasse' , '14' );
INSERT INTO dbs_tab_anschrift VALUES ( 1015 , 1 , 53111 , 'Bonn' , 'Grasberg' , '65' );
INSERT INTO dbs_tab_anschrift VALUES ( 1016 , 1 , 53111 , 'Bonn' , 'Auerweg' , '14' );
INSERT INTO dbs_tab_anschrift VALUES ( 1017 , 1 , 53111 , 'Bonn' , 'Eichelbach' , '76' );
INSERT INTO dbs_tab_anschrift VALUES ( 1018 , 1 , 53111 , 'Bonn' , 'Am Rheinufer' , '24' );
INSERT INTO dbs_tab_anschrift VALUES ( 1019 , 1 , 53111 , 'Bonn' , 'Siegburger Strasse' , '17' );
INSERT INTO dbs_tab_anschrift VALUES ( 1019 , 2 , 53754 , 'Sankt Augustin' , 'Burgweg' , '32' );
INSERT INTO dbs_tab_anschrift VALUES ( 1020 , 1 , 53111 , 'Bonn' , 'Bahnhofstrasse' , '66' );

INSERT INTO dbs_tab_anschrift VALUES ( 1021 , 1 , 53111 , 'Bonn' , 'Markt' , '' );
INSERT INTO dbs_tab_anschrift VALUES ( 1022 , 1 , 53757 , 'Sankt Augustin' , 'Kölnstraße' , '22' );
INSERT INTO dbs_tab_anschrift VALUES ( 1023 , 1 , 53343 , 'Wachtberg' , 'Bondorfer Straße' , '1' );
INSERT INTO dbs_tab_anschrift VALUES ( 1024 , 1 , 53347 , 'Alfter' , 'Amselweg' , '7' );
INSERT INTO dbs_tab_anschrift VALUES ( 1025 , 1 , 53347 , 'Alfter' , 'Drosselweg' , '12' );
INSERT INTO dbs_tab_anschrift VALUES ( 1026 , 1 , 53639 , 'Königswinter' , 'Königswinterer Straße' , '55' );
INSERT INTO dbs_tab_anschrift VALUES ( 1027 , 1 , 53809 , 'Ruppichteroth' , 'Bahnhofstrasse' , '3' );
INSERT INTO dbs_tab_anschrift VALUES ( 1028 , 1 , 53757 , 'Sankt Augustin' , 'Dornierstraße' , '' );
INSERT INTO dbs_tab_anschrift VALUES ( 1029 , 1 , 53804 , 'Much' , 'Hauptstraße' , '17' );
INSERT INTO dbs_tab_anschrift VALUES ( 1030, 1 , 53111 , 'Bonn' , 'Bertha-von-Suttner-Platz' , '' );



-- Insert fachbereich Section
-- __________________________

INSERT INTO dbs_tab_fachbereich VALUES (3 , 'Elektrotechnik' , '508311' );
INSERT INTO dbs_tab_fachbereich VALUES (1 , 'Wirtschaftswissenschaften' , '508514' );
INSERT INTO dbs_tab_fachbereich VALUES (2 , 'Informatik' , '508321' );


-- Insert Gebaeude  Section
-- ________________________

INSERT INTO dbs_tab_gebaeude VALUES ( 'A' , 'Grantham-Allee' , '20' );
INSERT INTO dbs_tab_gebaeude VALUES ( 'B' , 'Grantham-Allee' , '20' );
INSERT INTO dbs_tab_gebaeude VALUES ( 'C' , 'Grantham-Allee' , '20' );
INSERT INTO dbs_tab_gebaeude VALUES ( 'D' , 'Zum Steimelsberg' , '7' );
INSERT INTO dbs_tab_gebaeude VALUES ( 'E' , 'von-Liebig-Straße' , '20' );
INSERT INTO dbs_tab_gebaeude VALUES ( 'F' , 'von-Liebig-Straße' , '20');


-- Insert Hochschulangehoeriger Section
-- ___________________________________

INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1001 , 'Dilloo' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1002 , 'Wilke' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1003 , 'Schmidt' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1004 , 'Grau' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1005 , 'Schmidt' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1006 , 'Toastbrot' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1007 , 'Meyer' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1008 , 'Meier' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1009 , 'Mayer' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1010 , 'Mueller' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1011 , 'Lehman' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1012 , 'Kohl' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1013 , 'Listig' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1014 , 'Becker' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1015 , 'Kleekamp' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1016 , 'Schmidt' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1017 , 'Hinz' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1018 , 'Kunz' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1019 , 'Wachtendonk' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1020 , 'Neumann' );

INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1021 , 'Amsel' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1022 , 'Barsch' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1023 , 'Camel' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1024 , 'Dachs' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1025 , 'Eber' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1026 , 'Fuchs' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1027 , 'Ganz' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1028 , 'Hahn' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1029 , 'Iltis' );
INSERT INTO dbs_tab_hochschulangehoeriger VALUES ( 1030 , 'Jaguar' );


-- Insert Lehrveranstaltung Section
-- ________________________________

INSERT INTO dbs_tab_lv_ort VALUES ( 1144 , 'Mo' , '1600' , 'F' ,'4' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1144 , 'Mo' , '1745' , 'C' ,'181' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1150 , 'Do' , '1230' , 'C' ,'177' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1150 , 'Fr' , '1230' , 'C' ,'181' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1152 , 'Fr' , '1600' , 'C' ,'181' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1152 , 'Do' , '1230' , 'C' ,'016' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1152 , 'Fr' , '1230' , NULL , NULL );
INSERT INTO dbs_tab_lv_ort VALUES ( 1153 , 'Di' , '1415' , 'C' ,'177' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1153 , 'Do' , '1015' , 'C' ,'181' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1153 , 'Do' , '1230' , 'C' ,'177' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1153 , 'Do' , '1415' , 'C' ,'181' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1154 , 'Di' , '0815' , 'E' ,'4' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1154 , 'Di' , '1600' , 'F' ,'23' );
INSERT INTO dbs_tab_lv_ort VALUES ( 1154 , 'Di' , '1745' , 'C' ,'181' );


-- Insert Mitarbeiter Section
-- _____________

INSERT INTO dbs_tab_mitarbeiter VALUES ('507252' , 1001 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508514' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('507262' , 1004 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508514' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('507253' , 1006 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508321' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('507254' , 1008 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 200 , '508322' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('507263' , 1010 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508322' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('508311' , 1011 , 3 , 'Forschung und Lehre' , 'Professor' , 5150 , NULL );
INSERT INTO dbs_tab_mitarbeiter VALUES ('508514' , 1012 , 2 , 'Forschung und Lehre' , 'Professor' , 5200 , NULL );
INSERT INTO dbs_tab_mitarbeiter VALUES ('508321' , 1013 , 2 , 'Forschung und Lehre' , 'Professor' , 5300 , NULL );
INSERT INTO dbs_tab_mitarbeiter VALUES ('508523' , 1014 , 2 , 'Forschung und Lehre' , 'Professor' , 5050 , NULL );
INSERT INTO dbs_tab_mitarbeiter VALUES ('508322' , 1015 , 2 , 'Forschung und Lehre' , 'Professor' , 5650 , NULL );
INSERT INTO dbs_tab_mitarbeiter VALUES ('509514' , 1016 , 1 , 'Forschung und Lehre' , 'Professor' , 5650 , NULL );

INSERT INTO dbs_tab_mitarbeiter VALUES ('601313' , 1021 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508322' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('602222' , 1025 , 3 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508322' );
INSERT INTO dbs_tab_mitarbeiter VALUES ('601414' , 1030 , 2 , 'Forschung und Lehre' , 'studentische Hilfskraft' , 400 , '508322' );

-- Insert Name_LV Section
-- ______________________

INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1142 , 'Marketing' , 1);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1143 , 'Volkswirtschaftslehre I' , 1);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1149 , 'Personalmanagement' , 1);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1144 , 'Datenbanksysteme' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1154 , 'Betriebssysteme' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1145 , 'Informationssysteme im Handel' , 1);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1146 , 'Programmierung I' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1148 , 'Programmierung II' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1150 , 'Statistik' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1151 , 'Datenstrukturen, Algorithmen' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1152 , 'Datenbanksystemtechnik' , 2);
INSERT INTO dbs_tab_lehrveranstaltung VALUES ( 1153 , 'Methoden der Programmierung' , 2);


-- Insert Professor Section
-- ________________________

INSERT INTO dbs_tab_professor VALUES ( 'Prof. Dr.' , '508311' , 'Mathematik' );
INSERT INTO dbs_tab_professor VALUES ( 'Prof. Dr.' , '508514' , 'Marketing' );
INSERT INTO dbs_tab_professor VALUES ( 'Prof.' , '508321' , 'Betriebssysteme' );
INSERT INTO dbs_tab_professor VALUES ( 'Prof. Dr.' , '508523' , 'Datenbanksysteme' );
INSERT INTO dbs_tab_professor VALUES ( 'Prof.' , '508322' , 'Prammiersprachen' );
INSERT INTO dbs_tab_professor VALUES ( 'Prof. Dr.' , '509514' , 'Statistik' );


-- Insert Prof_haelt_LV Section
-- _____________

INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1144 , 'Mo' , '1600' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1144 , 'Mo' , '1745' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1144 , 'Mo' , '1600' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1144 , 'Mo' , '1745' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1152 , 'Do' , '1230' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1152 , 'Fr' , '1230' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1152 , 'Fr' , '1600' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '509514' , 1150 , 'Do' , '1230' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '509514' , 1150 , 'Fr' , '1230' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1153 , 'Di' , '1415' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1153 , 'Do' , '1015' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1153 , 'Do' , '1230' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1153 , 'Do' , '1415' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1154 , 'Di' , '0815' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1154 , 'Di' , '1600' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508321' , 1154 , 'Di' , '1745' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1154 , 'Di' , '0815' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1154 , 'Di' , '1600' );
INSERT INTO dbs_tab_prof_haelt_LV VALUES ( '508523' , 1154 , 'Di' , '1745' );


-- Insert Student Section
-- ______________________

INSERT INTO dbs_tab_student VALUES ( 1001 , '507252' , 801426 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1002 , NULL , 806142 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1003 , NULL , 807262 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1004 , '507262' , 806152  , 2 );
INSERT INTO dbs_tab_student VALUES ( 1005 , NULL , 806153 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1006 , '507253' , 806141 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1007 , NULL , 806462 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1008 , '507254' , 907652 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1009 , NULL , 807232 , 3 );
INSERT INTO dbs_tab_student VALUES ( 1010 , '507263' , 807252 , 1 );

INSERT INTO dbs_tab_student VALUES ( 1021 , '601313' , 808602 , 1 );
INSERT INTO dbs_tab_student VALUES ( 1022 , Null , 808603 , 1 );
INSERT INTO dbs_tab_student VALUES ( 1023 , NULL , 808604 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1024 , NULL , 808605 , 3 );
INSERT INTO dbs_tab_student VALUES ( 1025 , '602222' , 808606 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1026 , NULL , 808607, 1 );
INSERT INTO dbs_tab_student VALUES ( 1027 , NULL , 808608 , 2 );
INSERT INTO dbs_tab_student VALUES ( 1028 , NULL , 808609, 1 );
INSERT INTO dbs_tab_student VALUES ( 1029 , NULL , 808610, 3 );
INSERT INTO dbs_tab_student VALUES ( 1030 , '601414' , 808611, 1 );


-- Insert Vorname Section
-- ______________________

INSERT INTO dbs_tab_vorname Values ( 1001 , 1 , 'Sabine' );
INSERT INTO dbs_tab_vorname Values ( 1001 , 2 , 'Petra' );
INSERT INTO dbs_tab_vorname Values ( 1001 , 3 , 'Martina' );
INSERT INTO dbs_tab_vorname Values ( 1002 , 1 , 'Hans' );
INSERT INTO dbs_tab_vorname Values ( 1002 , 2 , 'Hans' );
INSERT INTO dbs_tab_vorname Values ( 1003 , 1 , 'Frank' );
INSERT INTO dbs_tab_vorname Values ( 1004 , 1 , 'Otto' );
INSERT INTO dbs_tab_vorname Values ( 1005 , 1 , 'Lisa' );
INSERT INTO dbs_tab_vorname Values ( 1006 , 1 , 'Brigitte' );
INSERT INTO dbs_tab_vorname Values ( 1007 , 1 , 'Manuel' );
INSERT INTO dbs_tab_vorname Values ( 1008 , 1 , 'Fritz' );
INSERT INTO dbs_tab_vorname Values ( 1009 , 1 , 'Helmut' );
INSERT INTO dbs_tab_vorname Values ( 1010 , 1 , 'Walter' );
INSERT INTO dbs_tab_vorname Values ( 1011 , 1 , 'Klaus' );
INSERT INTO dbs_tab_vorname Values ( 1012 , 1 , 'Hans' );
INSERT INTO dbs_tab_vorname Values ( 1012 , 2 , 'Peter' );
INSERT INTO dbs_tab_vorname Values ( 1013 , 1 , 'Franz' );
INSERT INTO dbs_tab_vorname Values ( 1014 , 1 , 'Gunter' );
INSERT INTO dbs_tab_vorname Values ( 1015 , 1 , 'Eduard' );
INSERT INTO dbs_tab_vorname Values ( 1016 , 1 , 'Emil' );
INSERT INTO dbs_tab_vorname Values ( 1017 , 1 , 'Clotilde' );
INSERT INTO dbs_tab_vorname Values ( 1018 , 1 , 'Regina' );
INSERT INTO dbs_tab_vorname Values ( 1019 , 1 , 'Erna' );
INSERT INTO dbs_tab_vorname Values ( 1020 , 1 , 'Ernst' );
INSERT INTO dbs_tab_vorname Values ( 1020 , 2 , 'Klaus' );

INSERT INTO dbs_tab_vorname Values ( 1021 , 1 , 'Ben' );
INSERT INTO dbs_tab_vorname Values ( 1021 , 2 , 'Elias' );
INSERT INTO dbs_tab_vorname Values ( 1022 , 1 , 'Leon' );
INSERT INTO dbs_tab_vorname Values ( 1023 , 1 , 'Emilia' );
INSERT INTO dbs_tab_vorname Values ( 1024 , 1 , 'Paul' );
INSERT INTO dbs_tab_vorname Values ( 1024 , 2 , 'Felix' );
INSERT INTO dbs_tab_vorname Values ( 1025 , 1 , 'Emma' );
INSERT INTO dbs_tab_vorname Values ( 1026 , 1 , 'Mia' );
INSERT INTO dbs_tab_vorname Values ( 1027 , 1 , 'Mila' );
INSERT INTO dbs_tab_vorname Values ( 1028 , 1 , 'Noah' );
INSERT INTO dbs_tab_vorname Values ( 1029 , 1 , 'David' );
INSERT INTO dbs_tab_vorname Values ( 1030 , 1 , 'Julian' );
INSERT INTO dbs_tab_vorname Values ( 1030 , 2 , 'Ella' );

-- Insert Pruefung Section
-- ______________________
--INSERT INTO dbs_tab_pruefung Values ( Matr , LVNr , 'Prof_PersNr', Versuch, Datum, Note(number2,1) );
INSERT INTO dbs_tab_pruefung Values ( 808602 , 1144 , '508321', 1, TO_DATE(('17.' || (select to_char(add_months(SYSDATE,-6),'MM.YYYY') FROM dual)),'DD.MM.YYYY'), 1.3 );
INSERT INTO dbs_tab_pruefung Values ( 808602 , 1152 , '508321', 1, TO_DATE(('07.' || (select to_char(add_months(SYSDATE,-6),'MM.YYYY') FROM dual)),'DD.MM.YYYY'), 5.0 );
INSERT INTO dbs_tab_pruefung Values ( 808602 , 1152 , '508321', 2, TO_DATE(('19.' || (select to_char(add_months(SYSDATE,-6),'MM.YYYY') FROM dual)),'DD.MM.YYYY'), 4.7 );
INSERT INTO dbs_tab_pruefung Values ( 808603 , 1153 , '508323', 1, TO_DATE(('13.' || (select to_char(add_months(SYSDATE,+3),'MM.YYYY') FROM dual)),'DD.MM.YYYY'), Null );
INSERT INTO dbs_tab_pruefung Values ( 808604 , 1144 , '508321', 1, TO_DATE(('17.' || (select to_char(add_months(SYSDATE,-6),'MM.YYYY') FROM dual)),'DD.MM.YYYY'), 2.0 );
INSERT INTO dbs_tab_pruefung Values ( 808603 , 1144 , '508321', 1, Null, Null );
INSERT INTO dbs_tab_pruefung Values ( 808603 , 1152 , '508321', 1, Null, Null );



-- Enable Unique Key Constraint Section
-- _____________________________________
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_UK_STUDENT_PERS;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_UK_STUDENT_HO;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_UK_MITARBEITER_HO;


-- Enable Primary Key Constraint Section
-- _____________________________________

ALTER TABLE DBS_TAB_VORNAME ENABLE CONSTRAINT DBS_PK_VORNAME;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_PK_STUDENT;
ALTER TABLE DBS_TAB_PROF_HAELT_LV ENABLE CONSTRAINT DBS_PK_PROF_HAELT_LV;
ALTER TABLE DBS_TAB_PROFESSOR ENABLE CONSTRAINT DBS_PK_PROFESSOR;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_PK_MITARBEITER;
ALTER TABLE DBS_TAB_LV_ORT ENABLE CONSTRAINT DBS_PK_LV_ORT_ID;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG ENABLE CONSTRAINT DBS_PK_LEHRVERANSTALTUNG;
ALTER TABLE DBS_TAB_HOCHSCHULANGEHOERIGER ENABLE CONSTRAINT DBS_PK_HOCHSCHULANGEHOERIGER;
ALTER TABLE DBS_TAB_GEBAEUDE ENABLE CONSTRAINT DBS_PK_GEBAEUDE;
ALTER TABLE DBS_TAB_FACHBEREICH ENABLE CONSTRAINT DBS_PK_FACHBEREICH;
ALTER TABLE DBS_TAB_ANSCHRIFT ENABLE CONSTRAINT DBS_PK_ANSCHRIFT;


-- Enable Not Null Constraint Section
-- _____________________________________

ALTER TABLE DBS_TAB_VORNAME ENABLE CONSTRAINT DBS_NN_VORNAME_VORNAME;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_NN_STUDENT_HO_NR;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_NN_STUDENT_FB_NR;
ALTER TABLE DBS_TAB_PROFESSOR ENABLE CONSTRAINT DBS_NN_PROFESSOR_TITEL;
ALTER TABLE DBS_TAB_PROFESSOR ENABLE CONSTRAINT DBS_NN_PROFESSOR_FACHGEBIET;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_NN_MITARBEITER_INSTITUTION;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_NN_MITARBEITER_GEHALT;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_NN_MITARBEITER_BERUF;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG ENABLE CONSTRAINT DBS_NN_LEHRVERANST_LV_NAME;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG ENABLE CONSTRAINT DBS_NN_LEHRVERANSTALTUNG_FB_NR;
ALTER TABLE DBS_TAB_HOCHSCHULANGEHOERIGER ENABLE CONSTRAINT DBS_NN_HOCHSCHULANG_HO_NAME;
ALTER TABLE DBS_TAB_GEBAEUDE ENABLE CONSTRAINT DBS_NN_GEBAEUDE_STRASSE;
ALTER TABLE DBS_TAB_FACHBEREICH ENABLE CONSTRAINT DBS_NN_FACHBEREICH_DEKAN;
ALTER TABLE DBS_TAB_FACHBEREICH ENABLE CONSTRAINT DBS_NN_FB_NAME;
ALTER TABLE DBS_TAB_ANSCHRIFT ENABLE CONSTRAINT DBS_NN_ANSCHRIFT_STRASSE;
ALTER TABLE DBS_TAB_ANSCHRIFT ENABLE CONSTRAINT DBS_NN_ANSCHRIFT_PLZ;
ALTER TABLE DBS_TAB_ANSCHRIFT ENABLE CONSTRAINT DBS_NN_ANSCHRIFT_ORT;


-- Enable Foreign Key Constraint Section
-- _____________________________________

ALTER TABLE DBS_TAB_VORNAME ENABLE CONSTRAINT DBS_FK_VORNAME_HOCHSCHULANG;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_FK_STUDENT_MITARBEITER;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_FK_STUDENT_HOCHSCHULANG;
ALTER TABLE DBS_TAB_STUDENT ENABLE CONSTRAINT DBS_FK_STUDENT_FACHBEREICH;
ALTER TABLE DBS_TAB_PROF_HAELT_LV ENABLE CONSTRAINT DBS_FK_PROF_HAELT_LV_PROFESSOR;
ALTER TABLE DBS_TAB_PROF_HAELT_LV ENABLE CONSTRAINT DBS_FK_PROF_HAELT_LV_LV_ORT;
ALTER TABLE DBS_TAB_PROFESSOR ENABLE CONSTRAINT DBS_FK_PROFESSOR_MITARBEITER;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_FK_MITARBEITER_MITARBEITER;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_FK_MITARB_HOCHSCHULANG;
ALTER TABLE DBS_TAB_MITARBEITER ENABLE CONSTRAINT DBS_FK_MIRARBEITER_FACHBEREICH;
ALTER TABLE DBS_TAB_LV_ORT ENABLE CONSTRAINT DBS_FK_LV_ORT_LEHRVERANST;
ALTER TABLE DBS_TAB_LV_ORT ENABLE CONSTRAINT DBS_FK_LV_ORT_GEBAEUDE;
ALTER TABLE DBS_TAB_LEHRVERANSTALTUNG ENABLE CONSTRAINT DBS_FK_LEHRVERANST_FACHBEREICH;
ALTER TABLE DBS_TAB_FACHBEREICH ENABLE CONSTRAINT DBS_FK_FACHBEREICH_MITARBEITER;
ALTER TABLE DBS_TAB_ANSCHRIFT ENABLE CONSTRAINT DBS_FK_ANSCHRIFT_HOCHSCHULANG;

--
-- ***************************************************************
-- * SQL*plus Job Control Section

--spool off
