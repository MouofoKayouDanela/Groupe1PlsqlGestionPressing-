SET serveroutput on;
CREATE OR REPLACE PACKAGE PA_SERVICE_LINGE_AGENCES AS
    PROCEDURE SUPPRESSION_SERVICE_AGENCES (
            Nom_Pressing Pressing.Nom%TYPE, 
            Lieu QUARTIER.nom%TYPE,      
            Nom_CatService Categorie_Service.nom%TYPE, 
            Nom_TypeService Type_Service.Intitule%TYPE, 
            date_aj SERVICE_AGENCE.date_Ajout%TYPE
    );
    PROCEDURE SUPPRESSION_LINGE_AGENCES(
            Nom_Pressing Pressing.Nom%TYPE, 
            Lieu QUARTIER.nom%TYPE,
            Nom_CatLinge CATEGORIE_LINGE.Nom%TYPE,
            Nom_TypeLinge TYPE_LINGE.Intitule%TYPE,
            date_aj LINGE_AGENCE.date_Ajout%TYPE
    );
END PA_SERVICE_LINGE_AGENCES;
/
CREATE OR REPLACE PACKAGE BODY PA_SERVICE_LINGE_AGENCES AS
   PROCEDURE SUPPRESSION_SERVICE_AGENCES (  
             Nom_Pressing Pressing.Nom%TYPE, 
            Lieu QUARTIER.nom%TYPE,      
            Nom_CatService Categorie_Service.nom%TYPE, 
            Nom_TypeService Type_Service.Intitule%TYPE, 
            date_aj SERVICE_AGENCE.date_Ajout%TYPE
    )IS
    idAG varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE(Nom_Pressing,Lieu);
    idCS varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_SERVICE(Nom_CatService);
    idTS varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_SERVICE(Nom_TypeService);
    
        BEGIN
        DBMS_OUTPUT.PUT_LINE(idAG);
        DBMS_OUTPUT.PUT_LINE(idCS);
        DBMS_OUTPUT.PUT_LINE(idTS);
            UPDATE SERVICE_AGENCE
            SET SERVICE_AGENCE.date_retrait=TO_DATE(Current_date,'dd/mm/yyyy')
            WHERE SERVICE_AGENCE.id_agence=SUPPRESSION_SERVICE_AGENCES.idAG 
            AND SERVICE_AGENCE.id_categorie=SUPPRESSION_SERVICE_AGENCES.idCS
            AND SERVICE_AGENCE.id_type=SUPPRESSION_SERVICE_AGENCES.idTS
            AND SERVICE_AGENCE.date_Ajout=TO_DATE(date_aj,'dd/mm/yyyy');
        END SUPPRESSION_SERVICE_AGENCES;
    
    PROCEDURE SUPPRESSION_LINGE_AGENCES(
            Nom_Pressing Pressing.Nom%TYPE, 
            Lieu QUARTIER.nom%TYPE,
            Nom_CatLinge CATEGORIE_LINGE.Nom%TYPE,
            Nom_TypeLinge TYPE_LINGE.Intitule%TYPE,
            date_aj LINGE_AGENCE.date_Ajout%TYPE
    )IS
    idAG varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE(Nom_Pressing,Lieu);
    idCL varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_LINGE (Nom_CatLinge);
    idTL varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_LINGE (Nom_TypeLinge);
        BEGIN
        DBMS_OUTPUT.PUT_LINE(idAG);
        DBMS_OUTPUT.PUT_LINE(idCL);
        DBMS_OUTPUT.PUT_LINE(idTL);

            UPDATE LINGE_AGENCE
            SET LINGE_AGENCE.date_retrait=TO_DATE(Current_date,'dd/mm/yyyy')
            WHERE LINGE_AGENCE.id_agence=idAG
            AND LINGE_AGENCE.id_categorie=idCL
            AND LINGE_AGENCE.id_type=idTL
            AND LINGE_AGENCE.date_Ajout=TO_DATE(date_aj,'dd/mm/yyyy');
        END SUPPRESSION_LINGE_AGENCES;
END PA_SERVICE_LINGE_AGENCES;
/