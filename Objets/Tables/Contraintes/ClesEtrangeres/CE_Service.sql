ALTER TABLE SERVICE
ADD
(
    CONSTRAINT ce_categorie_id_categorie FOREIGN KEY (id_categorie) REFERENCES Categorie(id),
    CONSTRAINT ce_type_id_type FOREIGN KEY (id_type) REFERENCES Type(id)
);