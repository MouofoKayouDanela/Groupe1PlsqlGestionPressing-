INSERT INTO PROMOTION
(
     id,
    quantite,
    pourcentage_Retrait,
    date_Creation ,
    date_Expiration ,
    id_categorie_linge ,
    id_categorie_Service ,
    id_type_linge ,
    id_type_service,    
    id_agence_Linge ,
    prix_unitaire 
)
values(
     'PO001',
     2,
     4,
     TO_DATE('17/01/2020', 'dd/mm/yyyy'),
     TO_DATE('31/01/2020', 'dd/mm/yyyy'),
     'CL001',    
     'CS001',
     'TL001',
     'TS002',
     'AG001',
     1000         
);
INSERT INTO PROMOTION
(    id,
    quantite,
    pourcentage_Retrait,
    date_Creation ,
    date_Expiration ,
    id_categorie_linge ,
    id_categorie_Service ,
    id_type_linge ,
    id_type_service,    
    id_agence_Linge ,
    prix_unitaire 
)
values(
     'PO002',
     12,
     2.5,
     TO_DATE('17/01/2023', 'dd/mm/yyyy'),
     TO_DATE('31/01/2023', 'dd/mm/yyyy'),
     'CL002',    
     'CS003',
     'TL003',
     'TS002',
     'AG002',
     800         
);