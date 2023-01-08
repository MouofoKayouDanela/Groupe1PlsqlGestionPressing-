PROMPT Supprimmer un pressing
SET DEFINE ON 
DECLARE 
v_nom   varchar(50)  := '&Nom_lie_au_pressing';

begin
DELETE FROM Pressing
WHERE id = UPPER(SUBSTR(v_nom))
AND (nom = v_nom)
AND (id_proprietaire = (select id_proprietaire from Utilisateur where email = v_mail));
end;
/