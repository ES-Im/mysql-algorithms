select e.ID as ID, ifnull(t.pi,0) as CHILD_COUNT 
from ecoli_data e
left outer join (select PARENT_ID, count(PARENT_ID) as pi from ecoli_data group by PARENT_ID) t
on e.ID = t.PARENT_ID;
