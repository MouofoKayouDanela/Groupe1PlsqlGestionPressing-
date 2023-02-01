SET serveroutput on;
CREATE OR REPLACE PACKAGE PA_AGENCES_Nom as
    FUNCTION RECUPERATION_ID_AGENCE (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2;
    FUNCTION RECUPERATION_ID_CATEGORIE_SERVICE(Nom_CatService Categorie_Service.nom%TYPE)
    RETURN VARCHAR2;
    FUNCTION RECUPERATION_ID_TYPE_SERVICE(Nom_TypeService Type_Service.Intitule%TYPE)
    RETURN VARCHAR2;
    FUNCTION RECUPERATION_ID_CATEGORIE_LINGE (Nom_CatLinge CATEGORIE_LINGE.Nom%TYPE)
    RETURN VARCHAR2;
     FUNCTION RECUPERATION_ID_TYPE_LINGE (Nom_TypeLinge TYPE_LINGE.Intitule%TYPE)
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

    FUNCTION RECUPERATION_ID_CATEGORIE_SERVICE(Nom_CatService Categorie_Service.nom%TYPE)
    RETURN VARCHAR2 IS
        retour VARCHAR2(255);
        CURSOR turn IS
            SELECT id
            FROM Categorie_Service
            WHERE (nom=Nom_CatService);
        DONNEES VARCHAR2 (255);
    BEGIN
            OPEN turn;
            FETCH turn
            INTO DONNEES;
                IF turn%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Le nom de la categorie service n''existe pas');           
                END IF;
            CLOSE turn;
            RETURN DONNEES;
    RETURN (retour);
    END RECUPERATION_ID_CATEGORIE_SERVICE;

FUNCTION RECUPERATION_ID_TYPE_SERVICE (Nom_TypeService Type_Service.Intitule%TYPE)
    RETURN VARCHAR2 IS
        retour VARCHAR2(255);
        CURSOR turn IS
            SELECT id
            FROM Type_Service
            WHERE (Intitule=Nom_TypeService);
        DONNEES VARCHAR2 (255);
    BEGIN
            OPEN turn;
            FETCH turn
            INTO DONNEES;
                IF turn%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Le nom de le type service n''existe pas');           
                END IF;
            CLOSE turn;
            RETURN DONNEES;
    RETURN (retour);
    END RECUPERATION_ID_TYPE_SERVICE;

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

    FUNCTION RECUPERATION_ID_TYPE_LINGE (Nom_TypeLinge TYPE_LINGE.Intitule%TYPE)
    RETURN VARCHAR2 IS
            Cur VARCHAR2(255);
            CURSOR Curs IS
                SELECT id
                FROM TYPE_LINGE
                WHERE (Intitule=Nom_TypeLinge);
            Valeur VARCHAR2 (255);
    BEGIN
            OPEN Curs;
            FETCH Curs
            INTO Valeur;
                IF Curs%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Le nom du type linge n''existe pas');           
                END IF;
            CLOSE Curs;
            RETURN Valeur;
        RETURN (Cur);
    END RECUPERATION_ID_TYPE_LINGE;    
END PA_AGENCES_Nom;
/
DECLARE 
    Valeur_agence VARCHAR2 (255) :=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE('&Nom_Pressing','&Lieu');
    valeur_categorie_service VARCHAR2 (255) :=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_SERVICE('&Nom_CatService');
    Valeur_type_service VARCHAR2 (255) :=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_SERVICE('&Nom_TypeService');
    Valeur_categorie_linge VARCHAR2 (255) :=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_LINGE('&Nom_CatLinge');
    Valeur_type_linge VARCHAR2 (255) :=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_LINGE ('&Nom_TypeLinge');

BEGIN
    DBMS_OUTPUT.PUT_LINE(Valeur_agence);
    DBMS_OUTPUT.PUT_LINE(valeur_categorie_service);
    DBMS_OUTPUT.PUT_LINE(Valeur_type_service);
    DBMS_OUTPUT.PUT_LINE(Valeur_categorie_linge);
    DBMS_OUTPUT.PUT_LINE(Valeur_type_linge);
END;
/








