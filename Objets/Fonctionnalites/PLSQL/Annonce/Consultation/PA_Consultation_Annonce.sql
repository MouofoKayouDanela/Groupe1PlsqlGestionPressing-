CREATE OR REPLACE PACKAGE PA_CONSULTATION_ANNONCE AS
    PROCEDURE PO_CONSULTER_ANNONCE(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_ANNONCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_ANNONCE AS
    PROCEDURE PO_CONSULTER_ANNONCE(id_agence AGENCE.id%TYPE) IS 
        CURSOR les_annonces IS  SELECT  an.designation "design",
                                        cl.nom "cat_linge",
                                        tl.intitule "type_linge",
                                        cs.nom "cat_service",
                                        ts.intitule "type_service",
                                        offr.prix_unitaire "prix_unitaire",
                                        offr.statut "statut_offre",
                                        an.statut "statut_annonce"
                                FROM    ANNONCE an
                                JOIN    OFFRE offr
                                ON      (an.id = offr.id_annonce)
                                JOIN    CATEGORIE_LINGE cl
                                ON      (offr.id_categorie_linge = cl.id)
                                JOIN    TYPE_LINGE tl
                                ON      (offr.id_type_linge = tl.id)
                                JOIN    CATEGORIE_SERVICE cs
                                ON      (offr.id_categorie_Service = cs.id)
                                JOIN    TYPE_SERVICE ts
                                ON      (offr.id_type_service = ts.id)
                                WHERE   offr.id_agence_Linge = offr.id_agence_Service
                                AND     offr.id_agence_Linge = PO_CONSULTER_ANNONCE.id_agence
        ;
        une_annonce les_annonces%ROWTYPE;
        lignes_affiches PLS_INTEGER := 0;
        affiche_titre BOOLEAN := TRUE;
        compteur PLS_INTEGER := 1;
        ancien_titre ANNONCE.designation%TYPE;
    BEGIN
        OPEN les_annonces;
        LOOP
            FETCH les_annonces INTO une_annonce;
            EXIT WHEN les_annonces%NOTFOUND;
            IF une_annonce."statut_annonce" IS NULL THEN
                IF ancien_titre <> une_annonce."design" AND lignes_affiches <> 0 THEN
                    affiche_titre := TRUE;
                END IF;
                IF affiche_titre = TRUE THEN
                    DBMS_OUTPUT.PUT_LINE(compteur||' - '||une_annonce."design");
                    compteur := compteur + 1;
                    ancien_titre := une_annonce."design";
                    affiche_titre := FALSE;
                END IF;
                IF une_annonce."statut_offre" IS NULL THEN
                    DBMS_OUTPUT.PUT_LINE('Linge considere       : '||une_annonce."type_linge"
                        ||' '||une_annonce."cat_linge");
                    DBMS_OUTPUT.PUT_LINE('Service correspondant : '||une_annonce."type_service"
                        ||' '||une_annonce."cat_service");
                    DBMS_OUTPUT.PUT_LINE('Prix                  : '||une_annonce."prix_unitaire"||' FCFA');
                    DBMS_OUTPUT.PUT_LINE('__________________________________________________________________');
                END IF;
                lignes_affiches := lignes_affiches + 1;
            END IF;
        END LOOP;
        IF lignes_affiches = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Cette agence ne propose aucune annonce !');
        END IF;
        CLOSE les_annonces;
    END;
END PA_CONSULTATION_ANNONCE;
/