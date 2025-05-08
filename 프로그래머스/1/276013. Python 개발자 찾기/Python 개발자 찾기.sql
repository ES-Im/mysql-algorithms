select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPER_INFOS 
where concat_ws('',skill_1, skill_2, skill_3) like '%Python%'
order by 1;
#널문자 비교 불가 방지를 위해 concat_ws 이용