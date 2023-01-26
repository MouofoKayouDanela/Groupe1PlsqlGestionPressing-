CREATE OR REPLACE PACKAGE PA_PRESSING AS     --Entete du package de creation d'un pressing
    PROCEDURE Add_pressing           --Appel de la procedure associee
    (
        ID_PRESS PRESSING.id%TYPE,
        NOM_PRESS PRESSING.nom%TYPE,
        DateCreation_PRESS PRESSING.date_creation%TYPE,
        IdProprietaire_PRESS PRESSING.id_proprietaire%TYPE);
    FUNCTION Verif_nom_pressing   --Appel de la fonction associee de verification de l'exixtance du pressing
    (NomPressing PRESSING.nom%TYPE) RETURN VARCHAR2;   
END PA_PRESSING;
/  
CREATE OR REPLACE PACKAGE BODY PA_PRESSING AS     --corps du package
    PROCEDURE Add_pressing
    (
        ID_PRESS PRESSING.id%TYPE,
        NOM_PRESS PRESSING.nom%TYPE,
        DateCreation_PRESS PRESSING.date_creation%TYPE,
        IdProprietaire_PRESS PRESSING.id_proprietaire%TYPE
    )       
    IS 
    BEGIN
    INSERT INTO PRESSING 
        (
            id, 
            nom, 
            date_creation, 
            id_proprietaire
        )
    VALUES
        (
            ID_PRESS, 
            NOM_PRESS, 
            DateCreation_PRESS, 
            IdProprietaire_PRESS
        );
    END Add_pressing; 
    FUNCTION Verif_nom_pressing 
    (NomPressing PRESSING.nom%TYPE) 
    RETURN VARCHAR2
    IS
        CURSOR Curseur IS        --curseur qui parcourt la table pressing sur la colonne du nom
            SELECT nom
            FROM PRESSING
            WHERE (nom=NomPressing);
        Valeur VARCHAR2(255);
        BEGIN
            OPEN Curseur;
            FETCH Curseur
            INTO Valeur;
                IF Curseur%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Nom de pressing valide');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Desole un pressing existe deja sous ce nom');
                END IF;
            CLOSE Curseur;
        RETURN Valeur;
    END Verif_nom_pressing;   
END PA_PRESSING;
/ 
DECLARE             --main ou partie de declaration du package
Resultat VARCHAR2(255) := PA_PRESSING.Verif_nom_pressing('Valeur');
BEGIN
    PA_PRESSING.Add_pressing         --declaration de la procedure avec les variables de substitution
    (
        'PR||seq_pressing.NEXTVAL',
        '&Nom_du_pressing',
        SYSDATE,
        'UT||seq_utilisateur.NEXTVAL'
    );
END;
/        
