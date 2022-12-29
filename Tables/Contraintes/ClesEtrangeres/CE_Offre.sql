ALTER TABLE OFFRE
ADD(
        CONSTRAINT ce_offre_id_linge_agence
        FOREIGN KEY (id_categorielinge,id_agenceLinge,dateAjoutLinge) REFERENCES LINGE_AGENCE (id_lingeAgence,id_agence,Date_ajout),
        CONSTRAINT ce_offre_service_agence
        FOREIGN KEY ( id_categorieService,id_agenceService,dateAjoutservice) REFERENCES SERVICE_AGENCE (id_categorie,id_agence,Date_ajout),
        CONSTRAINT ce_offre_id_annonce
        FOREIGN KEY (id_annonce) REFERENCES ANNONCE (id)
);