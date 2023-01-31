PROMPT                            CHOIX INCORRECT
PROMPT Vous devez operer un choix se trouvant dans la liste qui vous a ete propose !
PROMPT                               A - retour
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF 
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script
SELECT CASE '&mon_choix'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Linge_Agence/Consultation/EX_Liste_Linge_Agence'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Linge_Agence/Consultation/ERR_Choix'
        END  AS script
FROM DUAL;
SET TERM ON
@&v_script 