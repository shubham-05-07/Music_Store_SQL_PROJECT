-- Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the 
-- longest songs listed first
select track.name, track.milliseconds 
from track 
where track.milliseconds> (
			select avg(track.milliseconds)
            from track )
order by track.milliseconds desc;