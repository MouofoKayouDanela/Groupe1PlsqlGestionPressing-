ALTER TABLE OFFRE
ADD CONSTRAINT cp_offre_id 
PRIMARY KEY (id_categorie_linge,id_type_linge,id_categorie_Service,id_type_service,id_agence_Linge,prix_unitaire);