ACCEPT nom_utili CHAR PROMPT 'Veuillez entrer le nom de l''agent dont vous voulez consulter le profil : '
EXECUTE PA_CONSULTATION_AGENT.PO_PROFIL_AGENT('&nom_utili', '&nom_quartier_agence')