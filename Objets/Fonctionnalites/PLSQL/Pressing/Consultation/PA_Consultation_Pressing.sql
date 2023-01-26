CREATE OR REPLACE PACKAGE PA_CONSULTATION_PRESSING AS
    PROCEDURE PO_CONSULTER_PRESSING(id_proprio PROPRIETAIRE.id%TYPE);
END PA_CONSULTATION_PRESSING;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_PRESSING AS
    PROCEDURE PO_CONSULTER_PRESSING(id_proprio PROPRIETAIRE.id%TYPE) IS
        compteur PLS_INTEGER := 1;
        CURSOR les_pressing IS  SELECT  pre.nom "nom_pressing"
                                FROM    PRESSING pre
                                JOIN    PROPRIETAIRE pro
                                ON      (pre.id_proprietaire = pro.id)
                                WHERE   pro.id = PO_CONSULTER_PRESSING.id_proprio
        ;
        un_pressing PRESSING.nom%TYPE;
    BEGIN 
        OPEN les_pressing;
        IF les_pressing%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('Ce proprietaire ne dispose d''aucun pressing ! ');
        ELSE
            LOOP
                FETCH les_pressing INTO un_pressing;
                DBMS_OUTPUT.PUT_LINE(compteur||' - '||un_pressing);
                EXIT WHEN les_pressing%NOTFOUND;
                compteur := compteur + 1;
            END LOOP;
        END IF;
        CLOSE les_pressing;
    END;
END PA_CONSULTATION_PRESSING;
/