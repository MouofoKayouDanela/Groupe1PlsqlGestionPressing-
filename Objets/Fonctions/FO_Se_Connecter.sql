SET serveroutput on;
CREATE OR REPLACE FUNCTION Pro(username UTILISATEUR.Nom_utilisateur%TYPE, password UTILISATEUR.mot_de_passe%TYPE)
RETURN VARCHAR2 IS 
CURSOR pointe IS 
SELECT Prop.id 
FROM PROPRIETAIRE Prop
JOIN UTILISATEUR Util 
ON (Prop.id=Util.id)
WHERE Util.Nom_utilisateur =username
AND 
Util.Mot_de_passe=password;
ValCur VARCHAR2 (255);
BEGIN
IF Cons_Status(username, password)='actif' THEN
    OPEN pointe;
    FETCH pointe
    INTO  ValCur;
    IF pointe%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Vous ne pouvez pas vous connecteZ');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Connexion avez succes');
    END IF;
    RETURN ValCur;
ELSE 
    RETURN 'Desole vous ne pouvez pas vous connecté votre compte est inactif';
END IF;
END;
/
DECLARE 
result VARCHAR2 (255) := Pro('&username', '&password');
BEGIN
DBMS_OUTPUT.PUT_LINE(result);
END;
/