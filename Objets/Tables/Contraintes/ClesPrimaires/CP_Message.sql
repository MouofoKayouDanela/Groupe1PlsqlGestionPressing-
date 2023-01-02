ALTER TABLE MESSAGE
ADD CONSTRAINT cp_message_id 
PRIMARY KEY (id_besoin,id_agence,date_Emission);