select 
    case
        when media_type_id in (2,3) then 'protected'
        else 'not_protected'
    end as media_protected,
    count(1),
from
    TRACK
group by media_protected