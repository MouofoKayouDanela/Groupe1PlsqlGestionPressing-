ALTER TABLE DETAILS_BESOIN
ADD CONSTRAINT ce_detail-Besoin_id_besoin
    FOREIGN KEY (id_besoin)
    REFERENCES BESOIN(id_besoin),
ADD CONSTRAINT ce_detail_Besoin_id_categorie_linge
    FOREIGN KEY (id_categorie_linge)
    REFERENCES LINGE(id_categorie_linge),
ADD CONSTRAINT ce_detail_Besoin_id_type_linge
    FOREIGN KEY (id_type_linge)
    REFERENCES LINGE(id_type_linge),
ADD CONSTRAINT ce_detail_Besoin_id_type
    FOREIGN KEY (id_type)
    REFERENCES SERVICE(id_type),
ADD CONSTRAINT ce_detail_Besoin_id_categorie
    FOREIGN KEY (id_categorie)
    REFERENCES SERVICE(id_categorie_linge);