-- with rollup에 갑자기 꽃혀서 기재했지만, 없어도 되는 유형. rollup으로 추출하는 집계값이 필요한게 아니면 제외토록한다.
select user_id, product_id
from (select user_id, product_id, count(*) 
        from online_sale
       group by user_id, product_id with rollup
      having count(*) >= 2 and product_id is not null
       order by user_id asc, product_id desc) tmp;
