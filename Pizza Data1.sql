/*total revenue */
select round(sum(total_price),2)as Total_Revenue
from pizza_sales;

/*Avg Order Value*/
select round(sum(quantity * total_price)/count(distinct(order_id)),2 )as Average_Order
from pizza_sales;

/*avg pizza per order*/
select round(sum(quantity)/count(distinct(order_id)),0) as AVG_Pizza_per_Order
from pizza_sales

/* total number of pizza sold*/
select sum(quantity) as pizza_sold
from pizza_sales;

/*total orders*/
select count(distint(order_id)
from pizza_sales;
/*pizza sold by catergory*/

select sum(order_id),pizza_category
from pizza_sales
group by pizza_category;

/*top 5 pizza by revenue*/
select round(sum(total_price),0)as total_price, pizza_category ,count(distinct(pizza_name))
from pizza_sales
group by pizza_category
order by total_price desc;

/*top 5 pizza by quantity*/
select sum(quantity) as quantity,pizza_name
from pizza_sales
group by pizza_name
order by quantity desc limit 5;

/*top 5 pizza by total order*/
select pizza_name, count(distinct(order_id)) as total_order
from pizza_sales
group by pizza_name
order by total_order desc
limit 5;

/*bottom 5 pizza by revenue*/

select pizza_name, round(sum(total_price),0) as revenue
from pizza_sales
group by pizza_name
order by revenue asc
limit 5;

/*bottom 5 pizza by quantity*/
select pizza_name, sum(quantity) as quantity
from pizza_sales
group by pizza_name
order by quantity 
limit 5;

/*bottom 5 pizza by total order*/
select pizza_name , count(distinct(order_id)) as total_order
from pizza_sales
group by pizza_name
order by total_order
limit 5;

/*daily trend for total orders*/
select dayname(order_date) as day_name, count(distinct(order_id)) as total_order
from pizza_sales
group by day_name
order by total_order desc;

/*monthly trend for total order*/
select monthname(order_date) as month_name, count(distinct(order_id)) as total_order
from pizza_sales
group by month_name
order by total_order desc;

/* percentage of sales by pizza category */
select pizza_name, pizza_category, sum(total_price)/10 as Price
from pizza_sales
group by pizza_category,pizza_name
order by Price;

/*percentage of sales by pizza size*/
select pizza_name, count(distinct(pizza_size)) as size, round(sum(total_price)/10,0) as Price
from pizza_sales
group by  pizza_name
order by Price;