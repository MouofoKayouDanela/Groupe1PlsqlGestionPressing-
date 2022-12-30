ALTER TABLE Besoin
ADD CONSTRAINT ce_besoin_id_client
FOREIGN KEY (id_client)
REFERENCES CLIENT(id);