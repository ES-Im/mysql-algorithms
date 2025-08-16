-- FOOD_PRODUCT(PRODUCT_ID) | FOOD_ORDER(ORDER_ID, PRODUCT_ID)
-- 생산일자가 2022년 5월인 식품들의 식품 ID(2.ASC), 식품 이름, 총매출(1. DESC)

with cte as (
    select PRODUCT_ID, sum(amount) amt
      from FOOD_ORDER
     where PRODUCE_DATE between '2022-05-01' and '2022-05-31'
     group by PRODUCT_ID
)

select f.product_id, product_name, price * amt as total_sales
  from food_product f
  join cte using (product_id)
 order by 3 desc, 1 asc;

