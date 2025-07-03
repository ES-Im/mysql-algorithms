--  2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' -- 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시
-- 대여 중이지 않은 자동차인 경우 '대여 가능'을 표시(AVAILABILITY)
-- 자동차 ID(DESC)와 AVAILABILITY 리스트를 출력

with states as (
    select car_id
         , if('2022-10-16' between start_date and end_date, '대여중', '대여 가능') as AVAILABILITY
      from CAR_RENTAL_COMPANY_RENTAL_HISTORY
)

# 대여 가능 건이 1건이라도 있을 시, '대여 가능'으로 표기
# SELECT car_id,
#        (CASE 
#            WHEN SUM(AVAILABILITY = '대여 가능') > 0  THEN '대여 가능'
#            ELSE '대여중'
#        END) AS AVAILABILITY
# FROM states
# GROUP BY car_id
# ORDER BY car_id DESC;

# 대여 중이 1건이라도 있을 시 대여 가능 여부 상관없이 '대여중'으로 표기
select car_id
     , if(sum(AVAILABILITY = '대여중') > 0, '대여중', '대여 가능') as AVAILABILITY
 from states
group by 1
order by 1 desc;
