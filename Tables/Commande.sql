CREATE TABLE COMMANDE (
    id VARCHAR2 (50),
    description VARCHAR2(255),
    adressePayement VARCHAR2(255),
    addresseRamassage VARCHAR2 (50),
    addresseLivraison VARCHAR2(50),
    id_besoin VARCHAR2(50),
    id_agence VARCHAR2(50),
    dateEmissionMessage DATE
);