set serveroutput on 
create or replace PROCEDURE supAgencePressing IS
TYPE NOM_PAYS IS TABLE OF PAYS.nom%TYPE 
INDEX BY PLS_INTEGER ;
pays_selectionne NOM_PAYS;
TYPE NOM_VILLE IS TABLE OF VILLE.nom%TYPE 
INDEX BY PLS_INTEGER ;
ville_selectionnee NOM_VILLE;      
TYPE NOM_QUARTIER IS TABLE OF QUARTIER.nom%TYPE 
INDEX BY PLS_INTEGER ;
quartier_selectionnee NOM_QUARTIER;   
nbpays number;
choix number;
pays_choisi varchar2(50);
begin
DBMS_OUTPUT.PUT_LINE('Supprimer lagence d un pressing');
DBMS_OUTPUT.PUT_LINE('Entrer le chiffre correspondant au pays ou se trouve l agence a supprimer');
SELECT count(*) INTO nbpays from PAYS;
FOR i IN 1..nbpays
LOOP
SELECT nom INTO pays_selectionne(i) FROM PAYS;
DBMS_OUTPUT.PUT_LINE(i ||'-'|| pays_selectionne(i));
END LOOP;
choix := '&choix';
for i in 1.. nbpays
LOOP
IF choix=i
then 
pays_choisi:=pays_selectionne(i);
end if;
END LOOP;
FOR i IN 1..10
LOOP
select nom into ville_selectionnee(i) from VILLE where id_pays=(select id from PAYS where nom=pays_choisi);
DBMS_OUTPUT.PUT_LINE(i ||'-'|| ville_selectionnee(i));
END LOOP;
END;
/

