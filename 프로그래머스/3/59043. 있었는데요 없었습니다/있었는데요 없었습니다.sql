-- ANIMAL_INS (animal_id)
-- ANIMAL_OUTS (animal_id, FK) - DATETIME 실수, 보호시작일보다 입양일이 더 빠른 동물 조회 datetime asc
-- datediff 함수는 일까지만 비교하므로 컬럼 직접 비교 (<, >)

SELECT i.animal_id, i.name
  from animal_ins i
  join animal_outs o using (animal_id)
  where i.datetime >  o.datetime
  order by i.datetime asc;
  