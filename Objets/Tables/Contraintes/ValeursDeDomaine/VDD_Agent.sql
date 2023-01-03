ALTER TABLE AGENT
ADD CONSTRAINT vdd_agent
CHECK(date_embauche <= TO_DATE(SYSDATE, "dd/mm/yyyy"));