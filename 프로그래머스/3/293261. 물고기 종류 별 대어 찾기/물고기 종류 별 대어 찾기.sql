# JOIN, MAX 이용
select f.id id, fi.fish_name fish_name, f.length length
from fish_info f
join  (select fish_type, MAX(LENGTH) as length
                              from fish_info
                          group by fish_type) tmp
on f.fish_type = tmp.fish_type and f.length = tmp.length
join fish_name_info fi on f.fish_type = fi.fish_type

# 윈도우 함수 이용
SELECT f.id, fi.fish_name, f.length
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY fish_type ORDER BY length DESC) as rn
    FROM fish_info
) f
JOIN fish_name_info fi ON f.fish_type = fi.fish_type
WHERE f.rn = 1
order by ID;
