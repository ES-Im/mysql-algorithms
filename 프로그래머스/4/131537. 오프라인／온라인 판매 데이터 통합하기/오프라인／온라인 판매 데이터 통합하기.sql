-- ONLINE_SALE OFFLINE_SALE - PRODUCT_ID
-- 2022년 3월 오프라인/온라인  상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력

with tmp as(
    SELECT DATE_FORMAT(sales_date, '%Y-%m-%d') as SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
      FROM online_sale
     where DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'
     UNION ALL
    SELECT DATE_FORMAT(sales_date, '%Y-%m-%d'), PRODUCT_ID, NULL, sales_amount
      FROM offline_sale
     where DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'
)

select * from tmp
 order by SALES_DATE asc, PRODUCT_ID asc, USER_ID asc