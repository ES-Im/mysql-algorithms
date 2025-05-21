# select any_value(ID), FISH_NAME, MAX(LENGTH)
#   from fish_info f
#   join fish_name_info fn on f.fish_type = fn.fish_type
#   group by fn.FISH_NAME

select f.id id, fi.fish_name fish_name, f.length length
from fish_info f
join  (select fish_type, MAX(LENGTH) as length
                              from fish_info
                          group by fish_type) tmp
on f.fish_type = tmp.fish_type and f.length = tmp.length
join fish_name_info fi on f.fish_type = fi.fish_type