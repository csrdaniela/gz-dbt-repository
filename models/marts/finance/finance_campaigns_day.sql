select f.date_date
, nb_transactions as nb_transactions
, revenue as revenue
, quantity as quantity
, avg_basket as avg_basket
, operational_margin as operational_margin
, purchase_cost as purchase_cost
, shipping_fee as shipping_fee
, logcost as logcost
, ship_cost as ship_cost
, round((f.operational_margin - m.ads_cost),2) as ads_margin
, m.ads_cost as ads_cost
, m.impression as impression
, m.click as click
from {{ ref('finance_days') }} f
join {{ ref('int_campaigns_day') }} m
using (date_date)
