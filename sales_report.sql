/*what are the monthly sales, profit, and quantity?

to get the monthly sales, we have to extract month from dates using strftime() function
and use the `sum` function to aggregate across sales, quantity and profit.

*/

select
	strftime('%y-%m',order_date) as order_month,
	sum(sales) as total_monthly_sales,
	sum(quantity) as total_monthly_quantity,
	sum(profit) as total_monthly_profit
from
	orders
group by
	strftime('%y-%m',order_date)
order by
	order_month;


/*what are the total sales and profit by different ship mode? */


select
	ship_mode,
	sum(sales) as total_sales,
	sum(profit) as total_profit
from
	orders
group by
	ship_mode;


/*what are the total sales and profit by different segments?*/

select
	segment,
	sum(sales) as total_sales,
	sum(profit) as total_profit
from
	orders
group by
	segment;

/* what are the total sales and profit by different categories and sub categories?*/

select
	category,
	sub_category,
	sum(sales) as total_sales,
	sum(profit) as total_profit
from
	orders
group by
	category,
	sub_category;

/* what is the quantity for each region?*/

select
	region,
	sum(quantity) as total_quantity
from
	orders
group by
	region;

/* what is the average discount for each product category?*/

select
	category,
	round(avg(discount),2) as average_discount 
from
	orders
group by
	category;

/* what are the average sales and profit per order?*/

select
	order_id,
	round(avg(sales),2) as average_sales,
	round(avg(profit),2) as average_profit
from
	orders
group by
	order_id;


/* what is the most profitable product?*/
select
	product_name,
	sum(profit) as total_product_profit
from
	orders
group by
	product_name
order by
	total_product_profit desc
limit 1


/*who are the top 5 customers based on their total spending?*/
select
	customer_id,
	customer_name,
	sum(sales) as total_sales
from 
	orders
group by
	customer_id,
	customer_name
order by
	total_sales desc
limit 5;

/* how many orders were placed in each year?*/

select
	strftime('%y',order_date) as order_year,
	count(distinct order_id) as order_placed
from
	orders
group by
	order_year;

	
/* how many orders were returned? */
select
	count(order_id) as returns_count
from
	returns


/* which product category has the most orders? */

select
	category,
	count(distinct order_id) as orders_count
from
	orders
group by
	category
order by
	orders_count desc 
limit 1


	

	

