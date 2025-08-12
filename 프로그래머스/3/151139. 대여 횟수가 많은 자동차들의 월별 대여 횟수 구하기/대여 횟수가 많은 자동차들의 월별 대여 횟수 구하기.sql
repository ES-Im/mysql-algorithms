# 조건 : 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차
# 출력 : 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력

with cte as (
    select car_id 
      from CAR_RENTAL_COMPANY_RENTAL_HISTORY
     where (start_date between '2022-08-01' and '2022-10-31')
     group by car_id having count(*) >= 5
)


select MONTH(start_date) as MONTH
     , c.car_id
     , count(car_id) as records
  from CAR_RENTAL_COMPANY_RENTAL_HISTORY c
 where car_id in (select * from cte) and (start_date between '2022-08-01' and '2022-10-31')
 group by MONTH, c.car_id
 order by 1, 2 DESC;