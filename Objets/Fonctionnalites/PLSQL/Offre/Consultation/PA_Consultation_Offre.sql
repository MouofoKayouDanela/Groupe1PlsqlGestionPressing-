CREATE OR REPLACE PACKAGE PA_CONSULTATION_OFFRE AS
    PROCEDURE PO_CONSULTATION_OFFRE(id_agence AGENCE.id%TYPE, id_annonce ANNONCE.id%TYPE);
END PA_CONSULTATION_OFFRE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_OFFRE AS
    PROCEDURE PO_CONSULTATION_OFFRE(id_agence AGENCE.id%TYPE, id_annonce ANNONCE.id%TYPE) IS
    compteur PLS_INTEGER := 1;
    BEGIN
        FOR une_offre IN (
                            SELECT  tl.intitule "intitule_linge",
                                    cl.nom "nom_linge",
                                    ts.intitule "intitule_service",
                                    cs.nom "nom_service",
                                    o.prix_unitaire "prix"
                            FROM    OFFRE o
                            JOIN    TYPE_LINGE tl
                            ON      (o.id_type_linge = tl.id)
                            JOIN    CATEGORIE_LINGE cl
                            ON      (o.id_categorie_linge = cl.id)
                            JOIN    TYPE_SERVICE ts
                            ON      (o.id_type_service = ts.id)
                            JOIN    CATEGORIE_SERVICE cs
                            ON      (o.id_categorie_Service = cs.id)
                            WHERE   o.id_agence_Linge = PO_CONSULTATION_OFFRE.id_agence
                            AND     o.id_annonce = PO_CONSULTATION_OFFRE.id_annonce
        )LOOP
            DBMS_OUTPUT.PUT_LINE('OFFRE N°'||compteur);
            DBMS_OUTPUT.PUT_LINE('linge                     : '||une_offre."intitule_linge"||' '||une_offre."nom_linge");
            DBMS_OUTPUT.PUT_LINE('service                   : '||une_offre."intitule_service"||' '||une_offre."nom_service");
            DBMS_OUTPUT.PUT_LINE('prix unitaire du service  : '||une_offre."prix"||' FCFA');
            compteur := compteur + 1;
        END LOOP;
    END;
END PA_CONSULTATION_OFFRE;
/