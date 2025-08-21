-- PRODUCT(PRODUCT_ID) OFFLINE_SALE(OFFLINE_SALE_ID, PRODUCT_ID)
-- 상품코드 별 매출액(판매가 * 판매량) 합계

SELECT product_code
     , (sum(sales_amount) * price) SALES
  FROM product
  JOIN offline_sale using (product_id)
 group by product_id
 order by 2 desc, 1;