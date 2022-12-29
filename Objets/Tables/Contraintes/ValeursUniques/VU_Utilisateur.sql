ALTER TABLE UTILISATEUR
ADD(
     CONSTRAINT vu_utilisateur_Nom_Utilisateur UNIQUE (Nom_Utilisateur),
     CONSTRAINT vu_utilisateur_Email UNIQUE (Email)
);
