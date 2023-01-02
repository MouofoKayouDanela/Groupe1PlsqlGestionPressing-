ALTER TABLE LINGE
ADD
(
    CONSTRAINT ce_categorie_linge_id_categorie FOREIGN KEY (id_categorie) REFERENCES CATEGORIE_LINGE(id),
    CONSTRAINT ce_type_linge_id_type FOREIGN KEY (id_type) REFERENCES TYPE_SERVICE(id)
);