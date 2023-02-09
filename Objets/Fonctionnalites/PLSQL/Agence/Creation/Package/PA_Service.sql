SET serveroutput on;
CREATE OR REPLACE PACKAGE AJOUT_SERVICE AS
    FUNCTION AJOUT_service(NOMCATSERVICE Categorie_Service.nom%TYPE, NOMTYPSERVICE Type_Service.Intitule%TYPE)
    RETURN VARCHAR2;
END AJOUT_SERVICE;
/
CREATE OR REPLACE PACKAGE BODY AJOUT_SERVICE AS
    FUNCTION AJOUT_service (NOMCATSERVICE Categorie_Service.nom%TYPE, NOMTYPSERVICE Type_Service.Intitule%TYPE)
   RETURN VARCHAR2 IS
    retour VARCHAR2(255);
	CURSOR turn IS
        SELECT cs.id, ts.id
        FROM Service s JOIN Type_Service ts
        ON s.id_type=ts.id
        JOIN Categorie_Service cs
        ON s.id_categorie=cs.id
        WHERE (Intitule=NOMTYPSERVICE
        AND nom=NOMCATSERVICE);
	 DONNEES1 VARCHAR2 (255);
     DONNEES2 VARCHAR2 (255)
   BEGIN
        OPEN turn;
        FETCH turn
        INTO DONNEES;
            IF turn%NOTFOUND THEN
                DBMS_OUTPUT.PUT_LINE('Le nom de le type et la categorie service n''existe pas');           
            END IF;
        CLOSE turn;
        RETURN DONNEES;
   RETURN (retour);
END AJOUT_Service;
END AJOUT_SERVICE;
/
DECLARE 
    DONNEES1 VARCHAR2 (255) :=AJOUT_TYPE_SERVICE.AJOUT_TypService('&NOMTYPSERVICE');
    DONNEES2 VARCHAR2 (255) :=AJOUT_TYPE_SERVICE.AJOUT_TypService('&NOMCATSERVICE');
BEGIN
    DBMS_OUTPUT.PUT_LINE(DONNEES1);
    DBMS_OUTPUT.PUT_LINE(DONNEES2);
END;
/