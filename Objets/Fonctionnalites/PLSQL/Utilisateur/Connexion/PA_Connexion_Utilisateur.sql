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
      mot_de_passe UTILISATEUR.Mot_de_passe%TYPE
    ) RETURN VARCHAR2 
    IS
    CURSOR CUR IS
       SELECT id
       FROM UTILISATEUR ut
       WHERE ut.Nom_utilisateur=Verif_utilisateur.nom_utilisateur 
       AND ut.Mot_de_passe=Verif_utilisateur.mot_de_passe;
       IDENTIFIANT  varchar2(255);
    BEGIN
       OPEN CUR;
       FETCH CUR INTO IDENTIFIANT;
       IF CUR%NOTFOUND THEN
          DBMS_OUTPUT.PUT_LINE('Nom d''utilisateur ou mot de passe incorrect');
       ELSE
             DBMS_OUTPUT.PUT_LINE(' vous êtes connecté');
           END IF;
        CLOSE CUR   ;
        RETURN IDENTIFIANT;
    END Verif_utilisateur;
    END PA_CONNEXION_UTILISATEUR;
    /
DECLARE 
    IdActif VARCHAR2 (255) :=PA_CONNEXION_UTILISATEUR.Verif_utilisateur('&nomUtilisateur','&motPasse');
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
END;
/







