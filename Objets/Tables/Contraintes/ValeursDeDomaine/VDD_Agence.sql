ALTER TABLE AGENCE
ADD CONSTRAINT vdd_agence
CHECK(date_creation <= TO_DATE(SYSDATE, "dd/mm/yyyy"));