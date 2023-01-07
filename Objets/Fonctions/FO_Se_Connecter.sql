SET serveroutput on;
CREATE OR REPLACE FUNCTION Pro(username VARCHAR2, password VARCHAR2)
RETURN int IS 
CURSOR pointe IS 
SELECT Prop.id 
FROM PROPRIETAIRE Prop
JOIN UTILISATEUR Util 
ON (Prop.id=Util.id)
WHERE Util.Nom_utilisateur =username
AND 
Util.Mot_de_passe=password;
ValCur int;
BEGIN
OPEN pointe;
FETCH pointe
INTO  ValCur;
RETURN ValCur;
END;
/

DECLARE 
result int := Pro('&username','&mot_de_passe');

BEGIN

IF result IS NULL THEN 
DBMS_OUTPUT.PUT_LINE('Veuillez vous inscrire');
ELSE
DBMS_OUTPUT.PUT_LINE('Connexion avez succes');
END IF;
END;
/


SET DEFINE ON

SELECT CASE 
            WHEN(SELECT(Prop.id)
             FROM PROPRIETAIRE prop
             JOIN UTILISATEUR util 
             ON (Prop.id=util.id)
             WHERE util.Nom_utilisateur='&username'
             AND
             util.Mot_de_passe='&mot de passe')>=1
             THEN
             'connexion reussie'
             ELSE 
             'veuillez entrer les infos correctes'
             END AS Connexion
FROM Dual;

set term on
