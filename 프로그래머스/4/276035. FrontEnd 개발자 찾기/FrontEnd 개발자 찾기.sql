-- SKILLCODES(CODE-2진수), DEVELOPERS(SKILL_CODE - Code 2진수 합산) : Skill_code & code == code
-- Front End 스킬을 가진 개발자의 ID(ASC), 이메일, 성

select ID, EMAIL, FIRST_NAME, LAST_NAME
  from developers
 where skill_code
       & (select BIT_OR(code) 
            from skillcodes
           where category = 'Front End') 
 order by 1 ASC;

