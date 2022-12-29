ALTER TABLE DETAILS_BESOIN
ADD CONSTRAINT vdd_detail_besoin
  CHECK(
        Quantite>0 AND
        Prix_unitaire>0
       );