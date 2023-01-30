UNDEFINE id_pressing
UNDEFINE id_agence_entree
UNDEFINE nom_utili
UNDEFINE nom_quartier_agence
PROMPT Veuillez choisir parmi cette liste, ce que vous souhaiter consulter
PROMPT              1 - la liste des agences d'un pressing
PROMPT              A - Sortir
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN '1' THEN 'Objets/Fonctionnalites/SQLPLUS/Agence/Consultation/EX_Liste_Agence.sql'
            WHEN '2' THEN ''
            WHEN '3' THEN ''
            WHEN '4' THEN ''
            WHEN 'A' THEN ''
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Pressing/Consultation/ERR_Choix.sql'
        END AS script 
FROM DUAL;
SET TERM ON
@&v_script 