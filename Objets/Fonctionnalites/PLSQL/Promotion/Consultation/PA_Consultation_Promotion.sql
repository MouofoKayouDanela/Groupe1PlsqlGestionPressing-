CREATE OR REPLACE PACKAGE PA_CONSULTATION_PROMOTION AS
    PROCEDURE PO_CONSULTER_PROMOTION(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_PROMOTION;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_PROMOTION AS
    PROCEDURE PO_CONSULTER_PROMOTION(id_agence AGENCE.id%TYPE) IS
        CURSOR les_promotions IS    SELECT  pro.id "id",
                                            pro.quantite "quantite",
                                            pro.date_Creation "date_cre",
                                            pro.date_Expiration "date_exp",
                                            pro.pourcentage_Retrait "pourcent_ret",
                                            pro.prix_unitaire "prit_unit",
                                            pro.statut "statut",
                                            cl.nom "cat_linge",
                                            tl.intitule "type_linge",
                                            cs.nom "cat_service",
                                            ts.intitule "type_service"
                                    FROM    PROMOTION pro
                                    JOIN    CATEGORIE_LINGE cl
                                    ON      (pro.id_categorie_linge = cl.id)
                                    JOIN    TYPE_LINGE tl
                                    ON      (pro.id_type_linge = tl.id)
                                    JOIN    CATEGORIE_SERVICE cs
                                    ON      (pro.id_categorie_Service = cs.id)
                                    JOIN    TYPE_SERVICE ts
                                    ON      (pro.id_type_service = ts.id)
                                    JOIN    AGENCE ag
                                    ON      (pro.id_agence_Linge = ag.id)
                                    WHERE   ag.id = PO_CONSULTER_PROMOTION.id_agence
        ;
        une_promotion les_promotions%ROWTYPE;
        lignes_affiches PLS_INTEGER := 0;
        compteur PLS_INTEGER := 1;
    BEGIN
        OPEN les_promotions;
        LOOP
            FETCH les_promotions INTO une_promotion;
            EXIT WHEN les_promotions%NOTFOUND;
            IF une_promotion."statut" IS NULL AND 
               une_promotion."date_exp" >= TO_DATE(CURRENT_DATE, 'dd/mm/yyyy') THEN
                DBMS_OUTPUT.PUT_LINE('PROMOTION NUMERO '||compteur);
                DBMS_OUTPUT.PUT_LINE('Linge considere                               : '
                                    ||une_promotion."type_linge"||' '||une_promotion."cat_linge");
                DBMS_OUTPUT.PUT_LINE('Service correspondant                         : '
                                    ||une_promotion."type_service"||' '||une_promotion."cat_service");
                DBMS_OUTPUT.PUT_LINE('Prix unitaire du service                      : '
                                    ||une_promotion."prit_unit"||' FCFA');
                DBMS_OUTPUT.PUT_LINE('Quantite minimale beneficiant de la promotion : '
                                    ||une_promotion."quantite");
                DBMS_OUTPUT.PUT_LINE('Pourcentage de reduction                      : '
                                    ||une_promotion."pourcent_ret"||' %');
                DBMS_OUTPUT.PUT_LINE('Date d''expiration de la promotion            : '
                                    ||une_promotion."date_exp");
                DBMS_OUTPUT.PUT_LINE('_________________________________________________________________');
                compteur := compteur + 1;
                lignes_affiches := lignes_affiches + 1;
            END IF;
        END LOOP;
        IF lignes_affiches = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Cette agence ne propose aucune promotion !');
        END IF;
        CLOSE les_promotions;
    END;

END PA_CONSULTATION_PROMOTION;
/