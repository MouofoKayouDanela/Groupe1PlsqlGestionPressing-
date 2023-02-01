 SET serveroutput ON;
 CREATE OR REPLACE PACKAGE PA_Recuperation_Nom_Pressing AS
FUNCTION Select_Pressing(nom  IN varchar ) RETURN varchar;
END PA_Recuperation_Nom_Pressing;
/
CREATE OR REPLACE PACKAGE BODY PA_Recuperation_Nom_Pressing AS
FUNCTION Select_Pressing(nom IN varchar)
RETURN varchar IS
CURSOR cur_pressing  IS
SELECT id FROM PRESSING pr WHERE pr.nom=Select_Pressing.nom;
id_P varchar(255);
BEGIN
OPEN cur_pressing;
FETCH cur_pressing INTO id_p;
IF cur_pressing%NOTFOUND THEN
          DBMS_OUTPUT.PUT_LINE('ce pressing n existe pas ');
           END IF;
CLOSE cur_pressing;
RETURN id_p;
END Select_Pressing;
END PA_Recuperation_Nom_Pressing;
/

