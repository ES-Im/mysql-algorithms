-- 각 분기별 분화된 대장균의 개체의 총 수 
# select distinct concat(Quarter(DIFFERENTIATION_DATE), 'Q') as QUARTER
#      , count(*) over (partition by Quarter(DIFFERENTIATION_DATE)) as ECOLI_COUNT
#   from ECOLI_DATA

select concat(Quarter(DIFFERENTIATION_DATE), 'Q') as QUARTER
     , count(*) as ECOLI_COUNT
  from ECOLI_DATA
 group by QUARTER
 order by 1