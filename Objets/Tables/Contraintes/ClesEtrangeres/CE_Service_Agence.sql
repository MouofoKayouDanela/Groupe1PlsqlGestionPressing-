ALTER TABLE SERVICE_AGENCE
ADD(
        CONSTRAINT ce_service_agence_id_categorie_id_type
        FOREIGN KEY (id_categorie,id_type) REFERENCES SERVICE(id_categorie,id_type),
        CONSTRAINT ce_service_agence_id_agence
        FOREIGN KEY (id_agence) REFERENCES AGENCE (id)
);