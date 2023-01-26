CREATE OR REPLACE PACKAGE PA_UTILISATEUR AS --Entete du package de creation d'un utilisateur quelconque
    PROCEDURE Add_user           --Appel de la procedure associee
    (
        ID_USER UTILISATEUR.id%TYPE,
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
    FUNCTION Verify_mail         --Appel de la fonction associee de verification de l'email
        (mail UTILISATEUR.Email%TYPE) RETURN VARCHAR2;
END PA_UTILISATEUR;
/  
CREATE OR REPLACE PACKAGE BODY PA_UTILISATEUR AS     --corps du package
    PROCEDURE Add_user
    (
        ID_USER UTILISATEUR.id%TYPE,
        NOM_USER UTILISATEUR.nom%TYPE,
        PRENOM_USER UTILISATEUR.Prenom%TYPE,
        GENRE_USER UTILISATEUR.Genre%TYPE,
        DateNais_USER UTILISATEUR.Date_naissance%TYPE,
        MAIL_USER UTILISATEUR.Email%TYPE,
        PHONE_USER UTILISATEUR.Telephone%TYPE,
        USERNAME UTILISATEUR.Nom_utilisateur%TYPE,
        PASSWORDS UTILISATEUR.Mot_de_passe%TYPE,
        STATUT_USER UTILISATEUR.Statut%TYPE
    )       
    IS 
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
    (mail UTILISATEUR.Email%TYPE) 
    RETURN VARCHAR2 
    IS
        CURSOR Cur IS     --curseur qui parcourt la table utilisateur sur la colonne de l'email
            SELECT Email
            FROM UTILISATEUR
            WHERE (Email=mail);
        Valeur VARCHAR2 (255);
        BEGIN
            OPEN Cur;
            FETCH Cur
            INTO Valeur;
                IF Cur%NOTFOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Utilisateur valide');
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Desole cet utilisateur existe deja, verifiez votre Email');
                END IF;
            CLOSE Cur;
        RETURN Valeur;
    END Verify_mail;      
END PA_UTILISATEUR;
/ 
DECLARE   --main ou partie de declaration du package
Resultat VARCHAR2(255) := PA_UTILISATEUR.Verify_mail('Valeur');
BEGIN
    PA_UTILISATEUR.Add_user    --declaration de la procedure avec les variables de substitution
    (
        'UT ||seq_utilisateur.NEXTVAL',
        '&Votre_nom',
        '&Votre_prenom',
        '&Votre_genre',
        '&Date_naissance',
        '&Email_utilisateur',
        TO_NUMBER('&Votre_Telephone'),
        '&Nom_utilisateur',
        '&Mot_de_passe',
        'Actif'
    );
END;
/