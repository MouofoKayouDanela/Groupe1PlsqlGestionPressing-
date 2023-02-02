 CREATE OR REPLACE PACKAGE PA_PROPRIETAIRE AS 
    PROCEDURE Add_proprietaire 
        (NOM_USER UTILISATEUR.nom%TYPE,
         PRENOM_USER UTILISATEUR.Prenom%TYPE,
         GENRE_USER UTILISATEUR.Genre%TYPE,
         DateNais_USER UTILISATEUR.Date_naissance%TYPE,
         MAIL_USER UTILISATEUR.Email%TYPE,
         PHONE_USER UTILISATEUR.Telephone%TYPE,
         USERNAME UTILISATEUR.Nom_utilisateur%TYPE,
         PASSWORDS UTILISATEUR.Mot_de_passe%TYPE);   
END PA_PROPRIETAIRE;
/ 
CREATE OR REPLACE PACKAGE BODY PA_PROPRIETAIRE AS
    PROCEDURE Add_proprietaire 
        (NOM_USER UTILISATEUR.nom%TYPE,
         PRENOM_USER UTILISATEUR.Prenom%TYPE,
         GENRE_USER UTILISATEUR.Genre%TYPE,
         DateNais_USER UTILISATEUR.Date_naissance%TYPE,
         MAIL_USER UTILISATEUR.Email%TYPE,
         PHONE_USER UTILISATEUR.Telephone%TYPE,
         USERNAME UTILISATEUR.Nom_utilisateur%TYPE,
         PASSWORDS UTILISATEUR.Mot_de_passe%TYPE)  
    IS 
    BEGIN 
       PA_UTILISATEUR.Add_user
        (
          Generate_id(seq_utilisateur.NEXTVAL,'UT'),  
          NOM_USER,
          PRENOM_USER,
          GENRE_USER,
          DateNais_USER,
          MAIL_USER,
          PHONE_USER,
          USERNAME,
          PASSWORDS  
        ); 
    INSERT INTO PROPRIETAIRE -- insertion dans la table proprietaire
                        (id, date_enregistrement)
    VALUES 
          (Generate_id(seq_utilisateur.CURRVAL,'UT'), TO_DATE(CURRENT_DATE,'dd/mm/yyyy'));
    END Add_proprietaire;           
END PA_PROPRIETAIRE;      
/         