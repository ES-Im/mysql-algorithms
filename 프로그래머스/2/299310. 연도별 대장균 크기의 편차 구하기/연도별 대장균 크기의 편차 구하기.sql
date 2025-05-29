select YEAR(DIFFERENTIATION_DATE) as YEAR
     , (max(size_of_colony) OVER (partition by YEAR(DIFFERENTIATION_DATE))) - SIZE_OF_COLONY as YEAR_DEV
     , ID
  from ecoli_data
 order by 1, 2