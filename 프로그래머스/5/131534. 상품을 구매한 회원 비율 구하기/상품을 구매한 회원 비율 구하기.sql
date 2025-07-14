-- 년, 월, 상품을 구매한 회원수, 상품을 구매한 회원의 비율

-- 2021년에 가입한 회원의 수 = 158
with cte as (
    select count(*) as cnt from USER_INFO where year(joined) = 2021
)

select YEAR(SALES_DATE) as YEAR
     , MONTH(SALES_DATE) as MONTH
     , count(distinct user_id) as PURCHASED_USERS
     , round(count(distinct user_id) / cnt, 1) as PURCHASED_RATIO
  from online_sale, cte
 where USER_ID in (select user_id from user_info where year(joined) = 2021)
 group by YEAR, MONTH
 order by 1, 2;
  