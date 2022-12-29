ALTER TABLE COMMANDE
ADD(    CONSTRAINT ce_commande_addresse_Ramassage
        FOREIGN KEY (addresse_Ramassage) REFERENCES QUARTIER (id),
        CONSTRAINT ce_commande_addresse_Livraison
        FOREIGN KEY (addresse-Livraison) REFERENCES QUARTIER (id)
        CONSTRAINT ce_commande_ date_Emission_Message
        FOREIGN KEY (id_besoin,id_agence,date_Emission_Message) REFERENCES MESSAGE (id_besoin,id_agence,date_Emission)    
);