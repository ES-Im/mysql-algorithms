-- FIRST_HALF (SHIPMENT_ID) , TOTAL_ORDER(상반기 총주문량)
-- JULY (SHIPMENT_ID, FK) - 출하번호가 일치 하지 않음

SELECT f.flavor
  FROM FIRST_HALF f 
  JOIN JULY j using (flavor) 
 group by flavor 
 order by (sum(f.total_order) + sum(j.total_order)) desc
 limit 3;