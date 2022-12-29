ALTER TABLE AGENT
ADD
(
    CONSTRAINT ce_agent_id FOREIGN KEY (id) REFERENCES UTILISATEUR (id),
    CONSTRAINT ce_agent_id_agence FOREIGN KEY (id_agence) REFERENCES Agence(id),
    CONSTRAINT ce_agent_id_role FOREIGN KEY (id_role) REFERENCES Role(id)
);