CREATE OR REPLACE PACKAGE PA_CONSULTATION_SERVICE_AGENCE AS
    PROCEDURE PO_CONSULTER_SERVICE_AGENCE(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_SERVICE_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_SERVICE_AGENCE AS
    PROCEDURE PO_CONSULTER_SERVICE_AGENCE(id_agence AGENCE.id%TYPE) IS
        compteur PLS_INTEGER := 1;
        lignes_affiches PLS_INTEGER := 0;
        CURSOR les_services IS  SELECT  ts.intitule "intitule",
                                    cs.nom "nom",
                                    sa.date_Ajout "date_a",
                                    sa.date_retrait "date_r"
                                FROM    SERVICE_AGENCE sa
                                JOIN    TYPE_SERVICE ts
                                ON      (sa.id_type = ts.id)
                                JOIN    CATEGORIE_SERVICE cs
                                ON      (sa.id_categorie = cs.id)
                                WHERE   sa.id_agence = PO_CONSULTER_SERVICE_AGENCE.id_agence
        ;
        un_service les_services%ROWTYPE;
    BEGIN
        LOOP
            FETCH les_services INTO un_service;
            EXIT WHEN les_services%NOTFOUND; 
            IF un_service."date_r" IS NULL THEN
                DBMS_OUTPUT.PUT_LINE(compteur||' - '||un_service."intitule"||' '||un_service."nom"
                                    ||' ajoute le '||un_service."date_a");
                compteur := compteur + 1;
                lignes_affiches := lignes_affiches + 1;
            END IF;
        END LOOP;
        IF lignes_affiches = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Cette agence ne dispose pas de service !');
        END IF;
    END;
END PA_CONSULTATION_SERVICE_AGENCE;
/