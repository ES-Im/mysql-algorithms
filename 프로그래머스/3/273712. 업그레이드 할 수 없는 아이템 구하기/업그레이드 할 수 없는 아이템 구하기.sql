# 관련 문법 : https://silver-w.tistory.com/171

with getId as (
    select item_id from item_tree t1
    where not exists (
        select 1 from item_tree t2
        where t1.item_id = t2.parent_item_id
    )
)

select i.item_id, ITEM_NAME, RARITY
  from item_info i
  join getId g on i.item_id = g.item_id
 order by 1 desc;
