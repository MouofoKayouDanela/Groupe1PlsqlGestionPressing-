ALTER TABLE AGENT
ADD
(
    CONSTRAINT ce_agence_id_agence FOREIGN KEY (id_agence) REFERENCES Agence(id),
    CONSTRAINT ce_agence_id_role FOREIGN KEY (id_role) REFERENCES Role(id)
);