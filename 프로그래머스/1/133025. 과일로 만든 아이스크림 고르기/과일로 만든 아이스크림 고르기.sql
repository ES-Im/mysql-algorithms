-- FIRST_HALF (SHIPMENT_ID)
-- ICECREAM_INFO (FLAVOR)

SELECT t.flavor
  FROM FIRST_HALF t
  JOIN ICECREAM_INFO using (FLAVOR)
 WHERE INGREDIENT_TYPE = 'fruit_based' and total_order > 3000
 order by total_order desc


 