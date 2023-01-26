ACCEPT nom_utili CHAR PROMPT 'Veuillez entrer le nom de l''agent dont vous voulez consulter le profil : '
EXECUTE PA_CONSULTATION_AGENT.PO_PROFIL_AGENT('&nom_utili', '&nom_quartier_agence', '&id_pressing')
PROMPT          A - SORTIR
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF 
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/EX_Liste_Agents'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/ERR_Choix'
        END AS script
FROM    DUAL;
SET TERM ON 
@&v_script 