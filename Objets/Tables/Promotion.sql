CREATE TABLE PROMOTION (
    id VARCHAR2 (50),
    quantite INT,
    pourcentage_Retrait FLOAT,
    date_Creation DATE,
    date_Expiration DATE,
    id_categorie_linge VARCHAR2(50),
    id_categorie_Service VARCHAR2(50),
    id_type_linge VARCHAR2(50),
    id_type_service VARCHAR2(50),    
    id_agence_Linge  VARCHAR2(50),
    prix_unitaire FLOAT    
);