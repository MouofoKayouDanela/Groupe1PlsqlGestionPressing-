SET DEFINE ON

DECLARE

v_id int(10) := '&id';
v_id_pressing int(10) := '&id_pressing';
v_id_Quartier int(10) := '&id_quartier';

BEGIN
INSERT INTO Agence (id, id_pressing, id_Quartier) VALUES(v_id, v_id_pressing, v_id_Quartier);
end;
/