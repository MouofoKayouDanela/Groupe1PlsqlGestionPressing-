ALTER TABLE UTILISATEUR
ADD(
     CONSTRAINT vu_utilisateur_Nom_Utilisateur UNIQUE (email),
     CONSTRAINT vu_utilisateur_mot_de_passe UNIQUE (mot_de_passe)
);
