-- Find how much amount spent by each customer on artists? Write a query to return
-- customer name, artist name and total spent

select customer.customer_id, customer.first_name as customer_first_name, customer.last_name as customer_last_name,
  spent_on_artist.artist_name, sum(invoice_line.quantity*invoice_line.unit_price) 
from customer join invoice
on customer.customer_id = invoice.customer_id join invoice_line
on invoice.invoice_id = invoice_line.invoice_id join track
on track.track_id = invoice_line.track_id join album
on track.album_id = album.album_id join 
(select artist.artist_id, artist.name as artist_name,
 sum(invoice_line.unit_price*invoice_line.quantity) as total_spent
from invoice_line join track
on invoice_line.track_id = track.track_id join album
on track.album_id = album.album_id join artist
on album.artist_id = artist.artist_id
group by 1,2) as spent_on_artist 
on spent_on_artist.artist_id = album.artist_id
group by 1,2,3,4
order by 5 desc;