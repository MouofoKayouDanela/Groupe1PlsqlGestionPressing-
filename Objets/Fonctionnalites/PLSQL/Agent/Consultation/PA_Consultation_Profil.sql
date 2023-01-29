CREATE OR REPLACE PACKAGE PA_CONSULTATION_AGENT AS 
    PROCEDURE PO_PROFIL_AGENT(nom_u UTILISATEUR.Nom_utilisateur%TYPE, id_agence AGENCE.id%TYPE);
    PROCEDURE  PO_LISTE_AGENT(id_agence AGENCE.id%TYPE);
END PA_CONSULTATION_AGENT;
/
CREATE OR REPLACE PACKAGE BODY PA_CONSULTATION_AGENT AS
    PROCEDURE PO_PROFIL_AGENT(nom_u UTILISATEUR.Nom_utilisateur%TYPE, id_agence AGENCE.id%TYPE) IS
            CURSOR l_agent IS   SELECT  ut.Nom "nom",
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
                                WHERE   ut.Nom_utilisateur = PO_PROFIL_AGENT.nom_u
                                AND     at.id_agence = PO_PROFIL_AGENT.id_agence
            ;
            c_nom UTILISATEUR.nom%TYPE;
            c_prenom UTILISATEUR.prenom%TYPE;
            c_genre UTILISATEUR.genre%TYPE;
            c_date_nais UTILISATEUR.Date_naissance%TYPE;
            c_email UTILISATEUR.Email%TYPE;
            c_telephone UTILISATEUR.Telephone%TYPE;
            c_nom_util  UTILISATEUR.Nom_utilisateur%TYPE;
            c_date_embau AGENT.date_embauche%TYPE;
            c_role ROLE.nom%TYPE;
            c_desc ROLE.description%TYPE;
        BEGIN
            OPEN l_agent;   
            LOOP 
                FETCH l_agent INTO c_nom, c_prenom, c_genre, c_date_nais, c_email, c_telephone,
                                    c_nom_util, c_date_embau, c_role, c_desc;
                EXIT WHEN l_agent%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('Nom                   : '||c_nom);
                DBMS_OUTPUT.PUT_LINE('Prenom                : '||c_prenom);
                DBMS_OUTPUT.PUT_LINE('Genre                 : '||c_genre);
                DBMS_OUTPUT.PUT_LINE('Date de naissance     : '||c_date_nais);
                DBMS_OUTPUT.PUT_LINE('Adresse electronique  : '||c_email);
                DBMS_OUTPUT.PUT_LINE('Adresse telephonique  : '||c_telephone);
                DBMS_OUTPUT.PUT_LINE('Nom d''utilisateur    : '||c_nom_util);
                DBMS_OUTPUT.PUT_LINE('Date d''embauche      : '||c_date_embau);
                DBMS_OUTPUT.PUT_LINE('Role                  : '||c_role);
                DBMS_OUTPUT.PUT_LINE('Description           : '||c_desc);
            END LOOP;
            IF l_agent%ROWCOUNT = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Cette agence ne presente pas d''agent au nom d''utilisateur : '||
                                    PO_PROFIL_AGENT.nom_u);
            END IF;
            CLOSE l_agent;
        END;

        PROCEDURE PO_LISTE_AGENT(id_agence AGENCE.id%TYPE) IS
            compteur PLS_INTEGER := 1;
            CURSOR les_agents IS    SELECT  ut.Nom_utilisateur "nom_utilis" 
                                    FROM    UTILISATEUR ut
                                    JOIN    AGENT at
                                    ON      (ut.id = at.id)
                                    WHERE   at.id_agence = PO_LISTE_AGENT.id_agence
            ;
            nom_u UTILISATEUR.Nom_utilisateur%TYPE;
        BEGIN
            OPEN les_agents;
            LOOP
                FETCH les_agents INTO nom_u;
                EXIT WHEN les_agents%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE(compteur||' - '||nom_u);
                compteur := compteur + 1;
            END LOOP;
            IF les_agents%ROWCOUNT = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Cette agence ne presente aucun agent !');
            END IF;
            CLOSE les_agents;
        END;
END PA_CONSULTATION_AGENT;
/