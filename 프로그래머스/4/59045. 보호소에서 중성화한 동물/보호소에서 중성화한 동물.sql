-- ANIMAL_INS(ANIMAL_ID) ANIMAL_OUTS (animal_id, FK)
-- 보호소에 들어올 당시에는 중성화되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물
-- 성별 및 중성화 여부 : 중성화o (Spayed / Neutered) || 중성화x (Intact)

SELECT o.animal_id, o.animal_type, o.name
  from animal_outs o
  join animal_ins i using (animal_id)
 where sex_upon_intake like "%Intact%"
   and (sex_upon_outcome like "%spayed%" 
    or sex_upon_outcome like "%Neutered%");