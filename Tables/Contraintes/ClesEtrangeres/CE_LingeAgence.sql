ALTER TABLE LINGE_AGENCE
ADD CONSTRAINT ce_linge_Agence_id_agence
    FOREIGN KEY (id)
    REFERENCES AGENCE(id),
ADD CONSTRAINT ce_linge-Agence_id_categorie_linge
    FOREIGN KEY (id_categorie_linge)
    REFERENCES LINGE(id_categorie_linge),
ADD CONSTRAINT ce_linge_Agence_id_typelinge
    FOREIGN KEY (id_type_linge)
    REFERENCES LINGE(id_typelinge);    