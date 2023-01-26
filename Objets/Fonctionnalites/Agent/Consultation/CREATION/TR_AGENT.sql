CREATE OR REPLACE TRIGGER add_agent
AFTER INSERT
ON utilisateur
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO agent
 VALUES ('UT||seq_agent.NEXTVAL', '&date_embauche', '&Agence', '&Role');
  
  DBMS_OUTPUT.PUT_LINE('agent created');
END;