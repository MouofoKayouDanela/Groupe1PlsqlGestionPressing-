SET SERVEROUTPUT ON
DECLARE
    TYPE liste_pays IS TABLE OF PAYS%ROWTYPE
    INDEX BY PLS_INTEGER;
    TYPE liste_villes IS TABLE OF VILLE%ROWTYPE
    INDEX BY PLS_INTEGER;
    TYPE liste_quartiers IS TABLE OF VILLE%ROWTYPE
    INDEX BY PLS_INTEGER;
    lp liste_pays;
    sortir BOOLEAN := FALSE;
    validation BOOLEAN := FALSE;
    CURSOR listes IS SELECT id,
                            nom
                     FROM   PAYS
    ;
    index_posi PLS_INTEGER := 1;
    dern_posi PLS_INTEGER := 0;
    compteur PLS_INTEGER := 0;
    choix CHAR(1);
    ident_pays PAYS.id%TYPE;
    voir_plus BOOLEAN := FALSE;
BEGIN
  FOR elem IN listes LOOP
    lp(index_posi) := elem;
    EXIT WHEN listes%NOTFOUND;
    index_posi := index_posi + 1;
  END LOOP;
  dern_posi := index_posi;
  index_posi := 1;
  WHILE NOT sortir LOOP
    DBMS_OUTPUT.PUT_LINE('Veuillez choisir le pays dans lequels vous souhaitez ajouter une agence de votre pressing :');
    WHILE index_posi <= dern_posi AND compteur < 3 LOOP
        DBMS_OUTPUT.PUT_LINE(index_posi||' - '||lp(index_posi));
        index_posi := index_posi + 1;
        compteur := compteur + 1;
        IF compteur = 2 THEN
            IF index_posi <= dern_posi THEN
                DBMS_OUTPUT.PUT_LINE('A - voir plus');
                DBMS_OUTPUT.PUT_LINE('B - sortir');
                voir_plus := TRUE;
            ELSE
                DBMS_OUTPUT.PUT_LINE('B - sortir');
                voir_plus := FALSE;
            END IF;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Veuillez entrer le caractere symbolisant votre choix : ');
    choix := '&choix';
    IF choix = 'B' THEN 
        sortir := TRUE;
    ELSIF choix = 'A' AND voir_plus THEN
        compteur := 0;
    ELSIF FO_IS_NUMBER(choix) THEN
        ident_pays :=  lp(TO_NUMBER(choix)).id;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Choix invalide');
    END IF;
  END LOOP;
END;
/
    