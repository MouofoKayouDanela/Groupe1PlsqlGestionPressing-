ALTER TABLE MESSAGE
ADD(
        CONSTRAINT ce_message_id_besoin
        FOREIGN KEY (id_besoin) REFERENCES BESOIN (id),
        CONSTRAINT ce_message_id_agence
        FOREIGN KEY (id_agence) REFERENCES AGENCE (id)
);