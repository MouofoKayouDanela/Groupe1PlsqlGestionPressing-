 SET serveroutput ON;
 CREATE OR REPLACE PACKAGE PA_Creation_Annonce AS
PROCEDURE Creation_Annonce(design VARCHAR2);
END PA_Creation_Annonce;
/
CREATE OR REPLACE PACKAGE BODY PA_Creation_Annonce AS
PROCEDURE Creation_Annonce(design VARCHAR2)
AS
user_id VARCHAR2(255) :=Generate_id(seq_annonce.nextval,'AN');
BEGIN
INSERT INTO Annonce(id,designation)
VALUES(user_id,design);
DBMS_OUTPUT.PUT_LINE('ENREGIST AVEC SUCSSES!!!');
END Creation_Annonce;
END PA_Creation_Annonce;
/