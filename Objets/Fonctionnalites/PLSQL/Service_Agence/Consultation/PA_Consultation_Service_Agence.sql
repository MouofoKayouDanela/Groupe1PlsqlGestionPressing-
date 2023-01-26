CREATE OR REPLACE PACKAGE PA_CONSULTATION_SERVICE_AGENCE AS
    PROCEDURE PO_CONSULTER_SERVICE_AGENCE(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_SERVICE_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_SERVICE_AGENCE AS
    PROCEDURE PO_CONSULTER_SERVICE_AGENCE(id_agence AGENCE.id%TYPE) IS
    compteur PLS_INTEGER := 1;
    BEGIN
        FOR un_service IN (
                            SELECT  ts.intitule "intitule",
                                    cs.nom "nom",
                                    sa.date_Ajout "date_a",
                                    sa.date_retrait "date_r"
                            FROM    SERVICE_AGENCE sa
                            JOIN    TYPE_SERVICE ts
                            ON      (sa.id_type = ts.id)
                            JOIN    CATEGORIE_SERVICE cs
                            ON      (sa.id_categorie = cs.id)
                            WHERE   sa.id_agence = PO_CONSULTER_SERVICE_AGENCE.id_agence
                        )
        LOOP 
            IF un_service."date_r" IS NOT NULL THEN
                DBMS_OUTPUT.PUT_LINE(compteur||' - '||un_service."intitule"||' '||un_service."nom"
                                    ||' ajoute le '||un_service."date_a");
                compteur := compteur + 1;
            END IF;
        END LOOP;
    END;
END PA_CONSULTATION_SERVICE_AGENCE;
/