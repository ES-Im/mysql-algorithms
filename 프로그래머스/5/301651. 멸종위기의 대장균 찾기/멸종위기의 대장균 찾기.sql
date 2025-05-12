-- 관련 문법 정리 https://silver-w.tistory.com/164

WITH RECURSIVE 
tmp AS (
    -- 1단계 : 부모가 없는 루트 노드
    SELECT ID, PARENT_ID, 1 AS GENERATION
      FROM ecoli_data
     WHERE PARENT_ID IS NULL
    
    UNION ALL

    -- 2단계 : 자식을 따라가며 세대 증가
    SELECT c.ID, c.PARENT_ID, p.generation + 1
      FROM ecoli_data c
     inner JOIN tmp p ON c.PARENT_ID = p.ID
)

-- 3단계 : 부모ID에 해당되지 않는 ID 조회
SELECT COUNT(*) AS COUNT, GENERATION
  FROM tmp
 WHERE ID NOT IN (SELECT PARENT_ID
                    FROM tmp 
                   WHERE PARENT_ID IS NOT NULL)
 GROUP BY GENERATION
 ORDER BY GENERATION;
