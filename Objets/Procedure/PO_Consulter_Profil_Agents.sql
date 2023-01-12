SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE PO_CONSULTER_PROFILS_AGENTS(id_agent AGENT.id%TYPE)
    AS
        CURSOR les_agents IS SELECT  ut.nom "nom",
                                    ut.prenom "prenom",
                                    ut.genre "genre",
                                    ut.date_naissance "date_naissance",
                                    ut.email "email",
                                    ut.telephone "telephone",
                                    ut.nom_utilisateur "nom_utilisateur",
                                    ro.nom "role",
                                    ro.description "description_role"
                            FROM    UTILISATEUR ut
                            JOIN    AGENT at
                            ON      (ut.id = at.id)
                            JOIN    ROLE ro
                            ON      (at.id_role = ro.id)
                            WHERE   at.id = id_agent
        ;
    BEGIN
        FOR un_agent IN les_agents LOOP
            DBMS_OUTPUT.PUT_LINE('Nom                   : '||un_agent."nom");
            DBMS_OUTPUT.PUT_LINE('Prenom                : '||un_agent."prenom");
            DBMS_OUTPUT.PUT_LINE('Genre                 : '||un_agent."genre");
            DBMS_OUTPUT.PUT_LINE('Date de naissance     : '||un_agent."date_naissance");
            DBMS_OUTPUT.PUT_LINE('Adresse electronique  : '||un_agent."email");
            DBMS_OUTPUT.PUT_LINE('Adresse telephonique  : '||un_agent."telephone");
            DBMS_OUTPUT.PUT_LINE('Nom utilisateur       : '||un_agent."nom_utilisateur");
            DBMS_OUTPUT.PUT_LINE('Role                  : '||un_agent."role");
            DBMS_OUTPUT.PUT_LINE('Description du role   : '||un_agent."description_role");
        END LOOP;
    END;
/