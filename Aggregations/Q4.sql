An e-commerce company want to start special reward program for their premium customers.  The customers who have placed a greater number of orders than the average number of orders placed by customers are considered as premium customers.

 

Write an SQL to find the list of premium customers along with the number of orders placed by each of them, display the results in highest to lowest no of orders.

 

Table: orders (primary key : order_id)
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| order_id      | int         |
| order_date    | date        |
| customer_name | varchar(20) |
| sales         | int         |
+---------------+-------------+


Select customer_name,
count(order_id) as no_of_orders from orders
group by 1
having count(order_id) > (Select avg(no_of_orders) as avg_num_orders from (Select customer_name, count(order_id) as no_of_orders from orders
group by 1) a)
order by 2 desc