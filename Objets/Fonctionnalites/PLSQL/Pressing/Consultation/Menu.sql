PROMPT Veuillez choisir parmi cette liste, ce que vous souhaiter consulter
PROMPT              1 - la liste des agences d'un pressing
PROMPT              1 - la liste des agents
PROMPT              2 - la liste des services d'une agence
PROMPT              3 - la liste des annonces d'un pressing
PROMPT              A - Sortir
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF --Blockage de l'affichage du resultat de l'instruction select
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script --Conservation de la valeur de la variable script dans la variable v_script
SELECT CASE '&mon_choix'
            WHEN '1' THEN 'Objets/Fonctionnalites/Agence/Consultation/EX_ListeAgence.sql'
            WHEN '2' THEN ''
            WHEN '3' THEN ''
            WHEN '4' THEN ''
            WHEN 'A' THEN ''
            ELSE 'Objets/Fonctionnalites/Pressing/Consultation/ERR_Choix.sql'
        END AS script -- recuperation du chemin d'accès menant à la fonctionnalité recherché
FROM DUAL;
SET TERM ON
@&v_script --Execution du chemin d'accès de la fonctionnalité choisie