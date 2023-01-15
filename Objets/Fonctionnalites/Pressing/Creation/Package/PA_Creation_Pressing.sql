CREATE OR REPLACE PACKAGE PA_PRESSING AS
    PROCEDURE Add_pressing
    (
        ID_PRESS id.PRESSING%TYPE,
        NOM_PRESS nom.PRESSING%TYPE,
        DateCreation_PRESS date_creation.PRESSING%TYPE,
        IdProprietaire_PRESS id_proprietaire.PRESSING%TYPE);
    FUNCTION Verif_nom_pres 
    (NomPressing nom.PRESSING%TYPE) RETURN VARCHAR2;   
END PA_PRESSING;
/  
CREATE OR REPLACE PACKAGE BODY PA_PRESSING AS 
    PROCEDURE Add_pressing
    (
    ID_PRESS id.PRESSING%TYPE,
    NOM_PRESS nom.PRESSING%TYPE,
    DateCreation_PRESS date_creation.PRESSING%TYPE,
    IdProprietaire_PRESS id_proprietaire.PRESSING%TYPE)       
    IS 
    BEGIN
    ID_PRESS := "PR0";
    INSERT INTO PRESSING (id, nom, date_creation, id_proprietaire)
    VALUES (ID_PRESS, 
            NOM_PRESS, 
            DateCreation_PRESS, 
            IdProprietaire_PRESS);
    END Add_pressing; 
    FUNCTION Verif_nom_pres 
    (NomPressing nom.PRESSING%TYPE) RETURN VARCHAR2
    IS
    BEGIN
    END Verif_nom_pres;   
END PA_PRESSING;
/  
BEGIN
    A_PRESSING.Add_pressing("PR020",&NomDePressing,SYSDATE,"UT005");
END;
/        

