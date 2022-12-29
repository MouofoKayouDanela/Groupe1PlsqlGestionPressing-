ALTER TABLE COMMANDE
ADD(    CONSTRAINT ce_commande_addresseRamassage
        FOREIGN KEY (addresseRamassage) REFERENCES QUARTIER (id_quartier),
        CONSTRAINT ce_commande_addresseLivraison
        FOREIGN KEY (addresseLivraison) REFERENCES QUARTIER (id_quartier)
        CONSTRAINT ce_commande_ dateEmissionMessage
        FOREIGN KEY (id_besoin,id_agence,dateEmissionMessage) REFERENCES MESSAGE (id_besoin,id_agence,dateEmissionMessage)    
);