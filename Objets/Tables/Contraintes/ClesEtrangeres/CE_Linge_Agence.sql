ALTER TABLE LINGE_AGENCE
ADD(
    CONSTRAINT ce_linge_Agence_id_agence
    FOREIGN KEY (id_agence)
    REFERENCES AGENCE(id),
    CONSTRAINT ce_linge_agence_id_categorie_id_type_linge
    FOREIGN KEY(id_categorie, id_type)
    REFERENCES LINGE(id_categorie, id_type)
);