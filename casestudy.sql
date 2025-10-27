--How to check all the column names in my database
select *
from bright_coffee.shop.sales
limit 15;


--I want to check my categorical columns
select distinct store_location,
from bright_coffee.shop.sales

select distinct product_category
from bright_coffee.shop.sales

select transaction_id,
       transaction_qty * unit_price as revenue
from bright_coffee.shop.sales

select min(transaction_time) as opening_time
from bright_coffee.shop.sales


select transaction_id,
       dayname(transaction_date) as day_name,
    case 
         when day_name in ('Sun','Sat') then 'weekend'
         else 'weekday'
end as day_classification,
         monthname(transaction_date) as month_name,
         transaction_time,
      case
          when transaction_time between'06:00:00' and '11:59:59' then 'morning'
          when transaction_time between '12:00:00' and '16:59:59' then 'afternoon'
          when transaction_time >= '17:00:00' then 'evening'
end as time_classification,
        hour(transaction_time) as hour_of_day,
        product_category,store_location,product_detail,product_type,
        count(distinct transaction_id) as number_of_sales,
         sum(transaction_qty*unit_price) as revenue
from bright_coffee.shop.sales
group by all;