
/*SET serveroutput on;
CREATE PACKAGE PACK_AGENCES_CREATION as
    FUNCTION CREATION_AGENCE (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    RETURN VARCHAR2;
END PACK_AGENCES_CREATION;
CREATE PACKAGE BODY PACK_AGENCES_CREATION AS 
    FUNCTION CREATION_AGENCE (Nom_Pressing Pressing.Nom%TYPE, Lieu QUARTIER.nom%TYPE)
    VALEUR_pays VARCHAR2
    Valeur_ville VARCHAR2
    Valeur_quartier VARCHAR2
    type t_rec is record
    RETURN VARCHAR2 IS
        Cree VARCHAR2(255);
            SELECT Pres.id
            FROM PRESSING Pres
            WHERE (Pres.Nom=Nom_Pressing)
    BEGIN        
            SELECT nom_Pays
            FROM Pays;

            SELECT id_pays
            INTO Valeur_pays
            FROM Pays
            WHERE (nom_pays = '&nom_pays');

            SELECT nom_ville
            FROM VILLE;
            JOIN Pays
            ON (Vi.id_pays= Pa.id)
            WHERE (Pa.id = Valeur_pays);

            SELECT id_ville
            INTO Valeur_ville
            FROM VILLE
            WHERE (nom_ville = '&nom_ville');

            SELECT nom_quartier
            FROM QUARTIER;
            JOIN VILLE
            ON (Qu.id_ville = Vi.id)
            WHERE(Vi.id = Valeur_ville);

            SELECT id_quartier
            INTO Valeur_quartier
            FROM QUARTIER
            WHERE (nom_quartier = '&nom_quartier');

            SELECT Pa.Nom
            FROM Pays.Pa 
            JOIN VILLE Vi 
            ON (Pa.id = Vi.id)
            JOIN QUARTIER Qu 
            ON (Vi.id = Qu.id_ville)
            JOIN Agence Ag 
            ON (Qu.id = Ag.id.QUARTIER)
            JOIN PRESSING Pres
            ON (Ag.id = Pres.id.Agence)
            WHERE Pres.id = Cree;
    END

        Valeur_agence VARCHAR2 (255);
        BEGIN
            OPEN Creer;
            FETCH Creer
            INTO Valeur_agence;
                IF Creer%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('agence existe pas');
                ELSE
                    INSERT INTO Agence (id_pressing, id_Quartier) 
                    VALUES(v_id_pressing, v_id_Quartier);               
                END IF;
            CLOSE Creer;
            RETURN Valeur_agence;
    RETURN (Cree);
    END CREATION_AGENCE;
END PACK_AGENCES_CREATION;
/
DECLARE 
    Resultat VARCHAR2 (255) :=CREATION_AGENCE('&Nom_Pressing');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/
*/

SET SERVEROUTPUT ON;
CREATE PACKAGE PACK_AGENCES_CREATION as
    PROCEDURE AFFICHE_VILLE (Nom_Pays Pays.Nom%TYPE)
RETURN VARCHAR2;
    PROCEDURE AFFICHE_QUARTIER (Nom_ville Ville.Nom%TYPE)
RETURN VARCHAR2;
    PROCEDURE AFFICHE_PRESSING (nom_proprietaire Proprietaire.nom%TYPE)
RETURN VARCHAR2;
END PACK_AGENCES_CREATION;
CREATE OR REPLACE PACKAGE PACK_AGENCES_CREATION AS
    PROCEDURE AFFICHE_VILLE(Nom PAYS.Nom%TYPE) IS
    VALEUR_pays VARCHAR2(255);
        BEGIN
            SELECT id_pays, Nom
            INTO Valeur_pays
            FROM Pays
            WHERE Nom = Nom
                        ((SELECT Nom
                        FROM VILLE
                        JOIN Pays
                        ON (Vi.Nom= Pa.Nom)
                        WHERE (Pa.Nom = Valeur_pays)));
        END;
/
CREATE OR REPLACE PACKAGE PACK_AGENCES_CREATION AS
    PROCEDURE AFFICHE_QUARTIER(nom_ville Ville.nom%TYPE) IS
    Valeur_ville VARCHAR2(255);
        BEGIN
             SELECT id_ville, nom_quartier
            INTO Valeur_ville
            FROM VILLE
            WHERE nom_ville = nom_ville
                                ((SELECT nom_quartier,
                                FROM QUARTIER
                                JOIN VILLE
                                ON (Qu.nom_ville = Vi.nom)
                                WHERE(Vi.no = Valeur_ville)));            
        END;
        /
CREATE OR REPLACE PACKAGE PACK_AGENCES_CREATION AS
    PROCEDURE AFFICHE_PRESSING(nom_proprietaire Proprietaire.nom%TYPE) IS
    Valeur_proprietaire varchar2
        BEGIN
             SELECT id_proprietaire, nom_pressing
            INTO Valeur_proprietaire
            FROM Proprietaire
            WHERE nom_proprietaire = nom_proprietaire;
                                ((SELECT nom_pressing
                                FROM PRESSING;
                                JOIN Proprietaire
                                ON (Pres.nom_proprietaire = Pro.nom)
                                WHERE(Pro.nom = Valeur_proprietaire)));         
        END;
/



















SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE PACK_AGENCES_CREATION as
    PROCEDURE AFFICHE_VILLE (Nom_Pays Pays.Nom%TYPE);
    /*PROCEDURE AFFICHE_QUARTIER (Nom_ville Ville.Nom%TYPE);*/
END PACK_AGENCES_CREATION;
/
CREATE OR REPLACE PACKAGE BODY PACK_AGENCES_CREATION AS
    PROCEDURE AFFICHE_VILLE (Nom_Pays Pays.Nom%TYPE) IS
    Compt PLS_INTEGER:=1;
        CURSOR Curs IS
            SELECT id
            /*INTO Valeur_pays*/
            FROM Pays
            WHERE nom = nom_pays;    
        Valeur VARCHAR2 (255);
        BEGIN
        OPEN Curs;
            FETCH Curs
                INTO Valeur;
                    IF Curs%NOTFOUND THEN
                         DBMS_OUTPUT.PUT_LINE('existe pas');
                    ELSE
                        DBMS_OUTPUT.PUT_LINE('les differences villes du pays selectionnes sont: ');
                        FOR une_ville IN(
                            SELECT Vi.nom "Nom"
                            FROM Ville Vi
                            JOIN Pays Pa
                            on(Vi.id_pays=Pa.id)
                            WHERE Vi.nom=AFFICHE_VILLE.Nom_Pays
                            )
                            LOOP
                            DBMS_OUTPUT.PUT_LINE(Compt||'- le nom de la ville est:'||une_ville."Nom");
                            Compt :=Compt+1; 
                        END LOOP;
                    END IF;
        CLOSE Curs;
    END AFFICHE_VILLE;
END PACK_AGENCES_CREATION;
/
