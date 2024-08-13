-- Let's invite the artists who have written the most rock music in our dataset. Write a 
-- query that returns the Artist name and total track count of the top 10 rock bands.

select artist.name, count(artist.artist_id) as number_of_rock_songs
from artist join album 
on artist.artist_id = album.artist_id join track 
on album.album_id = track.album_id join genre
on genre.genre_id = track.genre_id
where genre.name = "Rock"
group by artist.name
order by number_of_rock_songs desc;