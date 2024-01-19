-- ***************************************************************
-- * File Name:                  dbs_extern.sql                  *
-- * File Creator:               Knolle                          *
-- * LastDate:                   12.01.2024                      *
-- *                                                             *
-- * <ChangeLogDate>             <ChangeLogText>                 *
-- ***************************************************************
--
-- ***************************************************************
-- * Datenbanksysteme WS 2023/24
-- * Uebung 9
--
-- ***************************************************************
-- * SQL*plus Job Control Section
--
set 	echo 		on
set 	linesize 	256
set 	pagesize 	50
--
-- Spaltenformatierung (nur fuer die Ausgabe)
--
column 	ho_name     format A20 WORD_WRAPPED
column 	beruf       format A25 WORD_WRAPPED
column 	fb_name     format A25 WORD_WRAPPED
column 	institution format A20 WORD_WRAPPED
column 	strasse     format A20 WORD_WRAPPED
column 	haus_nr     format A5  WORD_WRAPPED
column 	ort         format A15 WORD_WRAPPED
column 	titel       format A10 WORD_WRAPPED
column 	vorname     format A10 WORD_WRAPPED
column 	ort         format A20 WORD_WRAPPED
column 	fachgebiet  format A17 WORD_WRAPPED
column 	pers_nr     format A11 WORD_WRAPPED
column 	NULL        format A6  WORD_WRAPPED
--
-- Protokolldatei
--
-- Systemdatum
--
spool ./dbs_extern.log
--
  SELECT user,
         TO_CHAR(SYSDATE, 'dd-mm-yy hh24:mi:ss')
  FROM   dual
  ;
--
-- ***************************************************************
-- * S Q L - B E I S P I E L - V I E W S
--
CREATE OR
REPLACE VIEW
;

DESCRIBE

SELECT	      *
FROM
;

--
--      Erstellen Sie die folgenden Sichten:
--
--      Virtuelle Tabelle „Fachbereich“ mit allen Spalten der
--      korrespondierenden Tabelle der konzeptionellen Ebene
--      (Beispiel einer sehr einfachen View, die exakt der zugrunde
--      liegenden Tabelle entspricht).
--
--CREATE OR
--REPLACE VIEW  dbs_v_student
--AS SELECT     *
--FROM          dbs_tab_student;

--DESCRIBE dbs_v_student

--SELECT	      *
--FROM  dbs_v_student;

CREATE OR
REPLACE VIEW    dbs_v_fachbereich
AS SELECT       *
FROM            dbs_tab_fachbereich;

--
--      Virtuelle Tabelle „Fachbereich hat Dekan“. Die View soll
--      nur die Spalten Name des Fachbereichs und Name des Dekans
--      enthalten.
--
CREATE OR 
REPLACE VIEW    dbs_v_fb_hat_dekan
AS SELECT       fb_name, dekan
FROM            dbs_tab_fachbereich;

--
--      Virtuelle Tabelle „Fachbereich beschaeftigt Mitarbeiter“.
--      Die View soll nur die Spalten Name des Fachbereichs und
--      Name des Mitarbeiters enthalten und standardmäßig nach
--      dem Namen des Fachbereichs und bei Gleichheit nach dem
--      Namen des Mitarbeiters sortiert werden.

CREATE OR
REPLACE VIEW    dbs_v_fb_beschäftigt_mitar
AS SELECT       f.fb_name, h.ho_name
FROM            dbs_tab_fachbereich f
INNER JOIN      dbs_tab_mitarbeiter m ON f.fb_nr = m.fb_nr
INNER JOIN      dbs_tab_hochschulangehoeriger h ON m.ho_nr = h.ho_nr
ORDER BY        f.fb_name ASC, h.ho_name ASC;


--
--      Virtuelle Tabelle „Fachbereich bietet Lehrveranstaltung“.
--      Die View soll lediglich den Namen des Fachbereichs und den
--      Namen der Lehrveranstaltung enthalten und nach dem Namen
--      der Lehrveranstaltung, sowie bei Gleichheit nach dem Namen
--      des Fachbereichs sortiert werden.
--
CREATE OR
REPLACE VIEW    dbs_v_fb_bietet_lv
AS SELECT       lv.lv_name, f.fb_name
FROM            dbs_tab_fachbereich f
INNER JOIN      dbs_tab_lehrveranstaltung lv ON f.fb_nr = lv.fb_nr
ORDER BY        lv.lv_name ASC, f.fb_name ASC;


--
--      Virtuelle Tabelle „Lehrveranstaltungen des Fachbereichs
--      Informatik“. Nutzen Sie zur Erstellung dieser View die zuvor
--      erstellte View „Fachbereich bietet Lehrveranstaltung“.
--
CREATE OR
REPLACE VIEW    dbs_v_lv_von_fb02
AS SELECT   lv_name as LV_im_FB02
FROM        dbs_v_fb_bietet_lv
WHERE       fb_name = 'Informatik';

--
--      Virtuelle Tabelle „Hochschulangehoeriger“. Die View soll
--      lediglich die relevanten und objektidentifizierenden Spalten
--      des semantisch ausdrucksstarken Objekts „Hochschulangehoeriger“
--      enthalten (also nicht die Spalten an_nr und vo_nr). Die View
--      soll standardmäßig nach dem Namen des Hochschulangehörigen
--      sortiert werden.
--
--      Frage: Warum ist dieses Sortierkriterium nicht immer
--      hilfreich?
--      Frage: Warum tauchen einige der Hochschulangehörigen
--      offenbar mehrfach auf?
--      Weil sie mehrere Vorname bzw adressen haben
--
CREATE OR
REPLACE VIEW    dbs_v_hochschulangehoeriger
AS SELECT       h.ho_nr, h.ho_name, v.vorname, a.plz, a.ort, a.strasse, a.haus_nr
FROM            dbs_tab_hochschulangehoeriger h
INNER JOIN      dbs_tab_anschrift a ON h.ho_nr = a.ho_nr
INNER JOIN      dbs_tab_vorname v ON h.ho_nr = v.ho_nr
ORDER BY        h.ho_name ASC;


--
--      Virtuelle Tabelle „Mitarbeiter“. Die View soll lediglich
--      die relevanten und objektidentifizierenden Spalten des
--      semantisch ausdrucksstarken Objekts „Mitarbeiter“, sowie
--      den Namen des Fachbereichs wo dieser angestellt ist enthalten.
--      Bitte lassen Sie die Spalte Gehalt weg. Die View soll standardmäßig
--      nach dem Namen des Fachbereichs und bei Gleichheit nach dem
--      Namen des Mitarbeiters sortiert werden.
--
--      Frage: Warum wäre ein zweites Sortierkriterium nach der
--      Personalnummer hilfreicher?
--
CREATE OR
REPLACE VIEW    dbs_v_mitarbeiter
AS SELECT       m.pers_nr, f.fb_name as Fachbereich, h.ho_name as Name, m.institution, m.beruf
FROM            dbs_tab_mitarbeiter m
INNER JOIN      dbs_tab_hochschulangehoeriger h ON m.ho_nr = h.ho_nr
INNER JOIN      dbs_tab_fachbereich f ON m.fb_nr = f.fb_nr
ORDER BY        f.fb_name ASC, ho_Name ASC;

--
--      Virtuelle Tabelle „Professor“. Die View soll lediglich
--      die relevanten und objektidentifizierenden Spalten des
--      semantisch ausdrucksstarken Objekts „Professor“, sowie
--      den Namen des Fachbereichs wo dieser angestellt ist enthalten.
--      Bitte lassen Sie die Spalte Gehalt weg. Die View soll standardmäßig
--      nach dem Namen des Fachbereichs und bei Gleichheit nach der
--      Personalnummer des Professors sortiert werden.
--
--      Frage: Kann man zur Erstellung dieser View auf die zuvor
--      erstellte View „Mitarbeiter“ zurückgreifen?
--
CREATE OR
REPLACE VIEW    dbs_v_professor
AS SELECT       p.titel, p.fachgebiet, m.*
FROM            dbs_tab_professor p
INNER JOIN      dbs_v_mitarbeiter m ON p.pers_nr = m.pers_nr
ORDER BY        m.fachbereich ASC, m.pers_nr ASC;


--
--      Virtuelle Tabelle „Student“. Die View soll lediglich die relevanten
--      und objektidentifizierenden Spalten des semantisch ausdrucksstarken
--      Objekts „Student“, sowie den Namen des Fachbereichs wo dieser
--      immatrikuliert ist enthalten. Bitte lassen Sie die Spalte Personalnummer
--      weg. Die View soll standardmäßig nach dem Namen des Fachbereichs und
--      bei Gleichheit nach der Matrikelnummer des Studenten sortiert werden.

CREATE OR
REPLACE VIEW    dbs_v_student
AS SELECT       f.fb_name, s.matr_nr
FROM            dbs_tab_student s
INNER JOIN      dbs_tab_fachbereich f ON s.fb_nr = f.fb_nr
ORDER BY        f.fb_name ASC, s.matr_nr ASC;


--
--      Virtuelle Tabelle „Studentischer Mitarbeiter“. Die View soll lediglich
--      die relevanten und objektidentifizierenden Spalten des semantisch
--      ausdrucksstarken Objekts „Student“, sowie den Namen des Fachbereichs
--      wo dieser angestellt ist und den Namen des Fachbereichs wo dieser
--      immatrikuliert ist enthalten. Bitte lassen Sie die Spalten Matrikelnummer
--      und Gehalt weg. Die View soll standardmäßig nach dem Namen des
--      Fachbereichs der Mitarbeiter und bei Gleichheit nach der Personalnummer
--      des Studenten sortiert werden.

--      Frage: Kann man zur Erstellung dieser View auf die zuvor erstellte
--      View „Mitarbeiter“ und / oder „Student“ zurückgreifen?
--
CREATE OR
REPLACE VIEW    dbs_v_studmitar
AS SELECT       s.matr_nr, m.*
FROM            dbs_tab_student s
INNER JOIN      dbs_v_mitarbeiter m ON s.pers_nr = m.pers_nr
ORDER BY        m.fachbereich ASC, m.pers_nr ASC;

--
--      Virtuelle Tabelle „Professor haelt Lehrveranstaltung“. Die View
--      soll Titel, Namen und Fachgebiet des Professors und den Namen der
--      Lehrveranstaltung enthalten. Die View soll nach der Nummer des
--      Hochschulangehörigen sortiert werden (auch wenn diese nicht
--      Bestandteil der View ist).
--
--      Frage: Warum ist an dieser Stelle ein „distinct“ hilfreich?
--      Weil manche LV an mehreren Tagen stattfinden

CREATE OR
REPLACE VIEW        dbs_v_prof_haelt_lv
AS SELECT DISTINCT  *
FROM (
    SELECT          l.lv_name, p.fachgebiet, h.ho_name as Name
    FROM            dbs_tab_prof_haelt_lv plv
    INNER JOIN      dbs_tab_professor p ON p.pers_nr = plv.pers_nr
    INNER JOIN      dbs_tab_lehrveranstaltung l ON plv.lv_nr = l.lv_nr
    INNER JOIN      dbs_tab_mitarbeiter m ON p.pers_nr = m.pers_nr
    INNER JOIN      dbs_v_hochschulangehoeriger h ON m.ho_nr = h.ho_nr
    ORDER BY        h.ho_nr ASC
);

--
--      Virtuelle Tabelle „Pruefungen“. Die View soll lediglich
--	    die relevanten und objektidentifizierenden Spalten des
--	    semantisch ausdrucksstarken Objekts „Pruefungen“ enthalten.
--	    Die View soll namentlich: Lehrveranstaltung, Professor und
--	    Student mit Name und erstem Vornamen in einer Spalte,
--	    in der Form: "Name, ersterVorname"
--	    (Bsp. Konkatenation: „Name || ´,´ || Vorname“), sowie die
--	    Note enthalten. Standardmäßig aufsteigend sortiert nach
--	    Lehrveranstaltung und Professor, absteigend nach Student
--	    und aufsteigend nach Note.
--
--      Frage: Wie lösen Sie das Problem, dass der ho_name sowohl für
--      Professoren als auch für Studenten benötigt wird? In wiefern
--      ist hierbei distinct zu verwenden bzw. welche Gefahr besteht durch
--      die Verwendung?
CREATE OR
REPLACE VIEW        dbs_v_pruefungen
AS SELECT DISTINCT  *
FROM (
    SELECT       l.lv_name, prof.name, h.ho_name || ',' || h.vorname as Name_ersterVorname, p.note
    FROM         dbs_tab_pruefung p
    INNER JOIN   dbs_v_professor prof ON p.professor = prof.pers_nr
    INNER JOIN   dbs_tab_lehrveranstaltung l ON p.lv_nr = l.lv_nr
    INNER JOIN   dbs_tab_student s ON p.matr_nr = s.matr_nr
    INNER JOIN   dbs_v_hochschulangehoeriger h ON s.ho_nr = h.ho_nr
    ORDER BY     l.lv_name ASC, prof.name ASC, h.ho_name DESC, h.vorname DESC, p.note ASC
);


--      Einfügen in Views
--
--      Testen Sie den Einfügevorgang in der zuvor erstellten View "Fachbereich".
--
--      Frage: Warum ist ein Einfügen möglich?
--      Weil es keine Gruppierung von Tabellen ist, sich nur auf eine tabelle beschränkt
--
INSERT INTO dbs_v_fachbereich
VALUES (
    4, 
    'Mathematik',
    509514    
);

--
--      Testen Sie den Einfügevorgang in die zuvor erstellte View
--      „Hochschulangehoeriger“.
--
--      Frage: Warum ist ein Einfügen hier grundsätzlich nicht möglich?
--      Weil die View Joins enthält und nicht nur auf einer Tabelle basiert
INSERT INTO dbs_v_hochschulangehoeriger 
VALUES ( 
    (SELECT MAX(ho_nr)+1 FROM dbs_v_hochschulangehoeriger),
    'Buche',
    'Peter',
    '40325',
    'Bonn',
    'Testweg',
    '45'
);


--
--      Änderung von Datensätzen in Views
--
--      Ändern Sie den Namen eines Fachbereichs in der zuvor erstellten
--      View „Fachbereich“.
--
--      Frage: Warum ist die Änderung möglich?
--      Weil es keine Gruppierung von Tabellen ist, sich nur auf eine tabelle beschränkt
UPDATE dbs_v_fachbereich
SET    fb_name = 'Numerik'  
WHERE  fb_name = 'Mathematik';


--
--     Ändern Sie den Namen eines Hochschulangehörigen in der zuvor
--     erstellten View "Hochschulangehoeriger".
--
--     Frage: Warum sollte diese Änderung grundsätzlich möglich sein?
--     Welcher Grund wird dennoch für die Ablehnung angegeben?
--     Weil die View auf mehreren Tabellen basiert und dadurch die Änderung in mehreren Tabellen durchgeführt werden muss
--
UPDATE dbs_v_hochschulangehoeriger
SET    ho_name = 'Baecker'
WHERE  ho_name = 'Becker';


--
--     Löschen von Datensätzen in Views
--
--     Löschen Sie den zuvor erstellten neuen Fachbereich in der View
--     "Fachbereich".
--
--     Frage: Warum ist die Löschung möglich?
--     Weil die View Joins enthält und nicht nur auf einer Tabelle basiert
DELETE
FROM    dbs_v_fachbereich
WHERE   fb_nr = '4';


--
--     Löschen Sie den Hochschulangehörigen mit der Nr. 1020 in der zuvor
--     erstellten View "Hochschulangehoeriger".
--
--     Frage: Warum sollte diese Löschung grundsätzlich möglich sein?
--     Welcher Grund wird dennoch für die Ablehnung angegeben?
--        The deleted table had
--           - no key-preserved tables,
--           - more than one key-preserved table, or
--           - the key-preserved table was an unmerged view.
--
DELETE
FROM    dbs_v_hochschulangehoeriger
WHERE   ho_nr = 1020;


--
-- Systemdatum
--
  SELECT user,
         TO_CHAR(SYSDATE, 'dd-mm-yy hh24:mi:ss')
  FROM   dual
  ;
--
spool off