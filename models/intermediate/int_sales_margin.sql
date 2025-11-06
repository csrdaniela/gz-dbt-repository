select
  date_date
  , orders_id
  , products_id
  , revenue
  , quantity
  , purchase_cost
  , purchase_cost * quantity as total_purchase_cost
  , round( revenue - (purchase_cost * quantity),2) as margin
  , {{margin_percent ( 'revenue', 'purchase_cost' ) }} as margin_percent
from 
  {{ ref('stg_gz_raw_data__sales') }}
join 
  {{ ref('stg_gz_raw_data__product') }}
using
  (products_id)