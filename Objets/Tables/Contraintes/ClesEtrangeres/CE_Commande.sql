ALTER TABLE COMMANDE
ADD(    
        CONSTRAINT ce_commande_adresse_Ramassage
        FOREIGN KEY (adresse_Ramassage) REFERENCES QUARTIER (id),
        CONSTRAINT ce_commande_adresse_Livraison
        FOREIGN KEY (adresse_Livraison) REFERENCES QUARTIER (id),
        CONSTRAINT ce_commande_date_Emission_Message
        FOREIGN KEY (id_besoin,id_agence,date_Emission_Message) REFERENCES MESSAGE(id_besoin,id_agence,date_Emission)    
);