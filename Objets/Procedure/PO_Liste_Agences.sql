--Creation de la procedure d'affichage de la liste des agences d'un pressing
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE PO_LISTE_AGENCES (id_pressing PRESSING.id%TYPE)
    AS
    DECLARE
        CURSOR agences_dispo IS
            SELECT  pa.nom "pays", 
                    vi.nom "ville",
                    qu.nom "quartier",
                    ag.date_creation "date_creation"
            FROM   AGENCE ag
            JOIN   QUARTIER qu
            ON     (ag.id_quartier = qu.id)
            JOIN   VILLE vi
            ON     (qu.id_ville = vi.id)
            JOIN   PAYS pa
            ON     (vi.id_pays = pa.id)
            WHERE  ag.id_pressing = PO_LISTE_AGENCES.id_pressing
        ;
    BEGIN
        FOR une_agence IN agences_dispo LOOP
            DBMS_OUTPUT.PUT_LINE(une_agence."pays"||', '||
                                 une_agence."ville"||', '||
                                 une_agence."quartier"||', '||
                                 une_agence."date_creation"
                                );
            EXIT WHEN agences_dispo%NOTFOUND;
        END LOOP;
    END;
/