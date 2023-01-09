SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE PO_Liste_Types_Services (id_agence AGENCE.id%TYPE)
    AS
    CURSOR liste_types IS
        (SELECT DISTINCT ts.id "id",
                ts.intitule "intitule"
        FROM    SERVICE_AGENCE sa
        JOIN    TYPE_SERVICE ts
        ON      (sa.id_type = ts.id)
        WHERE   sa.id_agence = PO_LISTE_TYPES_SERVICES.id_agence)
    ;
    compteur INTEGER := 1;
    BEGIN
        FOR type_s IN liste_types LOOP
            DBMS_OUTPUT.PUT_LINE(compteur||' - '||type_s."intitule");
            compteur := compteur + 1;
            EXIT WHEN liste_types%NOTFOUND;
        END LOOP;
    END;
/
