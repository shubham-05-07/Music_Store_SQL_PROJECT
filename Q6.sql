-- Write query to return the email, first name, last name, & Genre of all Rock Music 
-- listeners. Return your list ordered alphabetically by email starting with A

select distinct customer.email, customer.first_name, customer.last_name, genre.name 
from customer join invoice 
on customer.customer_id = invoice.customer_id join invoice_line
on invoice.invoice_id = invoice_line.invoice_id join track 
on invoice_line.track_id = track.track_id join genre
on track.genre_id = genre.genre_id
where genre.name = "Rock"
order by email;