# # (참고) 재귀CTE : 세대표시
# with recursive tmp as (
#     select item_id, 1 as generation from item_tree
#     where parent_item_id is null
    
#     union all 
    
#     select t.item_id, t.generation + 1 from item_tree i
#     join tmp t on i.parent_item_id = t.item_id
#     where generation < 10
# )

# select * from tmp;

# 아이템의 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템 - 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)
select i.item_id as ITEM_ID, ITEM_NAME, RARITY
  from item_info i
 where i.item_id in (select t.item_id
                       from item_tree t
                       join item_info i on t.parent_item_id = i.ITEM_ID
                      where i.RARITY like 'RARE')
 order by 1 desc;