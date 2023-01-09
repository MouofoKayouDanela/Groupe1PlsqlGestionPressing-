SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE PO_LISTE_CATEGORIE_SERVICES
    (
        id_agence AGENCE.id%TYPE,
        id_type_service TYPE_SERVICE.id%TYPE
    )
    AS
    CURSOR liste_categorie_services IS
        SELECT  cs.id "id",
                cs.nom "nomCatS",
                ts.intitule "nomTypeS"
        FROM    CATEGORIE_SERVICE cs
        JOIN    SERVICE_AGENCE sa
        ON      (cs.id = sa.id_categorie)
        JOIN    TYPE_SERVICE ts
        ON      (sa.id_type = ts.id)
        WHERE   sa.id_agence = PO_LISTE_CATEGORIE_SERVICES.id_agence
        AND     sa.id_type = PO_LISTE_CATEGORIE_SERVICES.id_type_service
    ;
    compteur INTEGER := 1;
    BEGIN
        FOR service_exist IN liste_categorie_services LOOP
            DBMS_OUTPUT.PUT_LINE(compteur||' - '||service_exist."nomTypeS"
                                ||' '||service_exist."nomCatS");
            compteur := compteur + 1;
            EXIT WHEN liste_categorie_services%NOTFOUND;
        END LOOP;
    END;
/