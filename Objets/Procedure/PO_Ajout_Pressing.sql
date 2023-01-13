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
                V_ID_PRES,
                DBMS_OUTPUT.PUT_LINE('Entrez le nom de votre pressing :' &Prenom),
                V_Sysdate_PRES,
                id
            );
END;
/
                DBMS_OUTPUT.PUT_LINE('Creation reussie !'); 
SELECT * FROM PRESSING;