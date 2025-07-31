-- ANIMAL_OUTS : ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME

with recursive time as (
    select 0 as HOUR
    
    union
    
    select HOUR + 1 from time
     where HOUR < 23
)

SELECT HOUR, count(animal_id) as COUNT
  FROM time
  LEFT OUTER JOIN animal_outs a
    ON HOUR(DATETIME) = HOUR
 GROUP BY HOUR
 ORDER BY HOUR;