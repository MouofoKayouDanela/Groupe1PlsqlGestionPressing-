SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE PA_CONSULTATION_AGENCE AS
    PROCEDURE PO_CONSULTER_AGENCE(id_pressing PRESSING.id%TYPE);
    FUNCTION FO_RETOURNER_ID_VIA_QUARTIER(nom_quartier QUARTIER.nom%TYPE, id_pressing PRESSING.id%TYPE) RETURN AGENCE.id%TYPE;
END PA_CONSULTATION_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_AGENCE AS
    PROCEDURE PO_CONSULTER_AGENCE(id_pressing PRESSING.id%TYPE) IS
        compteur PLS_INTEGER := 1;
        CURSOR les_agences IS   SELECT  ag.date_creation "date_crea",
                                        qu.nom "quartier",
                                        vi.nom "ville",
                                        pa.nom "pays"
                                FROM    AGENCE ag
                                JOIN    QUARTIER qu
                                ON      (ag.id_quartier = qu.id)
                                JOIN    VILLE vi
                                ON      (qu.id_ville = vi.id)
                                JOIN    PAYS pa
                                ON      (vi.id_pays = pa.id)
                                WHERE   ag.id_pressing = PO_CONSULTER_AGENCE.id_pressing
        ;
        une_agence les_agences%ROWTYPE;
        BEGIN
            OPEN les_agences;
            LOOP 
                FETCH les_agences INTO une_agence;
                EXIT WHEN les_agences%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(compteur||' - Agence cree le '||une_agence."date_crea"
                                    ||' dans le quartier : '||une_agence."quartier"||', de la ville : '
                                    ||une_agence."ville"||', presente dans le pays : '||une_agence."pays");
                compteur := compteur + 1;
            END LOOP;
            IF les_agences%ROWCOUNT = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Ce pressing ne comporte aucune agence !');
            END IF;
            CLOSE les_agences;
        END;
    FUNCTION FO_RETOURNER_ID_VIA_QUARTIER(nom_quartier QUARTIER.nom%TYPE, id_pressing PRESSING.id%TYPE) RETURN AGENCE.id%TYPE IS
        CURSOR une_agence IS    SELECT  ag.id "identi"
                                FROM    AGENCE ag
                                JOIN    QUARTIER qu
                                ON      (ag.id_quartier = qu.id)
                                JOIN    PRESSING pr
                                ON      (ag.id_pressing = pr.id)
                                WHERE   qu.nom = FO_RETOURNER_ID_VIA_QUARTIER.nom_quartier
                                AND     pr.id = FO_RETOURNER_ID_VIA_QUARTIER.id_pressing
        ;
        var_retour AGENCE.id%TYPE;
    BEGIN
        OPEN une_agence;
        FETCH une_agence INTO var_retour;
        IF une_agence%FOUND THEN
            CLOSE une_agence;
            RETURN var_retour;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Cette agence n''existe pas dans ce pressing');
            var_retour := '';
        END IF;
        CLOSE une_agence;
        RETURN var_retour;
    END;
    
END PA_CONSULTATION_AGENCE;
/
    