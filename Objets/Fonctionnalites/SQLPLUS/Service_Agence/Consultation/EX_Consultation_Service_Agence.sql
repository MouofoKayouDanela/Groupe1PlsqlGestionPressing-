ACCEPT nom_quartier_agence CHAR PROMPT 'Veuillez entrer le nom du quartier ou se trouve l''agence : '
EXECUTE PA_CONSULTATION_SERVICE_AGENCE.PO_CONSULTER_SERVICE_AGENCE('&nom_quartier_agence')
PROMPT          A - SORTIR
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF 
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Service_Agence/Consultation/EX_Liste_Agence'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Service_Agence/Consultation/ERR_Choix'
        END AS script
FROM    DUAL;
SET TERM ON 
@&v_script 