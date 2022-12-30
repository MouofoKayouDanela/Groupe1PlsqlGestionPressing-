ALTER TABLE SERVICE
ADD
(
    CONSTRAINT ce_categorie_service_id_categorie FOREIGN KEY (id_categorie) REFERENCES CATEGORIE_SERVICE(id),
    CONSTRAINT ce_type_service_id_type FOREIGN KEY (id_type) REFERENCES TYPE_SERVICE(id)
);