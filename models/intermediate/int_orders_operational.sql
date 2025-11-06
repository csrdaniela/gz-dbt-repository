select
  orders_id
  , date_date
  , round((margin + s.shipping_fee - s.logcost - s.ship_cost),2) as operational_margin
from 
{{ ref('int_orders_margin') }}
join
{{ ref('stg_gz_raw_data__ship') }} as s
using (orders_id)
order by orders_id desc