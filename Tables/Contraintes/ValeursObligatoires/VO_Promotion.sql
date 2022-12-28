ALTER  TABLE PROMOTION 
 MODIFY   id VARCHAR2 (50) NOT NULL
 MODIFY   quantite INT NOT NULL
 MODIFY   pourcentageRetrait FLOAT NOT NULL
 MODIFY   dateCreation DATE NOT NULL
 MODIFY   dateExpiration DATE NOT NULL
 MODIFY   id_categorielinge VARCHAR2(50) NOT NULL
 MODIFY   id_categorieService VARCHAR2(50) NOT NULL
 MODIFY   id_agenceLinge  VARCHAR2(50) NOT NULL
 MODIFY   prix_unitaire FLOAT NOT NULL   
;