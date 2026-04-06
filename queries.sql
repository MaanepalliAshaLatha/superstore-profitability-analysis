create database super_store_analysis;
use super_store_analysis;
select * from global_superstore2;

																	-- SECTION 1: OVERVIEW ANALYSIS

select 
category,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round((sum(profit)/sum(sales))*100,2) as profit_margin,
round(avg(discount)*100,2)  as average_discount
from global_superstore2
group by category;


																	-- SECTION 2: PROFITABILITY BY DISCOUNT
-- Profitability by discount
select
case 
	when discount=0 then "0"
    when discount>0 and discount<=0.1 then "1-10"
    when discount>0.1 and discount<=0.2 then "11-20"
	when discount>0.2 and discount<=0.3 then "21-30"
    when discount>0.3 and discount<=0.4 then "31-40"
	when discount>0.4 and discount<=0.5 then "41-50"
    when discount>0.5 and discount<=0.6 then "51-60"
    when discount>0.6 and discount<=0.7 then "61-70"
    else "71-80"
end as discount_range,
count(distinct `order id`) as orders,
round(avg(profit),2) as avg_profit,
round(sum(profit)/count(distinct `order id`),2) as profit_per_order
from global_superstore2
group by discount_range;
																	
																	-- SECTION 3 PROFIT AND LOSS SHARE

-- loss share
select
case 
	when discount=0  then "0"
    when discount>0 and discount<=0.1 then "1-10"
    when discount>0.1 and discount<=0.2 then "11-20"
	when discount>0.2 and discount<=0.3 then "21-30"
    when discount>0.3 and discount<=0.4 then "31-40"
	when discount>0.4 and discount<=0.5 then "41-50"
    when discount>0.5 and discount<=0.6 then "51-60"
    when discount>0.6 and discount<=0.7 then "61-70"
    else "71-80"
end as discount_range,
round((sum(profit)/sum(sum(profit)) over()*100),2)as loss_share
from global_superstore2
where profit<0
group by discount_range
order by discount_range,loss_share;

-- profit share
select
case 
	when discount=0  then "0"
    when discount>0 and discount<=0.1 then "1-10"
    when discount>0.1 and discount<=0.2 then "11-20"
	when discount>0.2 and discount<=0.3 then "21-30"
    when discount>0.3 and discount<=0.4 then "31-40"
	when discount>0.4 and discount<=0.5 then "41-50"
    when discount>0.5 and discount<=0.6 then "51-60"
    when discount>0.6 and discount<=0.7 then "61-70"
    else "71-80"
end as discount_range,
round((sum(profit)/sum(sum(profit)) over()*100),2)as profit_share
from global_superstore2
where profit>0
group by discount_range
order by discount_range,profit_share;

															-- SECTION 4 THRESHOLD ANALYSIS (40%)

-- What % of total losses come from 40%+ discounts?
select
sum(profit) as total_loss,
sum(case when discount>=0.4 then profit end) as loss_from_40plus,
round(
(round(sum(case when discount>=0.4 then profit end),2)
/
round(sum(profit),2))*100
,2) as loss_share
from global_superstore2
where profit<0;

-- to calculate profit_per_order based on discount range
select
case
   when discount >= 0.4 then '40%+'
   else '<40%'
end as discount_group,
sum(profit)/count(distinct `order id`) as profit_per_order
from global_superstore2
group by discount_group;

-- order share over discount regions
 select 
 case 
	when discount=0 then "0"
    when discount>0 and discount<=0.1 then "1-10"
    when discount>0.1 and discount<=0.2 then "11-20"
	when discount>0.2 and discount<=0.3 then "21-30"
    when discount>0.3 and discount<=0.4 then "31-40"
	when discount>0.4 and discount<=0.5 then "41-50"
    when discount>0.5 and discount<=0.6 then "51-60"
    when discount>0.6 and discount<=0.7 then "61-70"
    else "71-80"
end as discount_range,
count(distinct `order id`) as orders,
round((count(distinct `order id`)/sum(count(distinct `order id`)) over())*100 ,2) as order_share
from global_superstore2
group by discount_range;

															-- SECTION 5 PRODUCT LEVEL ANALYSIS

-- to know which sub category causes losses
 select 
 case 
	when discount=0 then "0"
    when discount>0 and discount<=0.1 then "1-10"
    when discount>0.1 and discount<=0.2 then "11-20"
	when discount>0.2 and discount<=0.3 then "21-30"
    when discount>0.3 and discount<=0.4 then "31-40"
	when discount>0.4 and discount<=0.5 then "41-50"
    when discount>0.5 and discount<=0.6 then "51-60"
    when discount>0.6 and discount<=0.7 then "61-70"
    else "71-80"
end as discount_range,
`sub-category`,
count(distinct `order id`) as orders,
round(sum(profit),2) as total_profit,
round(sum(profit),2)/count(distinct `order id`) as profit_per_order
from global_superstore2
group by discount_range,`sub-category`
order by total_profit;

-- profit and loss 
select
case
	when discount<0.4 then "discount<40%"
    else "discount>=0.4"
end as discount_range,
`sub-category`,
round(sum(case when discount>=0.4 and profit<0 then profit end),2) as loss,
round(sum(case when discount<0.4 and  profit<0 then profit end),2) as profit
from global_superstore2
group by discount_range,`sub-category`;

-- top 5 products with the biggest losses when discount ≥ 40%:
select 
`product name`,
sum(profit) as total_loss,
count(`order id`)
from global_superstore2
where discount >= 0.4
group by `product name`
order by total_loss 
limit 5;

																-- SECTION 6 REGIONAL ANALYSIS

-- to Find how many 40%+ discount orders happen in each region
select
region,
count(distinct `order id`) as orders_with_40plus
from global_superstore2
where discount>=0.4
group by region
order by orders_with_40plus;

-- % of orders with 40%+ discounts
select
region,
count(distinct `order id`) as total_orders,
count(distinct case when discount>=0.4 then  `order id` end) as orders_with_40plus,
round((count(distinct case when discount>=0.4 then  `order id` end)/count(distinct `order id`))*100,2) as total_share
from global_superstore2
group by region
order by total_share;

-- to find total loss and loss share across regions over 40% plus discount
select 
region,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as tota1_loss,
round((sum(profit)/sum(sales) *100),2) as loss_share
from global_superstore2
where discount>=0.4
group by region
order by loss_share;

-- loss per order to find the impact 
select
region,
count(distinct `order id`) as total_orders_above_40plus,
round(sum(profit),2) as total_loss_above_40plus,
round(sum(profit)/count(distinct `order id`),2) as loss_per_order
from global_superstore2
where discount>=0.4
group by region
order by loss_per_order;

															-- SECTION 7 CENTRAL REGION DEEP DIVE

-- to find which category is responsible for huge losses at central
select 
case 
	when discount>=0.4 and discount<=0.5 then "40-50"
    when discount>0.5 and discount<=0.6 then "50-60"
    when discount>0.6 and discount<=0.7 then "60-70"
    else "70-80"
end as discount_range,
category,
`sub-category`,
sum(profit) as total_loss_above40,
count(distinct `order id`) as orders,
round(
sum(profit)
/
count(distinct `order id`)
,2) as loss_per_order,
sum(quantity)/count(distinct `order id`) as avg_quantity_per_order,
sum(profit)/sum(quantity) as loss_per_item,
(sum(profit)/sum(sum(profit)) over()*100) as loss_share
from global_superstore2
where region="Central" and profit<0 and discount>=0.4
group by discount_range,category,`sub-category`
order by total_loss_above40 desc;