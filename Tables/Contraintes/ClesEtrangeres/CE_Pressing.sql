ALTER TABLE PRESSING
ADD CONSTRAINT ce_pressing_id_proprietaire
FOREIGN KEY (id_proprietaire)
REFERENCES PROPRIETAIRE(id);