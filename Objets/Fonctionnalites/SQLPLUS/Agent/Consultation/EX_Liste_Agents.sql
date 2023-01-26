EXECUTE PA_CONSULTATION_AGENT.PO_LISTE_AGENT('&nom_quartier_agence')
PROMPT          1 - CONSULTER LE PROFIL D'UN AGENT
PROMPT          A - SORTIR
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF --Blockage de l'affichage des résultats de sélection
COLUMN script NEW_VALUE v_script --Conservation de la valeur de la variable script dans la variable v_script
SELECT CASE '&mon_choix'
            WHEN '1' THEN ''
            WHEN 'A' THEN ''
            ELSE ''
        END AS script -- recuperation du chemin d'accès menant à la fonctionnalité recherché
FROM    DUAL;
SET TERM ON --Deblockage de l'affichage des résultats de sélection
@&v_script --Execution du chemin d'accès de la fonctionnalité choisie