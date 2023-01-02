ALTER TABLE DETAILS_BESOIN
ADD(
    CONSTRAINT ce_detail_Besoin_id_besoin
    FOREIGN KEY (id_besoin)
    REFERENCES BESOIN(id),
    CONSTRAINT ce_detail_besoin_id_type_id_categorie_linge
    FOREIGN KEY (id_categorie_linge, id_type_linge)
    REFERENCES LINGE(id_categorie, id_type),
    CONSTRAINT ce_detail_Besoin_id_type_id_categorie_service
    FOREIGN KEY (id_categorie_service, id_type_service)
    REFERENCES  SERVICE(id_categorie, id_type)
);