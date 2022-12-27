CREATE TABLE utilisateurs
(
    Id VARCHAR2(30) PRIMARY KEY NOT NULL,
    Nom VARCHAR2(255) NOT NULL, 
    Prenom VARCHAR2(255), 
    Genre CHAR(15) NOT NULL,
    Date_Naissance  DATE,
    Email VARCHAR2(255),
    Telephone NUMBER NOT NULL,
    Nom_Utilisateur VARCHAR(255) NOT NULL,
    Mot_De_Paasse VARCHAR2(255) NOT NULL
);