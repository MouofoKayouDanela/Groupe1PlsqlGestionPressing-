CREATE OR REPLACE PACKAGE PA_CONSULTATION_LINGE_AGENCE AS
    PROCEDURE PO_CONSULTER_LINGE_AGENCE(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_LINGE_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_LINGE_AGENCE AS
    PROCEDURE PO_CONSULTER_LINGE_AGENCE(id_agence AGENCE.id%TYPE) IS
        compteur PLS_INTEGER := 1;
        lignes_affiches PLS_INTEGER := 0;
        CURSOR les_linges IS    SELECT  tl.intitule "intitule",
                                        cl.nom "nom",
                                        la.date_Ajout "date_a",
                                        la.date_retrait "date_r"
                                FROM    LINGE_AGENCE la
                                JOIN    TYPE_LINGE tl
                                ON      (la.id_type = tl.id)
                                JOIN    CATEGORIE_LINGE cl
                                ON      (la.id_categorie = cl.id)
                                WHERE   la.id_agence = PO_CONSULTER_LINGE_AGENCE.id_agence
        ;
        un_linge les_linges%ROWTYPE;
    BEGIN
        OPEN les_linges;
        LOOP
            FETCH les_linges INTO un_linge;
            EXIT WHEN les_linges%NOTFOUND; 
            IF un_linge."date_r" IS NULL THEN
                DBMS_OUTPUT.PUT_LINE(compteur||' - '||un_linge."intitule"||' '||un_linge."nom"
                                    ||' ajoute le '||un_linge."date_a");
                compteur := compteur + 1;
                lignes_affiches := lignes_affiches + 1;
            END IF;
        END LOOP;
        IF lignes_affiches = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Cette agence ne traite aucun linge !');
        END IF;
        CLOSE les_linges;
    END;
END PA_CONSULTATION_LINGE_AGENCE;
/