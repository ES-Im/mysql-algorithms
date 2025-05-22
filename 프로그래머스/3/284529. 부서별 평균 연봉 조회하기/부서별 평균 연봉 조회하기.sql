with dept_avg as (
    select dept_id, ROUND(AVG(sal)) AVG_SAL from HR_EMPLOYEES
    group by dept_id
)

select dept.DEPT_ID, DEPT_NAME_EN, AVG_SAL 
  from HR_DEPARTMENT dept
  join dept_avg avg on avg.dept_id = dept.dept_id
order by 3 desc;