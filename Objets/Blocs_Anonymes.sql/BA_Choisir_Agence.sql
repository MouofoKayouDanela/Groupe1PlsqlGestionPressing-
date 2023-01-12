DECLARE
    TYPE les_agences IS TABLE OF AGENCE%ROWTYPE
    INDEX BY PLS_INTEGER;
    agences les_agences;
BEGIN
    FOR l_agence IN (
                        SELECT * 
                        FROM AGENCE
                        WHERE id_pressing = 
                    )