-- REST_INFO (rest_id)
-- REST_REVIEW (review_id) - rest_id / REVIEW_SCORE
-- where 서울에 위치한 식당
-- select 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, floor(average(REVIEW_SCORE), 2) 
-- 리뷰 점수 desc, 즐겨찾기(FAVORITES) 수 desc

with tmp as (
    SELECT i.rest_id
         , ADDRESS
         , round(avg(r.REVIEW_SCORE), 2) score
      FROM REST_INFO i
      JOIN REST_REVIEW r using (rest_id)
     group by rest_id having ADDRESS like '서울%'
)

select REST_ID, REST_NAME, FOOD_TYPE
     , FAVORITES, t.ADDRESS, SCORE
  from rest_info i
  join tmp t using(rest_id)
 order by 6 desc, 4 desc;