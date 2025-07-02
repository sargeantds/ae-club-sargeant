with customers as (

  select 
    * 
  from `analytics-engineers-club.coffee_shop.customers`
)

, orders as (
 
  select distinct
    * EXCEPT(id),
    id as order_id
  from `analytics-engineers-club.coffee_shop.orders`

)

select distinct
  id as customer_id,
  name, 
  email,
  min(created_at) over (partition by id) as first_order_at,
  count(order_id) over (partition by id) as order_count,
from customers c
left join orders o on c.id = o.customer_id
order by 4
limit 5
