EXECUTE PA_CONSULTATION_AGENCE.PO_CONSULTER_AGENCE(id_pressing)
PROMPT          A - Retour
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF --Blockage de l'affichage du resultat de l'instruction select
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script --Conservation de la valeur de la variable script dans la variable v_script
SELECT CASE '&mon_choix'
            WHEN 'A' THEN 'Objets/Fonctionalites/Pressing/Consultation/Menu'
            ELSE 'Objets/Fonctionnalite/Agence/Consultation/ERR_Choix'
        END AS script -- recuperation du chemin d'accès menant à la fonctionnalité recherché
FROM DUAL;
SET TERM ON
@&v_script --Execution du chemin d'accès de la fonctionnalité choisie