ALTER TABLE PRESSING
ADD CONSTRAINT vdd_pressing
CHECK(date_creation <= TO_DATE(SYSDATE, "dd/mm/yyyy"));