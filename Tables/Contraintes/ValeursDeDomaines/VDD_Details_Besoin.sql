ALTER TABLE DETAILS_BESOIN
ADD CONSTRAINT vdd_detail_besoin
  CHECK(
        Quantite>0 AND
        Prix unitaire>0
       );