SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Ajout_pressing IS 
DECLARE
V_ID_PRES PRESSING.id%TYPE;
V_Sysdate_PRES PRESSING.date_creation%TYPE;
BEGIN
V_ID_PRES = 'PR0'
V_Sysdate_PRES = SYSDATE;
INSERT INTO PRESSING (id,nom,date_creation,id_proprietaire)
        VALUES (
                V_ID_PRES||seq_pressing.nexval,
                DBMS_OUTPUT.PUT_LINE('Entrez le nom de votre pressing:' &Nom),
                V_Sysdate_PRES,
                seq_utilisateur.nexval
            );
END;
/
                DBMS_OUTPUT.PUT_LINE('Creation reussie !'); 
SELECT * FROM PRESSING;