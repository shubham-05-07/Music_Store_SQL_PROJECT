-- Which city has the best customers? We would like to throw a promotional Music 
-- Festival in the city we made the most money. Write a query that returns one city that 
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

select billing_city, round(sum(total),2) as Total_Invoices
from invoice
group by billing_city 
order by Total_Invoices desc
limit 1;
