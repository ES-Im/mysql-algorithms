-- 코드를 입력하세요
SELECT book_id, author_name, date_format(PUBLISHED_DATE, '%Y-%m-%d')
  from book
  join author using (author_id)
  where category = '경제'
  order by 3;