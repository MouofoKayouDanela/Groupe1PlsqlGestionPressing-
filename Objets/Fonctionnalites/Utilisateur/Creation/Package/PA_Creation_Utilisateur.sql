CREATE OR REPLACE PACKAGE PA_UTILISATEUR AS
    PROCEDURE Add_user
    (
        NOM_USER UTILISATEUR.nom%TYPE,
        PRENOM_USER UTILISATEUR.Prenom%TYPE,
        GENRE_USER UTILISATEUR.Genre%TYPE,
        DateNais_USER UTILISATEUR.Date_naissance%TYPE,
        MAIL_USER UTILISATEUR.Email%TYPE,
        PHONE_USER UTILISATEUR.Telephone%TYPE,
        USERNAME UTILISATEUR.Nom_utilisateur%TYPE,
        PASSWORDS UTILISATEUR.Mot_de_passe%TYPE,
        STATUT_USER UTILISATEUR.Statut%TYPE
        );
    FUNCTION Verify_mail
        (mail UTILISATEUR.Email%TYPE) RETURN VARCHAR2;  
    FUNCTION Cryptage
        (pasword UTILISATEUR.Mot_de_passe%TYPE) RETURN VARCHAR2;
END PA_UTILISATEUR;
/  
CREATE OR REPLACE PACKAGE BODY PA_UTILISATEUR AS 
    PROCEDURE Add_user
    (
        NOM_USER UTILISATEUR.nom%TYPE,
        PRENOM_USER UTILISATEUR.Prenom%TYPE,
        GENRE_USER UTILISATEUR.Genre%TYPE,
        DateNais_USER UTILISATEUR.Date_naissance%TYPE,
        MAIL_USER UTILISATEUR.Email%TYPE,
        PHONE_USER UTILISATEUR.Telephone%TYPE,
        USERNAME UTILISATEUR.Nom_utilisateur%TYPE,
        PASSWORDS UTILISATEUR.Mot_de_passe%TYPE,
        STATUT_USER UTILISATEUR.Statut%TYPE)       
    IS 
    ID_USER := 'UT'||seq_utilisateur.NEXTVAL;
    BEGIN
    INSERT INTO UTILISATEUR (id, 
                            nom, 
                            Prenom, 
                            Genre,
                            Date_naissance,
                            Email,
                            Telephone,
                            Nom_utilisateur,
                            Mot_de_passe,
                            Statut)
    VALUES (ID_USER, 
            NOM_USER, 
            PRENOM_USER, 
            GENRE_USER,
            DateNais_USER,
            MAIL_USER,
            PHONE_USER,
            USERNAME,
            PASSWORDS,
            STATUT_USER);
    END Add_user; 
    FUNCTION Verify_mail 
    (mail UTILISATEUR.Email%TYPE) RETURN VARCHAR2
    IS
    BEGIN
    Curseur VARCHAR2(255);
        CURSOR Curseur IS
            SELECT Email
            FROM UTILISATEUR
            WHERE (Email=mail);
        Valeur VARCHAR2 (255);
        BEGIN
            OPEN Curseur;
            FETCH Curseur
            INTO Valeur;
                IF Curseur%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Utilisateur valide');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Desole cet utilisateur existe deja, verifiez votre Email');
                END IF;
            CLOSE Curseur;
        RETURN Valeur;
    END Verify_mail;  
    FUNCTION Cryptage
        (pasword UTILISATEUR.Mot_de_passe%TYPE) RETURN VARCHAR2
    IS
    result VARCHAR2(255);
    BEGIN
    result := DBMS_OBFUSCATION_TOOLKIT.Cryptage(pasword);
    END Cryptage;      
END PA_UTILISATEUR;
/ 
DECLARE
    Rendu VARCHAR2 (255) := VERIFY('&NomPressing');
BEGIN
    PA_UTILISATEUR.Add_user("PR020",&NomDePressing,SYSDATE,"UT005");
    PA_UTILISATEUR.Verify_mail(Rendu);
    PA_UTILISATEUR.Cryptage();
END;
/        

