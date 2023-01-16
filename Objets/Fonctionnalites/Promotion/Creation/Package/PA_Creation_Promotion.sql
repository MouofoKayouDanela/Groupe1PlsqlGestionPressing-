CREATE OR REPLACE PACKAGE PA_PROMOTE AS
    FUNCTION VERIFIER(
        qte VARCHAR2,
        pourcentageRetrait VARCHAR2,
        dateCreation VARCHAR2,
        dateExpiration VARCHAR2,
        idCategorieLinge Promotion.id_categorie_linge%TYPE,
        idCategorieService Promotion.id_categorie_Service%TYPE,
        idTypeLinge Promotion.id_type_linge%TYPE,
        idTypeService Promotion.id_type_service%TYPE,
        idAgenceLinge Promotion.id_agence_Linge%TYPE,
        prixUnitaire VARCHAR2
        )
    RETURN VARCHAR2;
    PROCEDURE Add_promotion(
        qte VARCHAR2,
        pourcentageRetrait VARCHAR2,
        dateCreation date,
        dateExpiration VARCHAR2,
        idCategorieLinge Promotion.id_categorie_linge%TYPE,
        idCategorieService Promotion.id_categorie_Service%TYPE,
        idTypeLinge Promotion.id_type_linge%TYPE,
        idTypeService Promotion.id_type_service%TYPE,
        idAgenceLinge Promotion.id_agence_Linge%TYPE,
        prixUnitaire VARCHAR2
    );
END PA_PROMOTE;
/
CREATE OR REPLACE PACKAGE BODY PA_PROMOTE AS 
    FUNCTION VERIFIER ( 
            qte VARCHAR2,
            pourcentageRetrait VARCHAR2,
            dateCreation VARCHAR2,
            dateExpiration VARCHAR2,
            idCategorieLinge Promotion.id_categorie_linge%TYPE,
            idCategorieService Promotion.id_categorie_Service%TYPE,
            idTypeLinge Promotion.id_type_linge%TYPE,
            idTypeService Promotion.id_type_service%TYPE,
            idAgenceLinge Promotion.id_agence_Linge%TYPE,
            prixUnitaire VARCHAR2
        )
    RETURN VARCHAR2 IS
    Cur VARCHAR2(255);
        CURSOR Curs IS
            SELECT Promo.id
            FROM PROMOTION Promo
            JOIN OFFRE Off 
            ON (Promo.id_categorie_linge=off.id_categorie_linge)
            WHERE 
                Promo.quantite=qte
            AND 
                Promo.pourcentage_Retrait=pourcentageRetrait
            AND 
                Promo.date_Creation=dateCreation
            AND
                Promo.date_Expiration=dateExpiration
            AND 
                off.id_categorie_linge=idCategorieLinge
            AND 
                off.id_categorie_Service=idCategorieService
            AND 
                off.id_type_linge=idTypeLinge
            AND 
                off.id_type_service=idTypeService
            AND 
                off.id_agence_Linge=idAgenceLinge
            AND 
                Promo.prix_unitaire=prixUnitaire;
        val VARCHAR2 (255);
        BEGIN
        OPEN Curs;
        FETCH Curs
        INTO Val;
            IF Curs%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('promotion existe pas');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('promotion existe');
                END IF;
        CLOSE Curs;
        RETURN val;
    RETURN (Cur);  
    END VERIFIER;
    /
    PROCEDURE Add_promotion(
        qte VARCHAR2,
        pourcentageRetrait VARCHAR2,
        dateCreation date,
        dateExpiration VARCHAR2,
        idCategorieLinge Promotion.id_categorie_linge%TYPE,
        idCategorieService Promotion.id_categorie_Service%TYPE,
        idTypeLinge Promotion.id_type_linge%TYPE,
        idTypeService Promotion.id_type_service%TYPE,
        idAgenceLinge Promotion.id_agence_Linge%TYPE,
        prixUnitaire VARCHAR2
    )
    IS
        promo_id Promotion.id%TYPE:='PO'||seq_promotion.NEXTVAL;
    BEGIN
            INSERT INTO PROMOTION(
                id,
                quantite,
                pourcentage_Retrait,
                date_Creation,
                date_Expiration,
                id_categorie_linge,
                id_categorie_Service,
                id_type_linge,
                id_type_service,
                id_agence_Linge,
                prix_unitaire
            )
            VALUES
            (
                promo_id,
                qte,
                pourcentageRetrait,
                Current_date,
                dateExpiration,
                idCategorieLinge,
                idCategorieService ,
                idTypeLinge,
                idTypeService,
                idAgenceLinge,
                prixUnitaire
            );   
    END Add_promotion;
END PA_PROMOTE;
/

DECLARE 
    Resultat VARCHAR2 (255) :=PA_PROMOTE.VERIFIER(
        '&qte',
        '&pourcentageRetrait',
        '&dateCreation',
        '&dateExpiration',
        '&idCategorieLinge',
        '&idCategorieService',
        '&idTypeLinge',
        '&idTypeService',
        '&idAgenceLinge',
        '&prixUnitaire');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/
