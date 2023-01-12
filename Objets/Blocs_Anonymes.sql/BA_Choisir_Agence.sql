DECLARE
    TYPE les_agences IS TABLE OF AGENCE%ROWTYPE
    INDEX BY PLS_INTEGER;
    agences les_agences;
    index PLS_INTEGER := 1;
    choix VARCHAR2(1);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Entrer le numero correspondant a une agence de votre choix parmi cette liste')
    FOR l_agence IN (
                        SELECT * 
                        FROM AGENCE
                        WHERE id_pressing = '&id_pressing'
                    )
    LOOP
        agences(index) := l_agence;
        index := index + 1;
    END LOOP;
    IF FO_IS_NUMBER(choix) THEN


