-- ***************************************************************
-- * File Name:                  dbs_intern.sql                  *
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
--spool dbs_intern.log


-- Index Section
-- _____________

create index dbs_id_anschrift_ho_nr
  	  on dbs_tab_anschrift (ho_nr)
;
create index dbs_id_fachbereich_dekan
  	  on dbs_tab_Fachbereich (dekan)
;

create index dbs_id_lv_ort_gebaeude
  	  on dbs_tab_lv_ort (gebaeude)
;
create index dbs_id_lv_ort_lv_nr
  	  on dbs_tab_lv_ort (lv_nr)
;
create index dbs_id_mitarbeiter_fb_nr
  	  on dbs_tab_mitarbeiter (fb_nr)
;

create index dbs_id_lehrveranstaltung_fb_nr
  	  on dbs_tab_lehrveranstaltung (fb_nr)
;
create index dbs_id_prof_haelt_lv_pers_nr
  	  on dbs_tab_prof_haelt_LV (pers_Nr)
;
create index dbs_id_prof_haelt_lv_l_t_z
  	  on dbs_tab_prof_haelt_LV (lv_nr, tag, zeit)
;

create index dbs_id_student_fb_nr
  	  on dbs_tab_student (fb_nr)
;

create index dbs_id_pruefung_matr_nr
  	  on dbs_tab_pruefung (matr_nr)
;
create index dbs_id_vorname_ho_nr
  	  on dbs_tab_vorname (ho_nr)
;

-- ***************************************************************
-- * SQL*plus Job Control Section

--spool off
