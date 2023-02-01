SET serveroutput on;
CREATE OR REPLACE PACKAGE PACK_SUPPRESSION_AGENCES as
    PROCEDURE SUPPRESSION_AGENCE(Nom_Pressing Pressing.Nom%TYPE,Lieu QUARTIER.nom%TYPE);
END PACK_SUPPRESSION_AGENCES;
/
CREATE OR REPLACE PACKAGE BODY PACK_SUPPRESSION_AGENCES AS 
    PROCEDURE SUPPRESSION_AGENCE(Nom_Pressing Pressing.Nom%TYPE,Lieu QUARTIER.nom%TYPE)
    IS
     Compt PLS_INTEGER:=1;
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
                    UPDATE PROMOTION
                    SET statut ='supprime'
                    WHERE id_agence_Linge=Valeur;

                    UPDATE OFFRE
                    SET statut ='supprime'
                    WHERE id_agence_Linge=Valeur;

                    UPDATE SERVICE_AGENCE 
                    SET Date_retrait=Current_date
                    WHERE id_agence=Valeur;

                    UPDATE LINGE_AGENCE 
                    SET Date_retrait=Current_date
                    WHERE id_agence=Valeur;  

                    UPDATE COMMANDE
                    SET statut ='supprime'
                    WHERE id_agence=Valeur;

                    UPDATE MESSAGE
                    SET statut='supprime'
                    WHERE id_agence=Valeur; 

                 
                    UPDATE AGENCE
                    SET statut='supprime'
                    WHERE id=valeur;                   
                                    
                    DBMS_OUTPUT.PUT_LINE('agence supprimée');
                    DBMS_OUTPUT.PUT_LINE('les differences agences du pressing sont: ');
                    FOR une_agence IN (
                        SELECT Qu.nom "Nom",
                        Pr.nom "Nom_pressing"
                        FROM QUARTIER Qu
                        JOIN AGENCE ag
                        ON (ag.id_quartier=Qu.id)
                        JOIN PRESSING Pr
                        ON(Pr.id=ag.id_pressing)
                        WHERE Pr.nom=SUPPRESSION_AGENCE.Nom_Pressing 
                        AND ag.statut IS NULL 
                    )
                    LOOP    
                    DBMS_OUTPUT.PUT_LINE(Compt ||'-'||une_agence."Nom");
                    Compt :=Compt+1; 
                    END LOOP;  
             END IF;
            CLOSE Curs;
    END SUPPRESSION_AGENCE ;
END PACK_SUPPRESSION_AGENCES;
/
DECLARE 
    Resultat VARCHAR2 (255) :=PACK_SUPPRESSION_AGENCES.SUPPRESSION_AGENCE('&Nom_Pressing','&Lieu');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

    UPDATE UTILISATEUR
                    SET Statut='supprime'
                    WHERE id=(
                        SELECT id
                        FROM AGENT
                        WHERE id_agence=Valeur
                    );
            
                    