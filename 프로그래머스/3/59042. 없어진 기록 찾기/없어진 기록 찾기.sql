-- ANIMAL_INS (들어온 동물), ANIMAL_OUTS(입양간 동물)
-- 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.

SELECT o.ANIMAL_ID, o.NAME
  from animal_outs o
  left outer join animal_ins i on o.ANIMAL_ID = i.ANIMAL_ID
  where i.animal_id is null;