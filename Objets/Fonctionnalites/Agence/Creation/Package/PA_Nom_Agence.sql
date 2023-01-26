SET serveroutput on;
CREATE OR REPLACE PACKAGE PA_AGENCES_Nom as
    FUNCTION RECUPERATION_ID_AGENCE (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2;
END PA_AGENCES_Nom;
/
CREATE OR REPLACE PACKAGE BODY PA_AGENCES_Nom AS 
    FUNCTION RECUPERATION_ID_AGENCE (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2 IS
    Cur VARCHAR2(255);
	CURSOR Curs IS
        SELECT Ag.id
        FROM AGENCE Ag
        JOIN PRESSING Pr
        ON(Ag.id_pressing=Pr.id)
        JOIN QUARTIER Qu
        ON(Ag.id_quartier=Qu.id)
        WHERE (Pr.Nom=Nom_Pressing)
        AND 
        (Qu.nom=Lieu);
	 Valeur VARCHAR2 (255);
    BEGIN
        OPEN Curs;
        FETCH Curs
        INTO Valeur;
            IF Curs%NOTFOUND THEN
                DBMS_OUTPUT.PUT_LINE('agence existe pas');           
            END IF;
        CLOSE Curs;
        RETURN Valeur;
   RETURN (Cur);
END RECUPERATION_ID_AGENCE;
END PA_AGENCES_Nom;
/
DECLARE 
    Valeur VARCHAR2 (255) :=PA_AGENCES_Nom.RECUPERATION8_ID_AGENCE('&Nom_Pressing','&Lieu');
BEGIN
    DBMS_OUTPUT.PUT_LINE(Valeur);
END;
/








