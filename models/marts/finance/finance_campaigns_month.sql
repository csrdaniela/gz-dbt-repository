with monthly as (
    select
    date_date
, extract (month from date_date) as date_month
from
{{ ref('finance_campaigns_day') }}
)
select
s.date_month
, sum(nb_transactions) as nb_transactions
, sum(revenue) as revenue
, sum(quantity) as quantity
, sum(avg_basket) as avg_basket
, sum(operational_margin) as operational_margin
, sum(purchase_cost) as purchase_cost
, sum(shipping_fee) as shipping_fee
, sum(logcost) as logcost
, sum(ship_cost) as ship_cost
, sum(ads_margin) as ads_margin
, sum(ads_cost) as ads_cost
, sum(impression) as impression
, sum(click) as click
from {{ ref('finance_campaigns_day') }}
join monthly s
using (date_date)
group by s.date_month
order by s.date_month asc
