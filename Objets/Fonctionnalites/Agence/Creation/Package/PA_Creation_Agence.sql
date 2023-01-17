SET DEFINE ON
DECLARE
v_id VARCHAR2(50) := '&id';
v_id_pressing VARCHAR2(50) := '&id_pressing';
v_id_Quartier VARCHAR2(50) := '&id_quartier';

BEGIN
INSERT INTO Agence (id, id_pressing, id_Quartier) VALUES(v_id, v_id_pressing, v_id_Quartier);
end;
/