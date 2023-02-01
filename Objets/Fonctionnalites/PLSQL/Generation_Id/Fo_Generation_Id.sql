set serveroutput    on;
CREATE OR REPLACE FUNCTION Generate_id(sequence_table INT,prefixe_initial varchar2)
  RETURN VARCHAR2 IS
    ID_FINAL UTILISATEUR.id%type;     
    BEGIN
       IF sequence_table>=1 AND sequence_table<10 THEN
          ID_FINAL:=prefixe_initial||'00'||sequence_table;
       elsif sequence_table>=10 AND sequence_table<100 THEN
         ID_FINAL:=prefixe_initial||'0'||sequence_table;
       ELSE
         ID_FINAL:=prefixe_initial||sequence_table;
       END IF;
        
RETURN ID_FINAL;
END ;  
/