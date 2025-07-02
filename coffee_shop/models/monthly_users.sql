select
    date_trunc(first_order_at, month) as signup_month,
    count(*) as new_customers
 
from `analytics-engineers-club.coffee_shop.users` -- update this for your project and schema
 
group by 1