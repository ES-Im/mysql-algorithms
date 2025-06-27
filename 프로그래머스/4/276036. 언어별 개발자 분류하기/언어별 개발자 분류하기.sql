# A : 프론트 앤드 스킬, 파이선 // B : C# // C : 그 외 로 구분하여 grade, id, email 조회
# 1. skillcodes.skill_code 와 develope.code를 2진수 변환 
# 2. skill_code & code = code 이용 → groupconcat 및 '%x%'로 해당 스킬이 있는지 확인 → 
# 3.  조건식을 달아 A, B, C로 구분(case when then 이용) 

with Recursive 
check_skill as (
    select id
         , (skill_code - code) as minus
         , name
         , category
      from developers d
      join skillcodes s on (skill_code & code = code)
),
group_skill as (
    select id
         , group_concat(name) name
         , group_concat(category) category
      from check_skill 
     group by id
)

select * 
  from (select (case when name like '%Python%' and category like '%Front End%' then 'A'
             when name like '%C#%' then 'B'
             when category like '%Front End%' then 'C' end) as GRADE
     , g.ID
     , EMAIL
  from group_skill g
  join developers d on g.id = d.id
 order by 1, 2) tmp
 where grade is not null;