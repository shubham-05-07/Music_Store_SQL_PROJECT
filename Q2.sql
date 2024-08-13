-- Which countries have the most invoices? 
SELECT * FROM music_store.invoice;

select billing_country, count(invoice_id) as number_of_billings 
from invoice 
group by billing_country
order by number_of_billings desc;