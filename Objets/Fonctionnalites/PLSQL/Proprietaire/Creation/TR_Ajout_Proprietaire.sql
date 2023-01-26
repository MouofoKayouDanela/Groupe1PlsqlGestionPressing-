CREATE OR REPLACE TRIGGER add_proprietaire AS
PACKAGE PA_UTILISATEUR
AFTER INSERT
ON utilisateur
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO PROPRIETAIRE
 VALUES ('UT||seq_utilisateur.NEXTVAL', SYSDATE);
  
  DBMS_OUTPUT.PUT_LINE('Propietaire created');
END;