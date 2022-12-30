ALTER TABLE OFFRE
ADD(
        CONSTRAINT ce_offre_id_linge_agence
        FOREIGN KEY (id_categorie_linge,id_agence_Linge,date_Ajout_Linge) REFERENCES LINGE_AGENCE (id_categorie,id_agence,Date_ajout),
        CONSTRAINT ce_offre_service_agence
        FOREIGN KEY ( id_categorie_Service,id_agence_Service,date_Ajout_service) REFERENCES SERVICE_AGENCE (id_categorie,id_agence,Date_ajout),
        CONSTRAINT ce_offre_id_annonce
        FOREIGN KEY (id_annonce) REFERENCES ANNONCE (id)
);