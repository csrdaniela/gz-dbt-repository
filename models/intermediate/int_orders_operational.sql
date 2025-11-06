select
  o.orders_id
  , o.date_date
  , o.revenue
  , o.quantity
  , o.purchase_cost
  , o.margin
  , round((o.margin + s.shipping_fee - s.logcost - s.ship_cost),2) as operational_margin
  , s.shipping_fee
  , s.logcost
  , s.ship_cost
from 
{{ ref('int_orders_margin') }} as o
join
{{ ref('stg_gz_raw_data__ship') }} as s
using (orders_id)
order by orders_id desc