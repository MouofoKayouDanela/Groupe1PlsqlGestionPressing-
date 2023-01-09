CREATE OR REPLACE FUNCTION Cons_Status(username UTILISATEUR.Nom_utilisateur%TYPE, password UTILISATEUR.mot_de_passe%TYPE)
RETURN VARCHAR2 IS 
CURSOR val IS
SELECT  Statut 
FROM UTILISATEUR Util
JOIN  PROPRIETAIRE Pro
ON (Util.id=Pro.id)
WHERE Util.Nom_utilisateur =username
AND 
Util.Mot_de_passe=password;
rest VARCHAR2 (255);
BEGIN
OPEN val;
FETCH val
INTO rest;
CLOSE val;
RETURN rest;
END;
/
DECLARE
result VARCHAR2 (255) := Cons_Status('&username','&mot_de_passe');
BEGIN
DBMS_OUTPUT.PUT_LINE(result);
END;
/