# CAR_RENTAL_COMPANY_CAR(차 정보, CAR_ID & CAR_TYPE) & CAR_RENTAL_COMPANY_RENTAL_HISTORY(대여정보, CAR_ID)
# CAR_RENTAL_COMPANY_DISCOUNT_PLAN(할인 정책, CAR_TYPE)
# (1) CAR_TYPE = '세단' or 'SUV'
# (2) 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능
# (3) 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차
# CAR_ID, CAR_TYPE, 대여 금액(컬럼명: FEE) 리스트 // CAR_TYPE ASC CAR_ID DESC

# -- 11월 대여 불가능 차량 필터링
WITH AVAILABLE_CARS AS (
    SELECT car_id
      FROM CAR_RENTAL_COMPANY_CAR
     WHERE car_id NOT IN (
         SELECT car_id
           FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
          WHERE end_date >= "2022-11-01" AND start_date <= "2022-11-30"
     )
),
FEE_TABLE as (
    SELECT a.car_id CAR_ID
         , t1.car_type CAR_TYPE
         , Floor(DAILY_FEE * (1-DISCOUNT_RATE/100) * 30) as FEE
      FROM AVAILABLE_CARS a
      JOIN CAR_RENTAL_COMPANY_CAR t1 on a.car_id = t1.car_id
      JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN t2 on t1.car_type = t2.car_type
     WHERE DURATION_TYPE = '30일 이상'
)


select * from FEE_TABLE
 where car_type in ('SUV', '세단') 
   and FEE  between 500000 and 1999999
 order by fee desc, CAR_TYPE asc, car_id desc;