-- Création de la procédure d'affichage du menu principal
CREATE PROCEDURE MENU_CONSULTATION
    AS
    BEGIN
        PROMPT CONSULTER LES DETAILS D'UN PRESSING
        PROMPT 1 - La liste des agences
        PROMPT 2 - La liste des tupes de service d'une agence
        PROMPT 3 - La liste des services d'un type de servce d'une agence
        PROMPT A - Sortir
    END;

--Création de la fonction de sélection d'un pressing connaissant son proprietaire
CREATE OR REPLACE FONCTION FO_SELECTIONNER_PRESSING (id_proprietaire PROPRIETAIRE.id%TYPE)
    RETURN PRESSING.id%TYPE
    AS
        id_pressing PRESSING.id%TYPE;
        noms_pressing PRESSING.nom%TYPE;
        compteur INTEGER := 1;
    BEGIN
        FOR pressing_seul IN (
                                SELECT pre.id "id",
                                       pre.nom "nom"
                                FROM   PRESSING pre 
                                JOIN   PROPRIETAIRE pro
                                ON     (pre.id_proprietaire = pro.id)
                                WHERE  pro.id = FO_SELECTIONNER_PRESSING.id_proprietaire
                            )
        LOOP 
            DBMS_OUTPUT.PUT_LINE(compteur||' - '||pressing_seul.nom);
            compteur 
        END LOOP;
    END;

CREATE OR REPLACE PROCEDURE CONSULTER_DETAILS_PRESSING
    AS
        choix CHAR(1);
        validation CHAR(1);
        sortir BOOLEAN := FALSE;
    BEGIN
        WHILE NOT sortir LOOP 
            MENU_CONSULTATION;
            LOOP
                choix := '&choix_fait';
                PROMPT B- Valider               C - Annuler
                validation := '&choix_fait';
                IF validation = 'B' THEN
                END IF; 
                EXIT WHEN validation = 'C';
            END LOOP;
        END LOOP;
    END;