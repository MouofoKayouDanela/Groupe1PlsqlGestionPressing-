CREATE OR REPLACE PACKAGE PA_CONSULTATION_LINGE_AGENCE AS
    PROCEDURE PO_CONSULTER_LINGE_AGENCE(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_LINGE_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_LINGE_AGENCE AS
    PROCEDURE PO_CONSULTER_LINGE_AGENCE(id_agence AGENCE.id%TYPE) IS
    compteur PLS_INTEGER := 1;
    BEGIN
        FOR un_linge IN (
                            SELECT  tl.intitule "intitule",
                                    cl.nom "nom",
                                    la.date_Ajout "date_a",
                                    la.date_retrait "date_r"
                            FROM    LINGE_AGENCE la
                            JOIN    TYPE_LINGE tl
                            ON      (la.id_type = tl.id)
                            JOIN    CATEGORIE_LINGE cl
                            ON      (la.id_categorie = cl.id)
                            WHERE   la.id_agence = PO_CONSULTER_LINGE_AGENCE.id_agence
                        )
        LOOP 
            IF un_linge."date_r" IS NULL THEN
                DBMS_OUTPUT.PUT_LINE(compteur||' - '||un_linge."intitule"||' '||un_linge."nom"
                                    ||' ajoute le '||un_linge."date_a");
                compteur := compteur + 1;
            END IF;
        END LOOP;
    END;
END PA_CONSULTATION_LINGE_AGENCE;
/