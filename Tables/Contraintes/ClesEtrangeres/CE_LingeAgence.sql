ALTER TABLE LINGE_AGENCE
ADD CONSTRAINT ce_lingeAgence_id_agence
    FOREIGN KEY (id)
    REFERENCES AGENCE(id),
ADD CONSTRAINT ce_lingeAgence_id_categorielinge
    FOREIGN KEY (id_categorielinge)
    REFERENCES LINGE(id_categorielinge),
ADD CONSTRAINT ce_lingeAgence_id_typelinge
    FOREIGN KEY (id_typelinge)
    REFERENCES LINGE(id_typelinge);    