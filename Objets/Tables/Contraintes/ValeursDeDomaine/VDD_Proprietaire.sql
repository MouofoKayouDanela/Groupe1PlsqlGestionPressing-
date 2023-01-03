ALTER TABLE PROPRIETAIRE
ADD CONSTRAINT vdd_proprietaire
CHECK(date_enregistrement <= TO_DATE(SYSDATE, "dd/mm/yyyy"));