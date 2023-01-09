CREATE OR REPLACE FUNCTION Cons_Status(username UTILISATEUR.Nom_utilisateur%TYPE, password UTILISATEUR.mot_de_passe%TYPE)
RETURN int IS 
CURSOR val IS
SELECT status 
FROM UTILISATEUR Util
JOIN  PROPRIETAIRE Pro
ON (Util.id=Pro.id)
WHERE Util.Nom_utilisateur =username
AND 
Util.Mot_de_passe=password;
rest INT;
BEGIN
OPEN val
FETCH val 
INTO rest;
RETURN rest;
END;
/

DECLARE

result int := Cons_Status('&username','&mot_de_passe');
 