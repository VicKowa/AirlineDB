-- ***************************************************************
-- * File Name:                  dbs_query.sql                   *
-- * File Creator:               Knolle                          *
-- * CreationDate:               12 December 2023                 *
-- *                                                             *
-- * <ChangeLogDate>             <ChangeLogText>                 *
-- ***************************************************************
--
-- ***************************************************************
-- * Datenbanksysteme WS 2023/24
-- * Uebungen 6, 7
--
-- ***************************************************************
-- * SQL*plus Job Control Section
--
set 	echo 		on
set 	linesize 	128
set 	pagesize 	50
--
-- Spaltenformatierung (nur fuer die Ausgabe)
--
column 	lv_name     format A35 WORD_WRAPPED
column 	beruf       format A30 WORD_WRAPPED
column 	fb_name     format A35 WORD_WRAPPED
column 	institution format A20 WORD_WRAPPED
column 	strasse     format A20 WORD_WRAPPED
column 	ort         format A20 WORD_WRAPPED
column 	lv_name     format A30 WORD_WRAPPED
column 	titel       format A20 WORD_WRAPPED
column 	vorname     format A20 WORD_WRAPPED
column 	ort         format A20 WORD_WRAPPED
column 	fachgebiet  format A20 WORD_WRAPPED
column 	pers_nr     format A15 WORD_WRAPPED
column 	ho_name     format A20 WORD_WRAPPED
--
-- Protokolldatei
--
spool ./dbs_query.log
--
-- Systemdatum
--
  SELECT user,
         TO_CHAR(SYSDATE, 'dd-mm-yy hh24:mi:ss')
  FROM   dual
  ;
--
-- ***************************************************************
-- * S Q L - B E I S P I E L A N F R A G E N
--
-- 	3.1	Projektion
--
-- 	3.1.1	Auswählen von Eigenschaften (Spalten)
--
--	Wie lauten die Namen aller Lehrveranstaltungen? (Anzahl Datensätze: 12)
--
-- <311a>
SELECT  lv_name
FROM    dbs_tab_lehrveranstaltung;



-- </311a>
--
--	Welche Berufe haben die Mitarbeiter und wie hoch ist ihr
--	Gehalt? (Anzahl Datensätze: 14)
--
-- <311b>
SELECT  beruf, gehalt
FROM    dbs_tab_mitarbeiter;



-- </311b>

--
--	Wie lauten die Daten der Tabelle 'Professor'? (Anzahl Datensätze: 6)
--
-- <311c>
SELECT  *
FROM    dbs_tab_mitarbeiter
WHERE   beruf = 'Professor';
    


-- </311c>


--
-- 	3.1.2	Umbenennen von Spalten
--
--	Die Daten der Tabelle 'Gebaeude' sollen ausgegeben werden,
-- 	wobei die Spalte 'haus_nr' in 'Hausnummer' umzubenennen ist. (Anzahl Datensätze: 6)
--
-- <312>
SELECT  haus_nr AS Hausnummer, gebaeude, strasse
FROM    dbs_tab_gebaeude;



-- </312>

--
-- 	3.1.3	Berechnen bzw. Ableiten von neuen Eigenschaften (Spalten)
--
--	Die Orte der Anschriften sollen mit der Landeskennung '(D)' ausgegeben werden
--	(künstliche Spalte mit konstantem Wert). (Anzahl Datensätze: 35)
--
-- <313a>
SELECT  ort,
        '(D)' as Landeskennung
FROM dbs_tab_anschrift;


-- </313a>

--
--	Zu jeder Personalnummer soll der Stundenlohn ausgegeben und als
--	solcher benannt werden (Monat = 20 Tage zu je 8 Stunden). (Anzahl Datensätze: 14)
--
-- <313b>
SELECT  pers_nr,
        (gehalt / 20) / 8 AS Stundenlohn
FROM    dbs_tab_mitarbeiter;


-- </313b>

--
--	3.2	Selektion
--
--	3.2.1	Ausblenden identischer Zeilen
--
--	In welchen unterschiedlichen Orten leben die
--	Hochschulangehörigen? (Anzahl Datensätze: 11)
--
-- <321a>
SELECT DISTINCT ort
FROM    dbs_tab_anschrift;



-- </321a>

--
--	Zu welchen Zeiten wird in der Woche gelehrt? (Anzahl Datensätze: 11)
--
-- <321b>
SELECT DISTINCT zeit, tag
FROM dbs_tab_prof_haelt_lv;


-- </321b>

--
--	3.2.2	Sortierung der Ausgabe
--
--	Die Personalnummern sind aufsteigend nach ihrem zugehörigen
--  Gehalt auszugeben. (Anzahl Datensätze: 14)
--
-- <322a>
SELECT  pers_nr
FROM    dbs_tab_mitarbeiter
ORDER BY gehalt ASC;



-- </322a>

--
--	Die Orte und Straßen sind absteigend sortiert nach Ort und bei
--  gleichen Orten sind diese aufsteigend nach 'Strasse' auszugeben. (Anzahl Datensätze: 35)
--
-- <322b>
SELECT  ort, strasse
FROM    dbs_tab_anschrift
ORDER BY ort DESC, strasse ASC;


-- </322b>

--
--	3.2.3	Auswahl bestimmter Tupel (Zeilen, Informationsträger)
--
--	Welche Gebäude werden am Montag belegt? (Anzahl Datensätze: 2)
--
-- <323a>
SELECT  gebaeude
FROM    dbs_tab_lv_ort
WHERE   tag = 'Mo';

    


-- </323a>

--
--	Wie lauten die Personalnummern derjenigen Mitarbeiter, die weniger
--	als 20 € in der Stunde verdienen? (Anzahl Datensätze: 8)
--
-- <323b>

SELECT  pers_nr, gehalt
FROM    dbs_tab_mitarbeiter
WHERE   ((gehalt / 20) / 8) < 20;



-- </323b>

--
--	3.2.4	Auswahl von Tupeln, die mehreren Bedingungen genügen
--
--	Es sollen die Nummern der Lehrveranstaltungen ausgegeben werden,
--  die im Gebäude 'C' oder freitags abgehalten werden. (Anzahl Datensätze: 11)
--
-- <324a>

SELECT  lv_nr
FROM    dbs_tab_lv_ort
WHERE   gebaeude = 'C' OR tag = 'Fr';



-- </324a>

--
--	Welche Mitarbeiter des Fachbereichs 2 verdienen mehr als
--	5.000 €? (Anzahl Datensätze: 4)
--
-- <324b>

SELECT  pers_nr
FROM    dbs_tab_mitarbeiter
WHERE   gehalt > 5000 AND fb_Nr = 2;



-- </324b>

--
--	3.2.5	Vergleich mit einem Muster
--
--	Welche Hochschulangehörige mit einem Namen, der wie 'Meier'
--	ausgesprochen wird, werden im System verwaltet? (Anzahl Datensätze: 3)
--
-- <325a>
SELECT  ho_name
FROM    dbs_tab_hochschulangehoeriger
WHERE   ho_name LIKE 'M__er';


-- </325a>

--
--	Welche unterschiedlichen Vornamen die mit 'M' beginnen
--	existieren im System? (Anzahl Datensätze: 4)
--
-- <325b>
SELECT  vorname
FROM    dbs_tab_vorname
WHERE   vorname LIKE 'M%';



-- </325b>

--
--	Welche Fachgebiete von Professoren enthalten das Wort
--	'system'? (Anzahl Datensätze: 2)
--
-- <325c>
SELECT  fachgebiet
FROM    dbs_tab_professor
WHERE   fachgebiet LIKE '%system%';



-- </325c>

--
--	3.2.6	Vergleich mit NULL-Werten
--
--	Gebe die Matrikelnummern solcher Studenten aus, die einen Job
--	haben. (Anzahl Datensätze: 8)
--
-- <326a>
SELECT  matr_nr
FROM    dbs_tab_student
WHERE   pers_nr IS NOT NULL;



-- </326a>

--
--	Gebe die Daten der Studenten aus, deren Personalnummer nicht dem Wert
--	507263 entsprechen. (Anzahl Datensätze: 19)
--
-- <326b>
SELECT  *
FROM    dbs_tab_student
WHERE   pers_nr != '507263' OR pers_nr IS NULL;



-- </326b>

--
--	3.3	Verbund von Tabellen
--
--	3.3.1	Equi-Join
--
--	Gebe eine Liste aller Fachbereichsnamen mit den Namen ihrer
--	zugehörigen Lehrveranstaltungen aus. (Anzahl Datensätze: 12)
--
-- <331a>
SELECT  f.fb_name, 
        l.lv_name
FROM    dbs_tab_fachbereich f,
        dbs_tab_lehrveranstaltung l
WHERE   f.fb_nr = l.fb_nr;



-- </331a>

--
--	neue Syntax:
--
-- <331a_neu>
SELECT      f.fb_name, 
            l.lv_name
FROM        dbs_tab_fachbereich f
INNER JOIN  dbs_tab_lehrveranstaltung l
ON          f.fb_nr = l.fb_nr;





-- </331a_neu>

--
--	In welchen unterschiedlichen Straßen finden am Freitag
--	Lehrveranstaltungen statt? (Anzahl Datensätze: 1)
--
-- <331b>

SELECT  DISTINCT    g.strasse
FROM    dbs_tab_gebaeude g,
        dbs_tab_lv_ort lo
WHERE   g.gebaeude = lo.gebaeude
AND     lo.tag = 'Fr';




-- </331b>

--
--	neue Syntax:
--
-- <331b_neu>

SELECT  DISTINCT    g.strasse
FROM        dbs_tab_gebaeude g
INNER JOIN  dbs_tab_lv_ort lo
ON          g.gebaeude = lo.gebaeude
AND         lo.tag = 'Fr';



-- </331b_neu>

--
--	Welche Studenten arbeiten nicht am Fachbereich, an dem
--	sie eingeschrieben sind? (Anzahl Datensätze: 4)
--
-- <331c>

SELECT  s.matr_nr
FROM    dbs_tab_student s,
        dbs_tab_mitarbeiter m
WHERE   s.pers_nr = m.pers_nr
AND     m.fb_nr != s.fb_nr;



-- </331c>

--
--	neue Syntax:
--
-- <331c_neu>

SELECT      s.matr_nr
FROM        dbs_tab_student s
INNER JOIN  dbs_tab_mitarbeiter m
ON          s.pers_nr = m.pers_nr
AND         m.fb_nr != s.fb_nr;



-- </331c_neu>

--
--	Wie lautet die Adresse des Professors des Fachgebiets
--	'Mathematik'? (Anzahl Datensätze: 1)
--
-- <331d>
SELECT  a.plz, a.ort, a.strasse
FROM    dbs_tab_anschrift a,
        dbs_tab_mitarbeiter m,
        dbs_tab_professor p
WHERE   a.ho_nr = a.ho_nr
AND     m.ho_nr = a.ho_nr
AND     m.pers_nr = p.pers_nr
AND     p.fachgebiet = 'Mathematik';



-- </331d>

--
--	neue Syntax:
--
-- <331d_neu>

SELECT  a.plz, a.ort, a.strasse
FROM    ( dbs_tab_anschrift a
         INNER JOIN dbs_tab_mitarbeiter m
         ON m.ho_nr = a.ho_nr
        )
        INNER JOIN dbs_tab_professor p
        ON m.pers_nr = p.pers_nr
WHERE   p.fachgebiet = 'Mathematik';



-- </331d_neu>

--
--	3.3.2	Equi-Join mit NULL-Werten (Outer Equi-Join)
--
--	In welchen Institutionen arbeiten Studenten? Zeige auch solche
--	Studenten an, die nicht arbeiten. (Anzahl Datensätze: 20)
--
--	spezielle Oracle Syntax (+):
--
-- <332>

SELECT  m.institution, s.matr_nr
FROM    dbs_tab_mitarbeiter m,
        dbs_tab_student s
WHERE   m.pers_nr (+) = s.pers_nr;


-- </332>

--
--	neue Syntax:
--
-- <332_neu>

SELECT      m.institution, s.matr_nr
FROM        dbs_tab_mitarbeiter m
INNER JOIN  dbs_tab_student s
ON          m.pers_nr (+) = s.pers_nr;


-- </332_neu>

--
--	3.3.3	Theta-Join
--
--  Gebe eine Namensliste mit Spielpaarungen aus, in der die
--  Personalnummer des ersten Spielers größer ist als die des
--  zweiten Spielers, wobei alle Personalnummern größer
--  als 508000 sein sollen. (Anzahl Datensätze: 36)
--
-- <333>

SELECT  ha1.ho_name AS Spieler1, ha2.ho_name AS Spieler2
FROM    dbs_tab_hochschulangehoeriger ha1,
        dbs_tab_hochschulangehoeriger ha2,
        dbs_tab_mitarbeiter m1,
        dbs_tab_mitarbeiter m2
WHERE   ha1.ho_nr = m1.ho_nr
AND     ha2.ho_nr = m2.ho_nr
AND     m1.pers_nr > 508000
AND     m1.pers_nr > 508000
AND     m1.pers_nr < m2.pers_nr;






-- </333>

--
--	neue Syntax:
--
-- <333_neu>

SELECT      ha1.ho_name AS Spieler1, ha2.ho_name AS Spieler2
FROM        (dbs_tab_hochschulangehoeriger ha1
    INNER JOIN  dbs_tab_mitarbeiter m1 
    ON          ha1.ho_nr = m1.ho_nr 
    AND         m1.pers_nr > 508000)
INNER JOIN (dbs_tab_hochschulangehoeriger ha2
    INNER JOIN  dbs_tab_mitarbeiter m2 
    ON          ha2.ho_nr = m2.ho_nr 
    AND         m2.pers_nr > 508000)
ON      ha2.ho_nr = m2.ho_nr
WHERE   m1.pers_nr < m2.pers_nr;



-- </333_neu>

--
--  Ab hier Übung 7
--

--	3.4	Mengenoperationen
--
--	3.4.1	Vereinigung von Tabellen
--
--	Wie lautet die Menge der Personalnummern, die Professoren oder
--	Studenten gehören? (Anzahl Datensätze: 14)
--
-- <341>

SELECT  p.pers_nr
FROM    dbs_tab_professor p
WHERE   p.pers_nr IS NOT NULL 
UNION
SELECT  s.pers_nr
FROM    dbs_tab_student s
WHERE   s.pers_nr IS NOT NULL; 


-- </341>

--
--	3.4.2	Schneiden von Tabellen
--
--	Finde die Personalnummern der Mitarbeiter heraus, die Professor
--	sind und mehr als 5.200 € verdienen. (Anzahl Datensätze: 3)
--
-- <342>
SELECT  m.pers_nr
FROM    dbs_tab_mitarbeiter m
WHERE   m.beruf = 'Professor' AND m.gehalt > 5200
INTERSECT
SELECT  p.pers_nr
FROM    dbs_tab_professor p;

-- </342>

--
--	... auch formulierbar als join:
--
-- <342_join>
SELECT      m.pers_nr
FROM        dbs_tab_professor p
INNER JOIN  dbs_tab_mitarbeiter m 
ON          p.pers_nr = m.pers_nr
WHERE       m.gehalt > 5200;


-- </342_join>

--
--	3.4.3	Differenz von Tabellen
--
--	Wie lauten die Personalnummern solcher Mitarbeiter, die nicht
--	Student sind? (Anzahl Datensätze: 6)
--
-- <343>
SELECT  m.pers_nr
FROM    dbs_tab_mitarbeiter m
MINUS
SELECT  s.pers_nr
FROM    dbs_tab_student s;


-- </343>

--
--	3.5	Aggregatfunktionen
--
--	3.5.1	Vollständige Verdichtung
--
--	Wieviele Mitarbeiter werden beschäftigt? (Anzahl Datensätze: 1)
--
-- <351a>
SELECT  COUNT(*)
FROM    dbs_tab_mitarbeiter m;

-- </351a>

--
--	Wie lautet das höchste, das niedrigste und das
--	durchschnittliche Gehalt, sowie die Summe der Gehälter der
--	Mitarbeiter? (Anzahl Datensätze: 1)
--
-- <351b>
SELECT  MAX(m.gehalt) as höchstes_Gehalt, 
        MIN(m.gehalt) as niedrigstes_Gehalt, 
        AVG(m.gehalt) as durchschnittliche_Gehalt, 
        SUM(m.gehalt) as Summe_der_Gehälter
FROM    dbs_tab_mitarbeiter m;


-- </351b>

--
--	3.5.2	Gruppierung von Verdichtungen
--
--	Wie lauten die Durchschnittsgehälter der Mitarbeiter
--	für jeden Fachbereich? (Anzahl Datensätze: 3)
--
-- <352b>
SELECT      fb_Nr, AVG(gehalt) as durchschnittliche_Gehalt
FROM        dbs_tab_mitarbeiter 
GROUP BY    fb_Nr;


-- </352b>

--
--	Wie lauten die Durchschnittsgehälter der Mitarbeiter
--	für jeden Fachbereich, wenn diese über 5.000 € liegen? (Anzahl Datensätze: 1)
--

-- <352c>
SELECT      fb_Nr, AVG(gehalt) as avg_Gehalt
FROM        dbs_tab_mitarbeiter 
GROUP BY    fb_Nr
HAVING      AVG(gehalt) > 5000;

-- </352c>

--
--	3.6	Unterabfragen
--
--	3.6.1	'IN'-Operator
--
--	Wie lauten die Namen der Mitarbeiter die nicht in Bonn
--	wohnen? (Anzahl Datensätze: 13)
--

-- <361a>
SELECT  ho_name
FROM    dbs_tab_hochschulangehoeriger
WHERE   ho_nr IN (
        SELECT  ho_nr
        FROM    dbs_tab_anschrift
        WHERE   ort != 'Bonn'
);


-- </361a>

--
--	... auch allgemeiner formulierbar als Join:
--

-- <361a_join>
SELECT      h.ho_name
FROM        dbs_tab_hochschulangehoeriger h
INNER JOIN  dbs_tab_anschrift a
ON          h.ho_nr = a.ho_nr
WHERE       ort != 'Bonn';

-- </361a_join>

--
--	3.6.2	Vergleichsoperatoren
--
--	Welcher (!) Hochschulangehörige wohnt im Auerweg?
--	Achtung: warum "darf" bei "=" in dieser Anfrage nur eine
--	Person im Auerweg wohnen? (Anzahl Datensätze: 1)
--
-- <362a>
SELECT  ho_nr
FROM    dbs_tab_anschrift
WHERE   ho_nr = ANY(
        SELECT  ho_nr
        FROM    dbs_tab_hochschulangehoeriger
        
)
AND  strasse = 'Auerweg';


-- </362a>
--
--	... auch formulierbar als Join (hier dürfen jedoch auch
--	mehrere Personen im Auerweg wohnen):
--
-- <362a_join>

SELECT      h.ho_nr
FROM        dbs_tab_hochschulangehoeriger h
INNER JOIN  dbs_tab_anschrift a
ON          a.ho_nr = h.ho_nr
WHERE       a.strasse = 'Auerweg';

-- </362a_join>
--
--	Wie lauten die Namen der Studenten, die zeitlich später
--	(mit größerer ho_nr) als Meyer erfasst worden sind? (Anzahl Datensätze: 13)
--
-- <362b>
SELECT  ho_name 
FROM    dbs_tab_hochschulangehoeriger
WHERE   ho_nr = ANY (
    SELECT  ho_nr
    FROM    dbs_tab_student
    WHERE   ho_nr > (
        SELECT  ho_nr
        FROM    dbs_tab_hochschulangehoeriger
        WHERE   ho_name = 'Meyer' 
    )
); 
    

-- </362b>
--
--	6.3	Existenzabfragen
--
--	Welche Fachbereiche bieten keine Lehrveranstaltungen an? (Anzahl Datensätze: 1)
--
-- <363a>
SELECT  fb_Nr
FROM    dbs_tab_fachbereich f
WHERE NOT EXISTS (
    SELECT  *
    FROM    dbs_tab_lehrveranstaltung lv
    WHERE   f.fb_NR = lv.fb_Nr
);


-- </363a>
--
--	Welche Professoren (Personalnummern) halten
--	Lehrveranstaltungen(mindestens eine)? (Anzahl Datensätze: 3)
--
-- <363b>

SELECT  pers_nr
FROM    dbs_tab_professor p 
WHERE   EXISTS (
    SELECT  *
    FROM    dbs_tab_prof_haelt_lv hlv
    WHERE   p.pers_nr = hlv.pers_nr
);


-- </363b>
--
--	3.6.4	All-Quantor
--
--	Welche Mitarbeiter erhalten das größte Gehalt? (Anzahl Datensätze: 2)
--
-- <364a>
SELECT  pers_nr
FROM    dbs_tab_mitarbeiter
WHERE   gehalt >= ALL (
    SELECT  gehalt
    FROM    dbs_tab_mitarbeiter
);


-- </364a>
--
--	Welche Mitarbeiter verdienen weniger als andere? (Anzahl Datensätze: 12)
--
-- <364b>
SELECT  pers_nr
FROM    dbs_tab_mitarbeiter
WHERE   gehalt < ANY (
    SELECT  gehalt
    FROM    dbs_tab_mitarbeiter
);


-- </364b>
--
-- Systemdatum
--
  SELECT user,
         TO_CHAR(SYSDATE, 'dd-mm-yy hh24:mi:ss')
  FROM   dual
  ;
--
spool off
