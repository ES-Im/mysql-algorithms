-- USED_GOODS_BOARD  :  게시판 정보
--  USED_GOODS_FILE  : 첨부파일 정보
-- 조회수가 가장 높은 게시글의 첨부파일 경로 

# -- 조회수가 가장 높은 게시글 추출
# with mostView as (
#     select BOARD_ID, MAX(views) as mostView
#       from USED_GOODS_BOARD 
#      order by views DESC
#      limit 1
# )

#→ 아래는 이건 group by 없이 집계 함수와 일반 컬럼을 같이 쓰는 형태로,
#→ BOARD_ID가 MAX(views)의 게시글이 아닐 수도 있음!
# select concat('/home/grep/src/', BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) FILE_PATH
#   from USED_GOODS_FILE
#   where board_id = (select BOARD_ID from mostView)
#     and FILE_ID like 'IMG%'
#   order by FILE_ID desc;

# 아래와 같이 이런 문제에서는 집계함수보다 정렬 + LIMIT이 안전
SELECT CONCAT('/home/grep/src/', BOARD_ID, '/',FILE_ID, FILE_NAME, FILE_EXT)
FROM USED_GOODS_FILE A 
WHERE BOARD_ID = (SELECT BOARD_ID
                            FROM USED_GOODS_BOARD 
                           ORDER BY VIEWS DESC 
                           LIMIT 1 )
ORDER BY FILE_ID DESC
