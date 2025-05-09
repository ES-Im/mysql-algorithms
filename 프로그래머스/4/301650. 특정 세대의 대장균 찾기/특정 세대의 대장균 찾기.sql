select e1.id from ecoli_data e1
join ecoli_data e2 on e1.parent_id = e2.id
join ecoli_data e3 on e2.parent_id = e3.id
where e3.parent_id is null;