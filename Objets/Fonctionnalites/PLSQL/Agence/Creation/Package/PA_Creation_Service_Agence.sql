SET serveroutput on;
CREATE OR REPLACE PACKAGE CREATION_SERVICE_AGENCE AS
PROCEDURE AJOUT_SER_AGN(Nom_CatService Categorie_Service.nom%TYPE, Nom_TypeService Type_Service.Intitule%TYPE,
 Nom_Pressing Pressing.Nom%TYPE, Lieu Quartier.Nom%TYPE);
END CREATION_SERVICE_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY CREATION_SERVICE_AGENCE AS
PROCEDURE AJOUT_SER_AGN(Nom_CatService Categorie_Service.nom%TYPE, Nom_TypeService Type_Service.Intitule%TYPE,
Nom_Pressing Pressing.Nom%TYPE, Lieu Quartier.Nom%TYPE)
  IS
   id_cat_ser VARCHAR2(50) :=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_SERVICE(Nom_CatService);
   id_typ_ser VARCHAR2(50) :=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_SERVICE(Nom_TypeService);
   id_agn VARCHAR2(50) :=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE(Nom_Pressing,Lieu);
   BEGIN
   INSERT INTO Service_Agence(id_categorie, id_type, id_agence,Date_ajout)
   VALUES(id_cat_ser,id_typ_ser,id_agn,TO_DATE(Current_date,'dd/mm/yyyy')
 );
    END AJOUT_SER_AGN;
    END CREATION_SERVICE_AGENCE;
    /