ACCEPT nom_quartier_agence CHAR PROMPT 'Veuillez entrer le nom du quartier ou se trouve l''agence : '
EXECUTE PA_CONSULTATION_PROMOTION.PO_CONSULTER_PROMOTION(PA_CONSULTATION_AGENCE.FO_RETOURNER_ID_VIA_QUARTIER('&nom_quartier_agence', '&id_pressing'))
PROMPT          A - SORTIR
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF 
COLUMN script NEW_VALUE v_script 
SELECT CASE '&mon_choix'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Agence/Consultation/EX_Liste_Agence'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Promotion/Consultation/ERR_Choix'
        END AS script
FROM    DUAL;
SET TERM ON 
@&v_script 