# 출력 : (LINE별) ROUTE, SUM(D_BETWEEN_DIST) round - .2f, AVG(D_CUMULATIVE) round - .3f
select ROUTE
     , concat(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') TOTAL_DISTANCE
     , concat(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AVERAGE_DISTANCE
  from SUBWAY_DISTANCE 
 GROUP BY ROUTE
 order by ROUND(SUM(D_BETWEEN_DIST),1) desc;   # concat 하면 문자열 처리 되므로, 2 desc 로 하면 결과 왜곡
  
