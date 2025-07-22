SELECT
    genre_name,
    avg(milliseconds) AS average_milliseconds
FROM (
    SELECT
        genre.name AS genre_name,
        track.genre_id,
        track.milliseconds as milliseconds
    FROM store.track
    JOIN store.genre ON track.genre_id = genre.genre_id
)
GROUP BY genre_name;
