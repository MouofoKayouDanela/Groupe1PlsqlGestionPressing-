ALTER TABLE PROMOTION
ADD CONSTRAINT ce_promotion_id
FOREIGN KEY (id_categorie_linge,id_type_linge,id_categorie_Service,id_type_service,id_agence_Linge,prix_unitaire)
REFERENCES OFFRE (id_categorie_linge,id_categorie_Service,id_type_linge,id_type_service,id_agence_Linge,prix_unitaire);