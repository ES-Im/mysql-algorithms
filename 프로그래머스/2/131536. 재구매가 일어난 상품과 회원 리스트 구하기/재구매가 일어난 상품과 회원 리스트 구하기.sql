select user_id, product_id
from (select user_id, product_id, count(*) 
        from online_sale
       group by user_id, product_id with rollup
      having count(*) >= 2 and product_id is not null
       order by user_id asc, product_id desc) tmp;