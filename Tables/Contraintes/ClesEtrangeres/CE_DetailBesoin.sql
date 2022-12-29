ALTER TABLE DETAILS_BESOIN
ADD CONSTRAINT ce_detailBesoin_id_besoin
    FOREIGN KEY (id_besoin)
    REFERENCES BESOIN(id_besoin),
ADD CONSTRAINT ce_detailBesoin_id_categorielinge
    FOREIGN KEY (id_categorielinge)
    REFERENCES LINGE(id_categorielinge),
ADD CONSTRAINT ce_detailBesoin_id_typelinge
    FOREIGN KEY (id_typelinge)
    REFERENCES LINGE(id_typelinge),
ADD CONSTRAINT ce_detailBesoin_id_type
    FOREIGN KEY (id_type)
    REFERENCES SERVICE(id_type),
ADD CONSTRAINT ce_detailBesoin_id_categorie
    FOREIGN KEY (id_categorie)
    REFERENCES SERVICE(id_categorielinge);