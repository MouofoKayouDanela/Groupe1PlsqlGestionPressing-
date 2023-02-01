EXECUTE PA_CONSULTATION_AGENCE.PO_CONSULTER_AGENCE('&&id_pressing')
PROMPT              1 - la liste des agents
PROMPT              2 - la liste des services d'une agence
PROMPT              3 - la liste des linges que traite une agence
PROMPT              4 - la liste des annonces d'une agence
PROMPT              5 - la liste des promotions d'une agence
PROMPT              A - Retour
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN '1' THEN 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/EX_Liste_Agents'
            WHEN '2' THEN 'Objets/Fonctionnalites/SQLPLUS/Service_Agence/Consultation/EX_Liste_Service_Agence'
            WHEN '3' THEN 'Objets/Fonctionnalites/SQLPLUS/Linge_Agence/Consultation/EX_Liste_Linge_Agence' 
            WHEN '4' THEN 'Objets/Fonctionnalites/SQLPLUS/Annonce/Consultation/EX_Liste_Annonce'
            WHEN '5' THEN 'Objets/Fonctionnalites/SQLPLUS/Promotion/Consultation/EX_Liste_Promotion'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Pressing/Consultation/Menu'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Agence/Consultation/ERR_Choix'
        END script
FROM DUAL;
SET TERM ON
@&v_script