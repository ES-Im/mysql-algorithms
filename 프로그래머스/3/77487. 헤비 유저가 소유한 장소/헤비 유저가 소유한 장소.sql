select ID, NAME, HOST_ID from PLACES
 where HOST_ID in (
    select HOST_ID from places
     group by HOST_ID having COUNT(*) > 1
)
