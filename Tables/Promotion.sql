CREATE TABLE PROMOTION (
    id VARCHAR2 (50),
    quantite INT,
    pourcentageRetrait FLOAT,
    dateCreation DATE,
    dateExpiration DATE,
    id_categorielinge VARCHAR2(50),
    id_categorieService VARCHAR2(50),
    id_agenceLinge  VARCHAR2(50),
    prix_unitaire FLOAT    
);