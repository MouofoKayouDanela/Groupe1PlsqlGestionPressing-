CREATE TABLE COMMANDE (
    id VARCHAR2 (50),
    description VARCHAR2(255),
    adresse_Payement VARCHAR2(255),
    addresse_Ramassage VARCHAR2 (50),
    addresse_Livraison VARCHAR2(50),
    id_besoin VARCHAR2(50),
    id_agence VARCHAR2(50),
    date_Emission_Message DATE
);