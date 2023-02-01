SET serveroutput on;
CREATE OR REPLACE PACKAGE CREATION_LINGE_AGENCE AS
PROCEDURE  AJOUT_LIN_AGN(Nom_CatLinge Categorie_Linge.Nom%TYPE, Nom_TypLinge Type_Linge.Intitule%TYPE, 
Nom_Pressing Pressing.Nom%TYPE, Lieu Quartier.Nom%TYPE);
END CREATION_LINGE_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY CREATION_LINGE_AGENCE AS
PROCEDURE  AJOUT_LIN_AGN(Nom_CatLinge Categorie_Linge.Nom%TYPE, Nom_TypLinge Type_Linge.Intitule%TYPE, 
Nom_Pressing Pressing.Nom%TYPE, Lieu Quartier.Nom%TYPE)
IS
id_cat_lin VARCHAR2(50) :=PA_AGENCES_Nom.RECUPERATION_ID_CATEGORIE_SERVICE(Nom_CatLinge);
id_typ_lin VARCHAR2(50) :=PA_AGENCES_Nom.RECUPERATION_ID_TYPE_SERVICE(Nom_TypLinge);
id_agn VARCHAR2(50) :=PA_AGENCES_Nom.RECUPERATION_ID_AGENCE(Nom_Pressing,Lieu);
BEGIN
INSERT INTO LINGE_AGENCE(id_categorie, id_type, id_agence, Date_ajout)
VALUES(id_cat_lin, id_typ_lin, id_agn, TO_DATE(Current_date,'dd/mm/yyyy'));
END AJOUT_LIN_AGN;
END CREATION_LINGE_AGENCE;
/