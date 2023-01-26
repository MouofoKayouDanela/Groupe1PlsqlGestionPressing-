SET serveroutput on;
CREATE OR REPLACE PACKAGE PACK_OFFRES AS
 FUNCTION VUES(,
    date_Ajout_Linge VARCHAR2,
    date_Ajout_service VARCHAR2,
    idAnnonce Offre.id_annonce%TYPE,
    idAgenceService Offre.id_agence_service%TYPE,
    )
  RETURN VARCHAR2;
CREATE OR REPLACE PACKAGE BODY PACK_OFFRES AS 
    FUNCTION VUES ( 
    date_Ajout_Linge VARCHAR2,
    date_Ajout_service VARCHAR2,
    idAnnonce Offre.id_annonce%TYPE,
    idAgenceService Offre.id_agence_service%TYPE,
    )
        RETURN VARCHAR2 IS
        Var VARCHAR2(255);
        CURSOR Var IS
            SELECT Ofre.prix_unitaire
            FROM OFFRE Ofre
            JOIN ServiceAgence Sag
            ON (Ofre.id_agence_service=Sag.id_agence_service)
            WHERE 
                Sag.id_agence_service=idagenceservice
            AND 
                Sag.date_Ajout_service=dateAjoutService
            JOIN LINGE_AGENCE Lag
            ON (Ofre.date_Ajout_Linge=Lag.date_Ajout_Linge)
            WHERE 
                Lag.date_Ajout_Linge=date_Ajout_Linge
            JOIN Annonce Ann
            ON (Ofre.id_annonce=Lag.id_annonce)
            WHERE 
                Ann.id_annonce=id_annonce
        vol VARCHAR2 (255);
        BEGIN
            OPEN Var;
            FETCH Var
            INTO Val;
            IF Var%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('offre existe pas');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('offre existe');
                END IF;
            CLOSE Var;
        RETURN vol;
    RETURN (Var);  
    END VUES;
END PACK_OFFRES;
/
DECLARE 
    Resultat VARCHAR2 (255) :=PACK_OFFRES.VUES(
        '&dateAjoutLinge',
        '&dateAjoutService',
        '&idAnnonce',
        '&idAgenceService');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/