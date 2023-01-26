SET serveroutput ON
CREATE OR REPLACE PROCEDURE MainProprietaire IS
choix number;
begin
dbms_output_put_line("vEUILEZ CHOISIR LE NUMERO CORRESPONDANT A L ACTION QUE VOUS SOUHAITEZ EFFECTUER");
dbms_output_put_line("1- AJOUTER UNE AGENCE A UN PRESSING");
dbms_output_put_line("2- EDITER SON PRESSING");
dbms_output_put_line("3- SUPPRIMER SON PRESSING");
dbms_output_put_line("4- CONSULTER LES PROFILS DES AGENTS APPARTENANTS A SON PRESSING ");
dbms_output_put_line("5- REPONDRE AU BESION D'UN CLIENT");
dbms_output_put_line("5- SE DECONNECTER");
&choix;
END;
/


