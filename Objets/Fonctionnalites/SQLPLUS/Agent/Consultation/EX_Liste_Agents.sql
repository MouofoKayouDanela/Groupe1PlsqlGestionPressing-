ACCEPT nom_quartier_agence CHAR PROMPT 'Veuillez entrer le nom du quartier ou se trouve l''agence : '
EXECUTE PA_CONSULTATION_AGENT.PO_LISTE_AGENT('&nom_quartier_agence', '&id_pressing')
PROMPT          1 - CONSULTER LE PROFIL D'UN AGENT
PROMPT          A - SORTIR
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF 
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN '1' THEN 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/EX_Profil_Agent'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Agence/Consultation/EX_Liste_Agence'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/ERR_Choix'
        END AS script
FROM    DUAL;
SET TERM ON 
@&v_script 