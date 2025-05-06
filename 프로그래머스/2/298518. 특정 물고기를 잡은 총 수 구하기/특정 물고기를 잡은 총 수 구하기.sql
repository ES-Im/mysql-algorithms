-- 코드를 작성해주세요
select count(*) as fish_count
from fish_info f
inner join fish_name_info fn on f.fish_type = fn.fish_type
where fn.fish_name = 'BASS' or fn.fish_name = 'SNAPPER';