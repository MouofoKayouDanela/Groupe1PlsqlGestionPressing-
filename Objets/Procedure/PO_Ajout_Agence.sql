SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Ajout_agence IS 
DECLARE
V_ID_AGENCE AGENCE.id%TYPE;
V_Sysdate_AGENCE AGENCE.date_creation%TYPE;
BEGIN
V_ID_AGENCE = 'AG0';
V_Sysdate_AGENCE = SYSDATE;
INSERT INTO AGENCE (id,date_creation,id_pressing,id_quartier)
        VALUES (
                seq,
                V_Sysdate_AGENCE,
                id,
                id
            );
END;
/            