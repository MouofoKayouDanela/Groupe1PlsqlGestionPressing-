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
                seq,
                '&nom',
                V_Sysdate_PRES,
                id
            );
END;
/