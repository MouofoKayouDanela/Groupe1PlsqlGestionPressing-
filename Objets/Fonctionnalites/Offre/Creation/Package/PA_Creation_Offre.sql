SET serveroutput on;
CREATE PACKAGE PACK_OFFRES as
    FUNCTION VERIFY (Id_Agence Id_Agence%TYPE)
    RETURN int;
END PACK_OFFRES;
CREATE PACKAGE BODY PACK_OFFRES AS 
    FUNCTION VERIFY (Id_Agence Id_Agence%TYPE)
    RETURN int IS
        Cur int(10);
        CURSOR Ofrs IS
            SELECT Agr.id
            FROM LingeAgence Agr
            JOIN Agence Ag
            ON(Agr.id_agence=Ag.id)
        Valeur int(10);
        BEGIN
            OPEN Ofrs;
            FETCH Ofrs
            INTO Valeur;
                IF Ofrs%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('offre existe pas');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('offre existe');
                END IF;
            CLOSE Ofrs;
            RETURN Valeur;
    RETURN (Ofrs);
    END VERIFY;
END PACK_OFFRES;
/
DECLARE 
    Resultat int(10) := VERIFY('&id_agence');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/