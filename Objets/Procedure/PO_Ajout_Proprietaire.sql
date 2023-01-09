SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Ajout_proprietaire IS 
DECLARE
V_ID_PROP PROPRIETAIRE.id%TYPE;
V_Sysdate_PROP PROPRIETAIRE.date_enregistrement%TYPE;
BEGIN
V_ID_PROP = 'UT0';
V_Sysdate_PROP = SYSDATE;
INSERT ALL
INTO UTILISATEUR (id,Nom,Prenom,Genre,Date_naissance,Email,Telephone,Nom_utilisateur,Mot_de_passe)
        VALUES (
            V_ID_PROP ||seq.nexval,
            '&Nom',
            '&Prenom',
            '&Genre',
            '&Date_naissance',
            '&Email',
            '&Telephone',
            '&Nom_utilisateur',
            '&Mot_de_passe'
        );  
INTO PROPRIETAIRE (id,date_enregistrement)     
        VALUES(
           V_ID_PROP ||seq.nexval,
           V_Sysdate_PROP 
        );    
END;
/