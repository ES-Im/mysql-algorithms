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


# select concat('/home/grep/src/', BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) FILE_PATH
#   from USED_GOODS_FILE
#   where board_id = (select BOARD_ID from mostView)
#     and FILE_ID like 'IMG%'
#   order by FILE_ID desc;


SELECT CONCAT('/home/grep/src/', BOARD_ID, '/',FILE_ID, FILE_NAME, FILE_EXT)
FROM USED_GOODS_FILE A 
WHERE BOARD_ID = (SELECT BOARD_ID
                            FROM USED_GOODS_BOARD 
                           ORDER BY VIEWS DESC 
                           LIMIT 1 )
ORDER BY FILE_ID DESC