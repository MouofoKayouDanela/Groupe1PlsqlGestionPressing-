ALTER  TABLE PROMOTION 
 MODIFY   id VARCHAR2 (50) NOT NULL
 MODIFY   quantite INT NOT NULL
 MODIFY   pourcentage_Retrait FLOAT NOT NULL
 MODIFY   date_Creation DATE NOT NULL
 MODIFY   date_Expiration DATE NOT NULL
 MODIFY   id_categorie_linge VARCHAR2(50) NOT NULL
 MODIFY   id_categorie_Service VARCHAR2(50) NOT NULL
 MODIFY    id_type_linge VARCHAR2(50) NOT NULL
 MODIFY   id_type_service VARCHAR2(50) NOT NULL 
 MODIFY   id_agence_Linge  VARCHAR2(50) NOT NULL
 MODIFY   prix_unitaire FLOAT NOT NULL   
;