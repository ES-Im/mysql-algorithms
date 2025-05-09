select ID,
    case 
    when SIZE_OF_COLONY between 0 and 100 then 'LOW'
    when SIZE_OF_COLONY between 101 and 1000 then 'MEDIUM'
    else 'HIGH' end as SIZE
from ecoli_data