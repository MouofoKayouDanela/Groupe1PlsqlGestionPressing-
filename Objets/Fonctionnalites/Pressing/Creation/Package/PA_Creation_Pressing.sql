CREATE OR REPLACE PACKAGE PA_PRESSING AS
    PROCEDURE Add_pressing
    (
        ID_PRESS PRESSING.id%TYPE,
        NOM_PRESS PRESSING.nom%TYPE,
        DateCreation_PRESS PRESSING.date_creation%TYPE,
        IdProprietaire_PRESS PRESSING.id_proprietaire%TYPE);
    FUNCTION Verif_nom_pres 
    (NomPressing PRESSING.nom%TYPE) RETURN VARCHAR2;   
END PA_PRESSING;
/  
CREATE OR REPLACE PACKAGE BODY PA_PRESSING AS 
    PROCEDURE Add_pressing
    (
    ID_PRESS PRESSING.id%TYPE,
    NOM_PRESS PRESSING.nom%TYPE,
    DateCreation_PRESS PRESSING.date_creation%TYPE,
    IdProprietaire_PRESS PRESSING.id_proprietaire%TYPE)       
    IS 
    BEGIN
    ID_PRESS := "PR0";
    INSERT INTO PRESSING (id, nom, date_creation, id_proprietaire)
    VALUES (ID_PRESS, 
            NOM_PRESS, 
            DateCreation_PRESS, 
            IdProprietaire_PRESS);
    END Add_pressing; 
    FUNCTION Verif_nom_pressing 
    (NomPressing PRESSING.nom%TYPE) RETURN VARCHAR2
    IS
    BEGIN
    Curseur VARCHAR2(255);
        CURSOR Curseur IS
            SELECT nom
            FROM PRESSING
            WHERE (nom=NomPressing);
        Valeur VARCHAR2 (255);
        BEGIN
            OPEN Curseur;
            FETCH Curseur
            INTO Valeur;
                IF Curseur%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Nom de pressing valide');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Desole un pressing exixte deja sous ce nom');
                END IF;
            CLOSE Curseur;
        RETURN Valeur;
    END Verif_nom_pressing;   
END PA_PRESSING;
/ 
DECLARE
    Rendu VARCHAR2 (255) := VERIFY('&NomPressing');
BEGIN
    PA_PRESSING.Add_pressing("PR020",&NomDePressing,SYSDATE,"UT005");
    PA_PRESSING.Verif_nom_pressing(Rendu);
END;
/        

