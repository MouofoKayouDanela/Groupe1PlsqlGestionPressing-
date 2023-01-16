CREATE OR REPLACE PACKAGE PA_CONSULTATION_PROFIL AS
    PROCEDURE PO_PROFIL_AGENT(id_agent AGENT.id%TYPE, id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_PROFIL;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_PROFIL AS
    PROCEDURE PO_PROFIL_AGENT(id_agent AGENT.id%TYPE, id_agence AGENCE.id%TYPE) IS
        BEGIN
            FOR un_agent IN (
                                SELECT  ut.Nom "nom",
                                        ut.Prenom "prenom",
                                        ut.genre "genre",
                                        ut.Date_naissance "date_naissance",
                                        ut.Email "email",
                                        ut.Telephone "telephone",
                                        ut.Nom_utilisateur "nom_util",
                                        at.date_embauche "date_emb",
                                        ro.nom "role",
                                        ro.description "describtion"
                                FROM    AGENT at 
                                JOIN    UTILISATEUR ut 
                                ON      (at.id = ut.id)
                                JOIN    ROLE ro 
                                ON      (at.id_role = ro.id)
                                WHERE   at.id = PO_PROFIL_AGENT.id_agent
                                AND     at.id_agence = PO_PROFIL_AGENT.id_agence
                            )   
            LOOP 
                DBMS_OUTPUT.PUT_LINE('Nom                   :'||un_agent."nom");
                DBMS_OUTPUT.PUT_LINE('Prenom                :'||un_agent."prenom");
                DBMS_OUTPUT.PUT_LINE('Genre                 :'||un_agent."genre");
                DBMS_OUTPUT.PUT_LINE('Date de naissance     :'||un_agent."date_naissance");
                DBMS_OUTPUT.PUT_LINE('Adresse electronique  :'||un_agent."email");
                DBMS_OUTPUT.PUT_LINE('Adresse telephonique  :'||un_agent."telephone");
                DBMS_OUTPUT.PUT_LINE('Nom d''utilisateur    :'||un_agent."nom_util");
                DBMS_OUTPUT.PUT_LINE('Date d''embauche      :'||un_agent."date_emb");
                DBMS_OUTPUT.PUT_LINE('Role                  :'||un_agent."role");
                DBMS_OUTPUT.PUT_LINE('Description           :'||un_agent."describtion");
            END LOOP;
        END;
END PA_CONSULTATION_PROFIL;
/