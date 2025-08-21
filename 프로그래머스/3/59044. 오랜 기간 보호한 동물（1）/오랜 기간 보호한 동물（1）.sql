-- ANIMAL_INS(ANIMAL_ID) ANIMAL_OUTS(ANIMAL_ID, FK)
-- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회

SELECT name, datetime
  FROM animal_ins
 where animal_id not in (
    select animal_id 
      from animal_outs
 )
 order by datetime asc
 limit 3;