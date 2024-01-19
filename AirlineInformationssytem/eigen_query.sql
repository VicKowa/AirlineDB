-- ***************************************************************
-- * File Name:                  eigen_query.sql
-- * File Creator:               Knolle
-- * CreationDate:               8.12.2023
-- *
-- * Student:                    vkowal2s
-- *
-- * <Ihre eigenen Kommentare>
-- *
-- ***************************************************************
--
-- *** Bitte verwenden Sie als Zeichenkodierung immer UTF-8    ***
--
-- ***************************************************************
-- * Datenbanksysteme WS 2023
-- * Anfragen auf der eigenen Datenbank
-- *
-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

set echo on
set linesize 80
set pagesize 50

--
-- ***************************************************************
-- * Spaltenformatierung (nur fuer die Formatierung Ihrer Ausgabe)
-- * Beispiele - bitte mit Ihren eigenen Attributen anpassen
--
-- column 	ho_name     format A20 WORD_WRAPPED
-- column 	beruf       format A25 WORD_WRAPPED
-- column 	fb_name     format A25 WORD_WRAPPED
-- column 	institution format A20 WORD_WRAPPED
-- column 	strasse     format A20 WORD_WRAPPED
-- column 	haus_nr     format A5  WORD_WRAPPED
-- column 	ort         format A15 WORD_WRAPPED
-- column 	titel       format A10 WORD_WRAPPED
-- column 	vorname     format A10 WORD_WRAPPED
-- column 	ort         format A20 WORD_WRAPPED
-- column 	fachgebiet  format A17 WORD_WRAPPED
-- column 	pers_nr     format A11 WORD_WRAPPED
column 	NULL        format A6  WORD_WRAPPED
--
-- Protokolldatei
--
spool ./eigen.log

-- Kommentieren Sie den folgenden Befehl ein, damit der SQL-Developer beim ersten Fehler abbricht.
--whenever sqlerror exit sql.sqlcode

-- </sqlplus>
--
-- ***************************************************************
-- * D I E    E I G E N E    D A T E N B A N K
--
--   BITTE BERÜCKSICHTIGEN SIE BEI DER LÖSUNG DER AUFGABEN DEN
--   KONKRETEN TEXT DES AUFGABENBLATTS!
--
--      5.1	Auswahl der Übungstabellen
--
--      Geben Sie die Struktur Ihrer vier ausgewählten Tabellen mit
--      dem „DESCRIBE“-Befehl aus.
--
-- <auswahl>

DESCRIBE ais_tab_pilot;

DESCRIBE ais_tab_flugzeug;

DESCRIBE ais_tab_duerfen_fliegen;

DESCRIBE ais_tab_flug;

-- </auswahl>

--     Hinweis: Fremdschlüssel-Constraints, die aus der Kette der vier
--     ausgewählten Tabellen herauszeigen, können Sie für die Übung gerne
--     deaktivieren, um keine Datensätze in weitere Tabellen einfügen zu
--     müssen.
--
-- <disable_fk>

ALTER TABLE ais_tab_flug DISABLE CONSTRAINT ais_fk_flug_copilot;
ALTER TABLE ais_tab_flug DISABLE CONSTRAINT ais_fk_flug_copilot;

ALTER TABLE ais_tab_flugzeug DISABLE CONSTRAINT ais_fk_flugzeug_zertifikat;

ALTER TABLE ais_tab_pilot DISABLE CONSTRAINT ais_fk_pilot_personal;

-- </disable_fk>

--      5.2	Import der Datenbank
--
--      Fügen Sie insgesamt mindestens 20 Datensätze in die von Ihnen
--      ausgewählten vier Tabellen ein. Um bei der Aufgabe 5.3 c) auch den
--      „outer join“ sinnvoll anwenden zu können und damit bei der Aufgabe 5.3 g)
--      mindestens ein Datensatz gefunden wird, achten Sie bitte darauf,
--      dass nicht alle Stammdatensätze der N:M-Beziehung von der
--      N:M-Beziehungstabelle aus referenziert werden.
--
--      Hinweis: Verwenden Sie hier bitte nur die einfache INSERT-Syntax, bei der die
--               Spaltennamen nicht angegeben werden, sondern Werte (und ggf. NULL-Werte)
--               für alle Spalten angegeben werden müssen:
--
--               INSERT INTO <tabelle> VALUES (<Wert1>, <Wert2>, ...);
--
-- <import>
--
--      Tabelle 1:
--

INSERT INTO ais_tab_pilot VALUES (0, 200);
INSERT INTO ais_tab_pilot VALUES (1, 300);
INSERT INTO ais_tab_pilot VALUES (2, 765);
INSERT INTO ais_tab_pilot VALUES (3, 1346);
INSERT INTO ais_tab_pilot VALUES (4, 8439);
INSERT INTO ais_tab_pilot VALUES (5, 5872);
INSERT INTO ais_tab_pilot VALUES (6, 7231);
INSERT INTO ais_tab_pilot VALUES (7, 5872);
INSERT INTO ais_tab_pilot VALUES (8, 15322);
INSERT INTO ais_tab_pilot VALUES (9, 20322);
INSERT INTO ais_tab_pilot VALUES (10, 21023);
INSERT INTO ais_tab_pilot VALUES (11, 5672);
INSERT INTO ais_tab_pilot VALUES (12, 8762);
INSERT INTO ais_tab_pilot VALUES (13, 9023);
INSERT INTO ais_tab_pilot VALUES (14, 15978);
INSERT INTO ais_tab_pilot VALUES (15, 18238);
INSERT INTO ais_tab_pilot VALUES (16, 12548);
INSERT INTO ais_tab_pilot VALUES (17, 2324);
INSERT INTO ais_tab_pilot VALUES (18, 6757);
INSERT INTO ais_tab_pilot VALUES (19, 13758);

--
--      Tabelle 2:
--

INSERT INTO ais_tab_flugzeug VALUES (0, 100, 'D56425', 'Boeing 737', 150, 'Alles top!', 0);
INSERT INTO ais_tab_flugzeug VALUES (1, 101, 'N12345', 'Boeing 737', 150, 'Alles in Ordnung!', 0);
INSERT INTO ais_tab_flugzeug VALUES (2, 102, 'D98765', 'Airbus A320', 180, 'Keine besonderen Vorkommnisse', 0);
INSERT INTO ais_tab_flugzeug VALUES (3, 103, 'G87654', 'Embraer E175', 76, 'Routineinspektion abgeschlossen', 0);
INSERT INTO ais_tab_flugzeug VALUES (4, 104, 'F23456', 'Bombardier CRJ900', 90, 'Überprüfung erfolgreich', 0);
INSERT INTO ais_tab_flugzeug VALUES (5, 105, 'A34567', 'Cessna Citation X', 8, 'Kleine Reparaturen abgeschlossen', 0);
INSERT INTO ais_tab_flugzeug VALUES (6, 106, 'H78901', 'Boeing 777', 300, 'Wartung erfolgreich durchgeführt', 0);
INSERT INTO ais_tab_flugzeug VALUES (7, 107, 'E65432', 'Airbus A330', 250, 'Reguläre Wartung durchgeführt', 0);
INSERT INTO ais_tab_flugzeug VALUES (8, 108, 'B54321', 'Gulfstream G550', 14, 'Alles im grünen Bereich', 0);
INSERT INTO ais_tab_flugzeug VALUES (9, 109, 'C87654', 'ATR 72', 70, 'Routinecheck abgeschlossen', 0);
INSERT INTO ais_tab_flugzeug VALUES (10, 110, 'D12345', 'Boeing 787', 290, 'Instandhaltungsarbeiten durchgeführt', 0);
INSERT INTO ais_tab_flugzeug VALUES (11, 111, 'N67890', 'Airbus A350', 320, 'Alles bestens!', 0);
INSERT INTO ais_tab_flugzeug VALUES (12, 112, 'D12213', 'Boeing 747', 400, 'Wartung erforderlich - Triebwerksüberprüfung notwendig', 1);
INSERT INTO ais_tab_flugzeug VALUES (13, 113, 'F78901', 'Boeing 707', 160, 'Kleine Reparaturen durchgeführt', 0);
INSERT INTO ais_tab_flugzeug VALUES (14, 114, 'A98765', 'Embraer E190', 96, 'Routineinspektion erfolgreich', 0);
INSERT INTO ais_tab_flugzeug VALUES (15, 115, 'G24872', 'Airbus A380', 555, 'Wartung erforderlich - Reifentausch notwendig', 1);
INSERT INTO ais_tab_flugzeug VALUES (16, 116, 'H65432', 'Boeing 757', 150, 'Alles im grünen Bereich', 0);
INSERT INTO ais_tab_flugzeug VALUES (17, 117, 'E54321', 'Sukhoi Superjet 100', 98, 'Überprüfung abgeschlossen', 0);
INSERT INTO ais_tab_flugzeug VALUES (18, 118, 'C12345', 'Bombardier Q400', 78, 'Routinecheck erfolgreich durchgeführt', 0);
INSERT INTO ais_tab_flugzeug VALUES (19, 119, 'F25345', 'Boing 777', 250, 'Dringende Wartung erforderlich - Triebwerksprobleme', 1);


--
--      Tabelle 3:
--

INSERT INTO ais_tab_duerfen_fliegen VALUES (8, 12);
INSERT INTO ais_tab_duerfen_fliegen VALUES (14, 16);
INSERT INTO ais_tab_duerfen_fliegen VALUES (9, 2);
INSERT INTO ais_tab_duerfen_fliegen VALUES (15, 1);
INSERT INTO ais_tab_duerfen_fliegen VALUES (2, 5);
INSERT INTO ais_tab_duerfen_fliegen VALUES (3, 3);
INSERT INTO ais_tab_duerfen_fliegen VALUES (4, 4);
INSERT INTO ais_tab_duerfen_fliegen VALUES (5, 3);
INSERT INTO ais_tab_duerfen_fliegen VALUES (9, 8);
INSERT INTO ais_tab_duerfen_fliegen VALUES (7, 7);
INSERT INTO ais_tab_duerfen_fliegen VALUES (8, 8);
INSERT INTO ais_tab_duerfen_fliegen VALUES (10, 18);
INSERT INTO ais_tab_duerfen_fliegen VALUES (9, 10);
INSERT INTO ais_tab_duerfen_fliegen VALUES (17, 2);
INSERT INTO ais_tab_duerfen_fliegen VALUES (13, 13);
INSERT INTO ais_tab_duerfen_fliegen VALUES (14, 14);
INSERT INTO ais_tab_duerfen_fliegen VALUES (15, 16);
INSERT INTO ais_tab_duerfen_fliegen VALUES (16, 16);
INSERT INTO ais_tab_duerfen_fliegen VALUES (17, 17);
INSERT INTO ais_tab_duerfen_fliegen VALUES (11, 15);


--
--      Tabelle 4:
--

INSERT INTO ais_tab_flug VALUES (8, 9, 12, 0,'AI124', 'FRA', 'LAX', TO_DATE('06-01-2024 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('06-01-2024 20:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (14, 10, 16, 1,'AI846', 'FRA', 'JFK', TO_DATE('08-01-2024 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('08-01-2024 20:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (9, 1, 2, 2, 'AI01', 'JFK', 'LAX', TO_DATE('07-01-2024 08:45:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('07-01-2024 18:45:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (15, 2, 1, 3, 'DL12', 'LAX', 'SYD', TO_DATE('09-01-2024 14:20:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('10-01-2024 06:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (2, 3, 5, 4, 'UA789', 'SYD', 'JFK', TO_DATE('11-01-2024 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('12-01-2024 22:15:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (3, 4, 3, 5, 'QF123', 'JFK', 'LAX', TO_DATE('13-01-2024 15:30:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('14-01-2024 10:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (4, 5, 4, 6, 'LH456', 'LAX', 'FRA', TO_DATE('14-01-2024 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('15-01-2024 07:45:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (5, 6, 3, 7, 'AF789', 'FRA', 'CDG', TO_DATE('16-01-2024 09:30:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('16-01-2024 11:15:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (9, 7, 8, 8, 'BA234', 'CDG', 'LHR', TO_DATE('17-01-2024 14:45:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('17-01-2024 16:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (7, 8, 7, 9, 'SQ567', 'LHR', 'SIN', TO_DATE('18-01-2024 22:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('19-01-2024 18:15:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (8, 9, 8, 10, 'EK789', 'SIN', 'DXB', TO_DATE('20-01-2024 05:30:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('20-01-2024 09:45:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (9, 10, 10, 11, 'TK123', 'DXB', 'IST', TO_DATE('22-01-2024 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('22-01-2024 13:45:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (10, 11, 18, 12, 'QA01', 'IST', 'DOH', TO_DATE('22-01-2024 17:15:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('22-01-2024 21:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (11, 12, 15, 13, 'ANA01', 'DOH', 'NRT', TO_DATE('23-01-2024 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('23-01-2024 11:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (17, 13, 2, 14, 'DL01', 'NRT', 'ATL', TO_DATE('24-01-2024 13:45:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('25-01-2024 05:00:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (13, 14, 13, 15, 'UA01', 'ATL', 'SFO', TO_DATE('26-01-2024 09:30:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('26-01-2024 12:15:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (14, 15, 14, 16, 'LH782', 'SFO', 'MUC', TO_DATE('27-01-2024 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('27-01-2024 20:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (15, 16, 16, 17, 'AF869', 'MUC', 'CDG', TO_DATE('28-01-2024 07:45:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('28-01-2024 10:30:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (16, 17, 16, 18, 'BA432', 'CDG', 'LHR', TO_DATE('29-01-2024 12:30:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('29-01-2024 14:15:00', 'DD-MM-YYYY HH24:MI:SS'));
INSERT INTO ais_tab_flug VALUES (17, 18, 17, 19, 'EK434', 'LHR', 'DXB', TO_DATE('30-01-2024 18:45:00', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('30-01-2024 22:30:00', 'DD-MM-YYYY HH24:MI:SS'));


COMMIT;

-- ROLLBACK;
--
-- </import>

--
--      5.3 Lesen der Datensätze
--
--      Testen Sie Ihre Datenbank, indem Sie die folgenden Anfragen
--      durchführen:
--
--      5.3 a)  Jeweils Anzeige aller Daten Ihrer vier Tabellen.
--
--      Tabelle 1:
--
-- <53a>

SELECT   *
FROM    ais_tab_pilot;

--
--      Tabelle 2:
--

SELECT   *
FROM    ais_tab_flugzeug;


--
--      Tabelle 3:
--

SELECT   *
FROM    ais_tab_duerfen_fliegen;


--
--      Tabelle 4:
--

SELECT   *
FROM    ais_tab_flug;

-- </53a>

--
--      5.3 b)  Einen (natürlichen) Verbund, der die Datensätze der vier Tabellen
--              semantisch sinnvoll verbunden ausgibt (Primär- und Fremdschlüsselwerte bitte weglassen).

-- <53b>

SELECT p.personal_id, fz.flugzeug_id, fz.kennzeichen, fz.typ, f.flugnr, f.von, f.zu, f.abflug, f.ankunft
FROM    ((
            ais_tab_pilot p
            INNER JOIN  ais_tab_duerfen_fliegen df 
            ON          p.Personal_ID = df.Personal_ID
        )
        INNER JOIN  ais_tab_flugzeug fz 
        ON          df.Flugzeug_ID = fz.Flugzeug_ID
    )
INNER JOIN  ais_tab_flug f 
ON          fz.Flugzeug_ID = f.Flugzeug_ID;

-- </53b>

--
--      5.3 c)  Einen „vollständigen“ Verbund, der alle Datensätze der an der „N:M“-Beziehung direkt
--              beteiligten drei Tabellen semantisch sinnvoll verbunden ausgibt (Primär- und Fremdschlüssel-
--              werte bitte weglassen). Geben Sie hierbei (im Unterschied zu 5.3 b) ) auch solche
--              Datensätze der „linken“ und „rechten“) Tabelle aus, wenn diese nicht an der Beziehung
--              teilnehmen („outer join“, siehe Hinweis unter 5.2 e) auf dem Übungsblatt.
-- <53c>

SELECT           p.personal_id, fz.flugzeug_id
FROM             ais_tab_pilot p
FULL OUTER JOIN  ais_tab_duerfen_fliegen df
ON               p.personal_id = df.personal_id
FULL OUTER JOIN  ais_tab_flugzeug fz
ON               df.flugzeug_id = fz.flugzeug_id
ORDER BY         p.personal_id;

-- </53c>

--
--      5.3 d)  Eine semantisch sinnvoll aggregierte Ausgabe, die über
--              eine „GROUP BY“- und „HAVING“-Klausel verfügt.
--
-- <53d>

SELECT      flugzeug_id, AVG((ankunft-abflug) * 24) as flugdauer_in_h
FROM        ais_tab_flug
GROUP BY    flugzeug_id
HAVING      AVG((ankunft - abflug) * 24) < 10;

-- </53d>

--
--      5.3 e)	Bestimmen (berechnen) Sie den nächsten freien Primärschlüsselwert für die „linke“
--              (oder „rechte“) an der „N:M“-Beziehung beteiligte Tabelle mit Hilfe von SQL.
--              Die nächste freie Schlüsselnummer erhält man mit einem Statement der Form:
--              "SELECT MAX(<spalte>)+1 FROM <tabelle>".
--
-- <53e>


SELECT MAX(personal_id) + 1 AS next_free_id FROM ais_tab_pilot;

-- </53e>

--
--      5.3 f)  Wie lauten die Primärschlüsselwerte der Datensätze der „N:M“-Beziehungstabelle, die über
--              die kleinsten zusammengesetzten Primärschlüssel verfügen (die Summe beider Attributwerte
--              des zusammengesetzten Schlüssels ergibt den kleinsten Wert innerhalb der „N:M“-
--              Beziehungstabelle).
--
-- <53f>

SELECT  MIN(personal_id) as min_pers_id , MIN(flugzeug_id) as min_flz_id
FROM    ais_tab_duerfen_fliegen
WHERE   personal_id + flugzeug_id = (
    SELECT  MIN(personal_id + flugzeug_id)
    FROM    ais_tab_duerfen_fliegen
);

-- </53f>


--
--
--      5.3 g)  Zeigen Sie ausschließlich solche Datensätze der „linken“ (oder „rechten“) „N:M“-Tabelle an, die nicht von
--              der „N:M“-Beziehungstabelle referenziert werden (siehe Hinweis unter 5.2 e auf dem Übungsblatt).
--
-- <53g>


    
SELECT      f.*
FROM        ais_tab_flugzeug f
LEFT JOIN   ais_tab_duerfen_fliegen df 
ON          f.flugzeug_id = df.flugzeug_id
WHERE       df.flugzeug_id IS NULL;

-- </53g>

-- ***************************************************************
-- * SQL*plus Job Control Section
--
-- <sqlplus>

spool off

-- </sqlplus>
