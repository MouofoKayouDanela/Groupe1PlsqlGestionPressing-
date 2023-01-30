CREATE OR REPLACE PROCEDURE Add_proprietaire 
IS 
BEGIN
    EXECUTE Add_user 
    (
        UTILISATEUR.id%TYPE,
        UTILISATEUR.nom%TYPE,
        UTILISATEUR.Prenom%TYPE,
        UTILISATEUR.Genre%TYPE,
        UTILISATEUR.Date_naissance%TYPE,
        UTILISATEUR.Email%TYPE,
        UTILISATEUR.Telephone%TYPE,
        UTILISATEUR.Nom_utilisateur%TYPE,
        UTILISATEUR.Mot_de_passe%TYPE,
        UTILISATEUR.Statut%TYPE
    )  
    INSERT INTO PROPRIETAIRE
                        (id, date_enregistrement)
    VALUES 
          ('PR'||seq_utilisateur.CURRVAL, SYSDATE)
END;          
