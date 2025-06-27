# A : 프론트 앤드 스킬, 파이선 // B : C# // C : 그 외 로 구분하여 grade, id, email 조회
# 1. skillcodes.skill_code 와 develope.code를 2진수 변환 
# 2. skill_code & code = code 이용 → groupconcat 및 '%x%'로 해당 스킬이 있는지 확인
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


# 제미나이 피드백 : 재귀 CTE의 minus 컬럼 미사용, 데이터가 많을 경우 group_concat으로 비효율적일 수 있음, 불필요한 CTE 이용
# case 내에서 비트연산 & 카테고리를 통한 등급부여 및 where 절에서 등급분류대상 필터링

SELECT
    CASE
        -- A 등급: 'Python' 스킬을 가지고 있고, 'Front End' 카테고리의 스킬도 가지고 있는 경우
        WHEN (d.skill_code & (SELECT code FROM skillcodes WHERE name = 'Python')) > 0
             AND (d.skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End')) > 0
        THEN 'A'
        
        -- B 등급: 'C#' 스킬을 가지고 있는 경우 (A 등급에 해당하지 않는 경우)
        WHEN (d.skill_code & (SELECT code FROM skillcodes WHERE name = 'C#')) > 0
        THEN 'B'
        
        -- C 등급: 'Front End' 카테고리의 스킬을 가지고 있는 경우 (A, B 등급에 해당하지 않는 경우)
        WHEN (d.skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End')) > 0
        THEN 'C'
    END AS GRADE,
    d.ID,
    d.EMAIL
FROM developers d
WHERE
    -- 등급 분류 대상에 해당하는 개발자만 필터링 (불필요한 연산을 줄임)
    (d.skill_code & (SELECT code FROM skillcodes WHERE name = 'Python')) > 0
    OR (d.skill_code & (SELECT code FROM skillcodes WHERE name = 'C#')) > 0
    OR (d.skill_code & (SELECT SUM(code) FROM skillcodes WHERE category = 'Front End')) > 0
ORDER BY 
    GRADE,
    ID;
