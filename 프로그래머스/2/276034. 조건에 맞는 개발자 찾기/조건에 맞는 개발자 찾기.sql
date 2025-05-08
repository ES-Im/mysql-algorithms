# select id, email, first_name, last_name
# from DEVELOPERS
# where (skill_code & (select code from skillcodes where name = 'Python') = (select code from skillcodes where name = 'Python'))
#    or (skill_code & (select code from skillcodes where name = 'C#') = (select code from skillcodes where name = 'C#')) 
# order by id;


select distinct id, email, first_name, last_name    # Pyhon, C# 둘다 충족할 경우 중복 발생 방지
  from DEVELOPERS d
 inner join (select code from skillcodes where name in ('Python','C#')) tmp 
    on d.skill_code & tmp.code = tmp.code
 order by 1;