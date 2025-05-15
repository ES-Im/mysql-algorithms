select count(*) as FISH_COUNT, MAX(Length) as MAX_LENGTH, FISH_TYPE
from FISH_INFO
group by Fish_Type
having avg(ifnull(Length,10)) >= 33
order by 3