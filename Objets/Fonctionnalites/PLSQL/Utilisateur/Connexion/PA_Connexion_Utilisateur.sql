SET serveroutput ON;
CREATE OR REPLACE  PACKAGE  PA_CONNEXION_UTILISATEUR AS
    FUNCTION Verif_utilisateur
    (
     nom_utilisateur UTILISATEUR.Nom_utilisateur%TYPE,
     mot_de_passe UTILISATEUR.Mot_de_passe%TYPE
     ) RETURN VARCHAR2;
END PA_CONNEXION_UTILISATEUR ;
/
CREATE OR REPLACE PACKAGE BODY PA_CONNEXION_UTILISATEUR AS
    FUNCTION Verif_utilisateur(
      nom_utilisateur UTILISATEUR.Nom_utilisateur%TYPE,
      mot_de_passe UTILISATEUR.Mot_de_passe%TYPEI
    ) RETURN VARCHAR2 
    IS
    -- curseur permettant de rechercher le mot de passe et le nom d'utilisateur de l'utilisateur-- 
    CURSOR CUR IS
       SELECT id
       FROM UTILISATEUR ut
       WHERE ut.Nom_utilisateur=Verif_utilisateur.nom_utilisateur 
       AND ut.Mot_de_passe=Verif_utilisateur.mot_de_passe;
       IDENTIFIANT  varchar2(255);
    BEGIN
       OPEN CUR;
       FETCH CUR INTO IDENTIFIANT;
       --ligne permettant d'authentifier l'utilisateur--
       IF CUR%NOTFOUND THEN
          DBMS_OUTPUT.PUT_LINE('Nom d''utilisateur ou mot de passe incorrect');

           END IF;
        CLOSE CUR   ;
        RETURN IDENTIFIANT;
    END Verif_utilisateur;
    END PA_CONNEXION_UTILISATEUR;
    /
DECLARE 
    validite VARCHAR2(255);
    IdActif VARCHAR2 (255) :=PA_CONNEXION_UTILISATEUR.Verif_utilisateur('&nomUtilisateur','&motPasse');
   CURSOR cus IS
   SELECT statut
   FROM UTILISATEUR
   WHERE id=IdActif;
BEGIN
   OPEN cus;
   FETCH cus INTO validite;
  --verification du statut de l'utilisateur étant authentifier--
   if validite!= 'bloque'THEN
   DBMS_OUTPUT.PUT_LINE('Vous etes connecte');
   elsif validite='bloqué' THEN
     DBMS_OUTPUT.PUT_LINE('Vous ne ouvez pas vous connecter car vous avez ete bloque');
    END IF;
    CLOSE cus; 
END;
/







