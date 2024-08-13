-- Who is the best customer? The customer who has spent the most money will be declared the
-- best customer. Write a query that returns the person who has spent the most money

SELECT customer.customer_id, customer.first_name, customer.last_name, round(sum(invoice.total),2) as total_money_spent 
from customer
join invoice 
on customer.customer_id = invoice.customer_id
group by customer.customer_id,customer.first_name, customer.last_name
order by total_money_spent desc
limit 1;  