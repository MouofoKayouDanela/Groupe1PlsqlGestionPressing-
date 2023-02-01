SET serveroutput on;
CREATE OR REPLACE PACKAGE PA_SERVICE_LINGE_AGENCES AS
    PROCEDURE SUPPRESSION_SERVICE_AGENCES (
            Nom_Pressing Pressing.Nom%TYPE, 
            Lieu QUARTIER.nom%TYPE,       
            Nom_TypeService Type_Service.Intitule%TYPE,
            Nom_CatService Categorie_Service.nom%TYPE,
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
            Nom_TypeService Type_Service.Intitule%TYPE,
            Nom_CatService Categorie_Service.nom%TYPE,
            date_aj SERVICE_AGENCE.date_Ajout%TYPE
    )IS
    idCS varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_SERVICE(Nom_CatService);
    idTS varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_SERVICE(Nom_TypeService);
    idAG varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE(Nom_Pressing,Lieu);
        BEGIN
            UPDATE SERVICE_AGENCE
            SET SERVICE_AGENCE.date_retrait=TO_DATE(Current_date,'dd/mm/yyyy')
            WHERE SERVICE_AGENCE.id_type=idTS
            AND SERVICE_AGENCE.id_categorie=idCS
            AND SERVICE_AGENCE.id_agence=idAG
            AND SERVICE_AGENCE.date_Ajout=TO_DATE(date_aj,'dd/mm/yyyy');
        END SUPPRESSION_SERVICE_AGENCES;
    
    PROCEDURE SUPPRESSION_LINGE_AGENCES(
            Nom_Pressing Pressing.Nom%TYPE, 
            Lieu QUARTIER.nom%TYPE,
            Nom_CatLinge CATEGORIE_LINGE.Nom%TYPE,
            Nom_TypeLinge TYPE_LINGE.Intitule%TYPE,
            date_aj LINGE_AGENCE.date_Ajout%TYPE
    )IS
    idCL varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_LINGE (Nom_CatLinge);
    idTL varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_LINGE (Nom_TypeLinge);
    idAG varchar2(50):=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE(Nom_Pressing,Lieu);
        BEGIN
            UPDATE LINGE_AGENCE
            SET LINGE_AGENCE.date_retrait=TO_DATE(Current_date,'dd/mm/yyyy')
            WHERE LINGE_AGENCE.id_type=idTL
            AND LINGE_AGENCE.id_categorie=idCL
            AND LINGE_AGENCE.id_agence=idAG
            AND LINGE_AGENCE.date_Ajout=TO_DATE(date_aj,'dd/mm/yyyy');
        END SUPPRESSION_LINGE_AGENCES;
END PA_SERVICE_LINGE_AGENCES;
/