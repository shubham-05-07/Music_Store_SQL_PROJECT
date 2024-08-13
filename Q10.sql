-- We want to find out the most popular music Genre for each country. We determine the 
-- most popular genre as the genre with the highest amount of purchases. Write a query 
-- that returns each country along with the top Genre. For countries where the maximum 
-- number of purchases is shared return all Genres

with popular_genre as (
select genre.name,a.country,sum(a.quantity) as total_orders
from genre join track
on genre.genre_id = track.genre_id join invoice_line
on track.track_id = invoice_line.track_id join
(select  customer.country,invoice_line.quantity,invoice_line.invoice_id
from customer join invoice 
on customer.customer_id = invoice.customer_id join invoice_line
on invoice.invoice_id = invoice_line.invoice_id) as a
on invoice_line.invoice_id = a.invoice_id
group by 1,2
order by 2, 3 desc
), max_ordered_con as (
select max(total_orders) as max_order,country
from popular_genre 
group by 2
)
select popular_genre.* from popular_genre
join max_ordered_con on 
popular_genre.country = max_ordered_con.country
where popular_genre.total_orders = max_ordered_con.max_order