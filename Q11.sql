-- Write a query that determines the customer that has spent the most on music for each 
-- country. Write a query that returns the country along with the top customer and how
-- much they spent. For countries where the top amount spent is shared, provide all 
-- customers who spent this amount
with cs as( 
select customer.first_name, customer.last_name, customer.country,
round(sum(invoice_line.unit_price*invoice_line.quantity),2) as total_spent
from customer join invoice 
on customer.customer_id = invoice.customer_id join invoice_line
on invoice.invoice_id = invoice_line.invoice_id
group by 1,2,3
order by 4 desc
), max_spent_cntry as(
select max(total_spent) as max_purchases, country from cs
group by 2
order by 2 desc
)
select cs.* from cs
join max_spent_cntry on 
cs.country = max_spent_cntry.country
where cs.total_spent = max_spent_cntry.max_purchases