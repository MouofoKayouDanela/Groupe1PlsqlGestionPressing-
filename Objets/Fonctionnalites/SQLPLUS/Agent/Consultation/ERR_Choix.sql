PROMPT                            CHOIX INCORRECT
PROMPT Vous devez operer un choix se trouvant dans la liste qui vous a ete propose !
PROMPT                               A - retour
ACCEPT mon_choix CHAR PROMPT 'Veuillez entrer le caractere correspondant a votre choix : '
SET TERM OFF 
SET SERVEROUTPUT ON
COLUMN script NEW_VALUE v_script
SELECT CASE '&mon_choix'
            WHEN 'A' THEN 'Objets/Fonctionnalites/SQLPLUS/Agence/Consultation/EX_ListeAgence'
            ELSE 'Objets/Fonctionnalites/SQLPLUS/Agent/Consultation/ERR_Choix'
        END  AS script
FROM DUAL;
SET TERM ON