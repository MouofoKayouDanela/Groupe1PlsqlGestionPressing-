SET serveroutput on;
CREATE OR REPLACE PACKAGE PA_AJOUT_AGENCES AS
    FUNCTION AJOUT_SERVICE_TYPE_LINGE(
        Nom_Pressing Pressing.Nom%TYPE,
        Lieu QUARTIER.nom%TYPE,
        date_aj SERVICE_AGENCE.date_Ajout%TYPE,
        Nom_CatService Categorie_Service.nom%TYPE,
        Nom_TYPSERVICE Type_Service.Intitule%TYPE
        )
    RETURN VARCHAR2;
END PA_AJOUT_AGENCES;
/
CREATE OR REPLACE PACKAGE BODY PA_AJOUT_AGENCES AS
    FUNCTION AJOUT_SERVICE_TYPE_LINGE(
        Nom_Pressing Pressing.Nom%TYPE,
        Lieu QUARTIER.nom%TYPE,
        date_aj SERVICE_AGENCE.date_Ajout%TYPE,
        Nom_CatService Categorie_Service.nom%TYPE,
        Nom_TYPSERVICE Type_Service.Intitule%TYPE
        )
    RETURN VARCHAR2 IS
        Compt PLS_INTEGER :=1;
        val VARCHAR2(255);
        CURSOR valeur IS
        SELECT Ag.id
        FROM AGENCE Ag
        JOIN PRESSING Pr
        ON(Ag.id_pressing=Pr.id)
        JOIN QUARTIER Qu
        ON(Ag.id_quartier=Qu.id)
        WHERE (Pr.Nom=Nom_Pressing)
        AND 
        (Qu.nom=Lieu);
	 donnees VARCHAR2 (255);
    BEGIN
        OPEN valeur;
        FETCH valeur
        INTO donnees;
            IF valeur%NOTFOUND THEN
                DBMS_OUTPUT.PUT_LINE('agence existe pas');  
            ELSE
             DBMS_OUTPUT.PUT_LINE('les differentes service agence et linges agencessont: ');
                    FOR une_agence IN (
                        SELECT CS.nom "Nom_service",
                        TS.intitule "Intitule_service"
                        FROM SERVICE_AGENCE SA
                        JOIN service S
                        ON ((SA.id_categorie=S.id_categorie)AND(SA.id_type=S.id_type))
                        JOIN Categorie_Service CS
                        ON (S.id_categorie=CS.id)
                        JOIN Type_Service TS
                        ON (S.id_type=TS.id)                
                        WHERE SA.id_agence=donnees
                    )
                    LOOP    
                    DBMS_OUTPUT.PUT_LINE(Compt ||une_agence."Intitule_service"||une_agence."Nom_service");
                    Compt :=Compt+1; 
                    END LOOP;          
            END IF;
        CLOSE valeur;
        RETURN donnees;
   RETURN (val);
   END AJOUT_SERVICE_TYPE_LINGE;
END PA_AJOUT_AGENCES;
/