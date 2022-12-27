CREATE TABLE utilisateurs
(
    Id VARCHAR2(30) PRIMARY KEY,
    Nom VARCHAR2(255) , 
    Prenom VARCHAR2(255), 
    Genre CHAR(15) ,
    Date_Naissance  DATE,
    Email VARCHAR2(255),
    Telephone NUMBER ,
    Nom_Utilisateur VARCHAR(255) ,
    Mot_De_Passe VARCHAR2(255) 
);