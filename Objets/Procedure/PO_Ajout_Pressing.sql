SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Ajout_pressing  
(V_ID_PRES PRESSING.id%TYPE,
V_NOM_PRES PRESSING.nom%TYPE)
V_Sysdate_PROP PRESSING.date_creation%TYPE;
IS
BEGIN
V_Sysdate_PROP := SYSDATE;
INSERT INTO PRESSING (id,nom,date_creation,id_proprietaire)
        VALUES (
                TO_CHAR(seq_pressing.nexval),
                '&V_NOM_PRES',
                V_Sysdate_PROP,
                TO_CHAR(seq_utilisateur.nexval)
            );
END;
/ 
SELECT * FROM PRESSING;
DBMS_OUTPUT.PUT_LINE('Creation Reussie !');