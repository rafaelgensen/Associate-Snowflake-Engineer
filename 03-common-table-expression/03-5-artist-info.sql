-- Create an artist_info CTE, JOIN the artist and album tables
WITH artist_info AS (
    SELECT
        album.album_id,
        artist.name AS artist_name
    FROM store.album
    JOIN store.artist ON album.artist_id = artist.artist_id

-- Define a track_sales CTE to assign an album_id, name,
-- and number of seconds for each track
), track_sales AS (
    SELECT
        track.album_id,
        track.name,
        track.milliseconds / 1000 AS num_seconds
    FROM store.invoiceline
    JOIN store.track ON invoiceline.track_id = track.track_id
)

SELECT
    ai.artist_name,
    -- Calculate total minutes listed
    SUM(ts.num_seconds) / 60 AS minutes_listened
FROM track_sales AS ts
JOIN artist_info AS ai ON ts.album_id = ai.album_id
-- Group the results by the non-aggregated column
GROUP BY ai.artist_name
ORDER BY minutes_listened DESC;
