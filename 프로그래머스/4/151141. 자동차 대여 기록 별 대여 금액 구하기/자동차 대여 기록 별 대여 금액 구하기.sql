# CAR_RENTAL_COMPANY_CAR (CAR_ID, CAR_TYPE)
# CAR_RENTAL_COMPANY_RENTAL_HISTORY (CAR_ID) 
# CAR_RENTAL_COMPANY_DISCOUNT_PLAN (CAR_TYPE)
# (CAR_TYPE = '트럭') 대여금액(FEE) DESC, HISTORY_ID DESC

# [트럭인 CAR_ID의 history_id, 몇일 렌트] 컬럼 CTE
with rent_date as (
    select history_id
         , car_id
         , DATEDIFF(end_date, start_date) + 1 as rentDate
         , (case when DATEDIFF(end_date, start_date) + 1 >= 90 then '90일 이상'
                when DATEDIFF(end_date, start_date) + 1 >= 30 then '30일 이상'
                when DATEDIFF(end_date, start_date) + 1 >= 7 then '7일 이상'
                else '할인 없음' end) as DURATION_TYPE
      from CAR_RENTAL_COMPANY_RENTAL_HISTORY
     where car_id in (select car_id 
                        from CAR_RENTAL_COMPANY_CAR
                       where car_type = '트럭') 
), discount as (
    select history_id
         , car_id
         , rentDate
         , if(rent_date.DURATION_TYPE != '할인 없음'
                , (1 - plan.discount_rate / 100)
                , 1) as discount
      from rent_date
      left outer join (select DURATION_TYPE, DISCOUNT_RATE 
                         from CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
                        where CAR_TYPE = '트럭') as plan 
        on rent_date.DURATION_TYPE = plan.DURATION_TYPE
     
)


select history_id
     , floor(daily_fee * rentDate * discount) as FEE
 from discount
 join CAR_RENTAL_COMPANY_CAR car using (car_id)
order by 2 desc, 1 desc;


# select history.history_id HISTORY_ID
#      , Floor(car.daily_fee * rent_date.rentDate * (1-DISCOUNT_RATE/100)) as FEE
#   from CAR_RENTAL_COMPANY_RENTAL_HISTORY as history
#   join rent_date using (history_id)
#   join CAR_RENTAL_COMPANY_CAR as car on history.car_id = car.car_id
#   join CAR_RENTAL_COMPANY_DISCOUNT_PLAN as discount using (DURATION_TYPE)
#  where discount.car_type = '트럭'
#  order by FEE desc, HISTORY_ID desc;