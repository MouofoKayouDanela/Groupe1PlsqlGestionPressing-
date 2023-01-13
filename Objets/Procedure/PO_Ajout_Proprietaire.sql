SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Ajout_proprietaire IS 
V_ID_PROP PROPRIETAIRE.id%TYPE;
V_Sysdate_PROP PROPRIETAIRE.date_enregistrement%TYPE;
BEGIN
        V_ID_PROP := 'UT0';

INSERT ALL
INTO UTILISATEUR (id,Nom,Prenom,Genre,Date_naissance,Email,Telephone,Nom_utilisateur,Mot_de_passe)
        VALUES (
            V_ID_PROP ||seq_utilisateur.nexval,
            DBMS_OUTPUT.PUT_LINE('Entrez votre Nom :' &Nom),
            DBMS_OUTPUT.PUT_LINE('Entrez votre Prenom :' &Prenom),
            DBMS_OUTPUT.PUT_LINE('Entrez votre genre/sexe :' &Genre),
            DBMS_OUTPUT.PUT_LINE('Entrez votre date de naissance :' &Date_naissance),
            DBMS_OUTPUT.PUT_LINE('Entrez votre adresse mail :' &Email),
            DBMS_OUTPUT.PUT_LINE('Entrez votre contact telephonique :' &Telephone),
            DBMS_OUTPUT.PUT_LINE('Entrez votre nom d utilisateur :' &Nom_utilisateur),
            DBMS_OUTPUT.PUT_LINE('Entrez votre mot de passe :' &Mot_de_passe)
        ); 
END;
BEGIN   
        V_Sysdate_PROP := SYSDATE; 
        Ajout_proprietaire;     
INTO PROPRIETAIRE (id,date_enregistrement)     
        VALUES(
           V_ID_PROP||seq_utilisateur.nexval,
           V_Sysdate_PROP 
        );    
END;
/                  
SELECT * FROM UTILISATEUR U JOIN PROPRIETAIRE P ON (U.id=P.id);

