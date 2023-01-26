SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE PA_CONSULTATION_AGENCE AS
    PROCEDURE PO_CONSULTER_AGENCE(id_pressing PRESSING.id%TYPE);
END PA_CONSULTATION_AGENCE;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_AGENCE AS
    PROCEDURE PO_CONSULTER_AGENCE(id_pressing PRESSING.id%TYPE) IS
        compteur PLS_INTEGER := 1;
        BEGIN
            FOR une_agence IN (
                                SELECT  ag.date_creation "date_crea",
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
                            )
            LOOP 
                DBMS_OUTPUT.PUT_LINE(compteur||' - Agence cree le '||une_agence."date_crea"||' a '
                                    ||une_agence."quartier"||', '||une_agence."ville"||', '||une_agence."pays");
                compteur := compteur + 1;
            END LOOP;
        END;
END PA_CONSULTATION_AGENCE;
/
    