ALTER TABLE VILLE
ADD CONSTRAINT ce_ville_id_pays
FOREIGN KEY (id_pays)
REFERENCES PAYS(id);


