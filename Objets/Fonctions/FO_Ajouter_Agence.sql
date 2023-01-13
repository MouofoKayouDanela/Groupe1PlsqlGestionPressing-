SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION FO_AJOUTER_AGENCE
( 
    id_pressing PRESSING.id%TYPE, 
    id_quartier QUARTIER.id%TYPE
)
RETURN BOOLEAN
IS
    agence_ins AGENCE%ROWTYPE;
    date_creation AGENCE.date_creation%TYPE := TO_DATE(SYSDATE, 'DD/MM/YYYY');
    id_agence AGENCE.id%TYPE := seq_agence.nextval;
BEGIN
    INSERT INTO AGENCE
    (
        id,
        id_pressing,
        date_creation,
        id_quartier
    )
    VALUES
    (
        id_agence,
        id_pressing,
        date_creation,
        id_quartier
    );
    SELECT  *
    INTO    agence_ins
    FROM    AGENCE ag
    WHERE   id = id_agence
    AND     ag.id_pressing = FO_AJOUTER_AGENCE.id_pressing
    AND     ag.id_quartier = FO_AJOUTER_AGENCE.id_quartier
    AND     ag.date_creation = FO_AJOUTER_AGENCE.date_creation
    ;
    IF agence_ins.id IS NOT NULL THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/