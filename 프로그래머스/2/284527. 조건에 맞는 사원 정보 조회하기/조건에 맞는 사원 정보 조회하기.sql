# HR_DEPARTMENT(DEPT_ID), HR_EMPLOYEES(EMP_NO), HR_GRADE(EMP_NO)
# 2022년 평가 점수가 가장 높은 사원 (평가 점수 = 상, 하반기 점수 합)
# SCORE	EMP_NO	EMP_NAME	POSITION	EMAIL

with gradeSum as (
    select EMP_NO, sum(score) score
      from HR_GRADE
     group by EMP_NO, year
     having year = 2022
)


select score, e.EMP_NO, emp_name, position, email
  from HR_EMPLOYEES e
  join gradeSum g on e.EMP_NO = g.EMP_NO
 order by 1 desc
 limit 1;