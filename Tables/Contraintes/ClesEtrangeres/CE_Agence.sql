ALTER TABLE AGENCE
ADD(
        CONSTRAINT ce_agence_id_pressing
        FOREIGN KEY (id_pressing) REFERENCES PRESSING (id),
        CONSTRAINT ce_agence_id_quartier
        FOREIGN KEY (id_quartier) REFERENCES QUARTIER (id_quartier)
);