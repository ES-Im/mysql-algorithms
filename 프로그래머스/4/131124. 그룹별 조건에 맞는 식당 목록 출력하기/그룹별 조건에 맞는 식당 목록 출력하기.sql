-- MEMBER_PROFILE(MEMBER_ID), REST_REVIEW(REVIEW_ID) 
--  리뷰를 가장 많이 작성한 회원의 리뷰들을 조회

select p.member_name, review_text, date_format(review_date, '%Y-%m-%d') as review_date
  from member_profile p 
  join (select member_id
             , count(member_id) cnt from rest_review 
         group by member_id 
         order by cnt desc
         limit 1) tmp using (member_id)
  join rest_review r using (member_id)
  order by 3, 2;
