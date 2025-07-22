WITH track_lengths AS (
	SELECT
        genre.name,
        track.genre_id,
        track.milliseconds / 1000 AS num_seconds
    FROM store.track
    JOIN store.genre ON track.genre_id = genre.genre_id
)

SELECT
    track_lengths.name,
    AVG(track_lengths.num_seconds) AS avg_track_length
FROM track_lengths
GROUP BY track_lengths.name
ORDER BY avg_track_length;
