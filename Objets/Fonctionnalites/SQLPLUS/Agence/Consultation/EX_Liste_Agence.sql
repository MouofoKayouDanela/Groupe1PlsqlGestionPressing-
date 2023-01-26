EXECUTE PA_CONSULTATION_AGENCE.PO_CONSULTER_AGENCE('&&id_pressing')
PROMPT              1 - la liste des agents
PROMPT              2 - la liste des services d'une agence
PROMPT              3 - la liste des annonces d'un agence
PROMPT              A - Retour
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN '1' THEN 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/EX_Liste_Agents'
            WHEN '2' THEN ''
            WHEN '3' THEN ''
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Pressing/Consultation/Menu'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Agence/Consultation/ERR_Choix'
        END script
FROM DUAL;
SET TERM ON
@&v_script