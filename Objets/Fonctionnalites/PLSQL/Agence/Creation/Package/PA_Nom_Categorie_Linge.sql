SET serveroutput on;
CREATE OR REPLACE PACKAGE PA_CATEGORIE_LINGE_Nom as
    FUNCTION RECUPERATION_ID_CATEGORIE_LINGE (Nom_CatLinge CATEGORIE_LINGE.Nom%TYPE)
    RETURN VARCHAR2;
END PA_CATEGORIE_LINGE_Nom;
/
CREATE OR REPLACE PACKAGE BODY PA_CATEGORIE_LINGE_Nom AS 
    FUNCTION RECUPERATION_ID_CATEGORIE_LINGE (Nom_CatLinge CATEGORIE_LINGE.Nom%TYPE)
    RETURN VARCHAR2 IS
    Cur VARCHAR2(255);
	CURSOR Curs IS
        SELECT id
        FROM CATEGORIE_LINGE
        WHERE (Nom=Nom_CatLinge);
	 Valeur VARCHAR2 (255);
    BEGIN
        OPEN Curs;
        FETCH Curs
        INTO Valeur;
            IF Curs%NOTFOUND THEN
                DBMS_OUTPUT.PUT_LINE('Le nom de la categorie linge n''existe pas');           
            END IF;
        CLOSE Curs;
        RETURN Valeur;
   RETURN (Cur);
END RECUPERATION_ID_CATEGORIE_LINGE;
END PA_CATEGORIE_LINGE_Nom;
/
DECLARE 
    Valeur VARCHAR2 (255) :=PA_CATEGORIE_LINGE_Nom.RECUPERATION_ID_CATEGORIE_LINGE('&Nom_CatLinge');
BEGIN
    DBMS_OUTPUT.PUT_LINE(Valeur);
END;
/