SET serveroutput on;
CREATE PACKAGE PACK_AGENCES as
    FUNCTION VERIFY (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2;
END PACK_AGENCES;
CREATE PACKAGE BODY PACK_AGENCES AS 
    FUNCTION VERIFY (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2 IS
        Cur VARCHAR2(255);
        CURSOR Curs IS
            SELECT Ag.id
            FROM AGENCE Ag
            JOIN PRESSING Pr
            ON(Ag.id_pressing=Pr.id)
            JOIN QUARTIER Qu
            ON(Ag.id_quartier=Qu.id)
            WHERE (Pr.Nom=Nom_Pressing)
            AND 
            (Qu.nom=Lieu);
        Valeur VARCHAR2 (255);
        BEGIN
            OPEN Curs;
            FETCH Curs
            INTO Valeur;
                IF Curs%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('agence existe pas');
                ELSE
                    
                    DELETE FROM PROMOTION
                    WHERE id_agence_Linge=Valeur;

                    DELETE FROM OFFRE
                    WHERE id_agence_Linge=Valeur;

                    DELETE FROM LINGE_AGENCE
                    WHERE id_agence=Valeur;

                    DELETE FROM SERVICE_AGENCE
                    WHERE id_agence=Valeur;
                    
                    DELETE FROM COMMANDE
                    WHERE id_agence=Valeur;
                    
                    DELETE FROM MESSAGE
                    WHERE id_agence=Valeur;
                    
                    DELETE FROM AGENT
                    WHERE id_agence=Valeur;
                    
                    DELETE FROM Agence
                    WHERE id=Valeur;
                   
                    DBMS_OUTPUT.PUT_LINE('agence supprimée');
                    DBMS_OUTPUT.PUT_LINE('les differences agences du pressing sont: ');
                    SELECT Qu.nom,Pr.nom
                    FROM QUARTIER Qu
                    JOIN AGENCE ag
                    ON (ag.id_quartier=Qu.id)
                    JOIN PRESSING Pr
                    ON(Pr.id=ag.id_pressing)
                    WHERE Pr.nom='&&Nom_Pressing';
                    
                END IF;
            CLOSE Curs;
            RETURN Valeur;
    RETURN (Cur);
    END VERIFY;
END PACK_AGENCES;
/
DECLARE 
    Resultat VARCHAR2 (255) :=VERIFY('&Nom_Pressing','&Lieu');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/