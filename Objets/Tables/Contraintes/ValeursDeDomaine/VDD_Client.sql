ALTER TABLE CLIENT
ADD CONSTRAINT vdd_client
CHECK(date_inscription <= TO_DATE(SYSDATE, "dd/mm/yyyy"));