select
  s.date_date
  , s.orders_id
  , s.products_id
  , s.revenue
  , s.quantity
  , p.purchase_cost
  , p.purchase_cost * s.quantity as total_purchase_cost
  , round( s.revenue - (p.purchase_cost * s.quantity),2) as margin
  , {{margin_percent('s.revenue', 's.quantity * p.purchase_cost' )}}
from 
  {{ ref('stg_gz_raw_data__sales') }} s
join 
  {{ ref('stg_gz_raw_data__product') }} p
using
  (products_id)



