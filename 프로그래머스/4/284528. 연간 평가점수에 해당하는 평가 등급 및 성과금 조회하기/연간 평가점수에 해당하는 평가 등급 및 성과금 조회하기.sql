-- HR_DEPARTMENT(DEPT_ID), HR_EMPLOYEES(EMP_NO), HR_GRADE(EMP_NO)

with cte as (
    select distinct emp_no
     , emp_name
     , year
     , (sum(score) over(partition by emp_no)) / 2 as score
  from HR_GRADE
  join HR_EMPLOYEES using (emp_no)
)

select c.emp_no, c.emp_name, grade
     , (sal * (case when grade = 'S' then 0.2
                    when grade = 'A' then 0.15
                    when grade = 'B' then 0.1
               else 0 end)) BONUS
from (select EMP_NO
           , EMP_NAME
           , case
                when score >= 96 then 'S'
                when score >= 90 then 'A'
                when score >= 80 then 'B'
             else 'C' end as GRADE
        from cte) c
join HR_EMPLOYEES using (emp_no)
