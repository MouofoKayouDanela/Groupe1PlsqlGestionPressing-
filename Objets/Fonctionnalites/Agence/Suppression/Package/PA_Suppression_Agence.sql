SET serveroutput on;
CREATE PACKAGE PACK_AGENCES as
    FUNCTION VERIFY (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2;
END PACK_AGENCES;
CREATE PACKAGE BODY PACK_AGENCES AS 
    FUNCTION VERIFY (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
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
                ELSE
                    DBMS_OUTPUT.PUT_LINE('agence existe');
                END IF;
            CLOSE Curs;
            RETURN Valeur;
    RETURN (Cur);
    END VERIFY;
END PACK_AGENCES;
/
DECLARE 
    Resultat VARCHAR2 (255) :=VERIFY('&Nom_Pressing','&Lieu');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/