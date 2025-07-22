SELECT
    track.name,
    track.composer,
    artist.name,
    CASE
        WHEN track.composer IS NULL THEN 'Track Lacks Detail'
        WHEN track.composer = artist.name THEN 'Matching Artist'
        ELSE 'Inconsistent Data'
    END AS data_quality
FROM store.track AS track
LEFT JOIN store.album AS album ON track.album_id = album.album_id
LEFT JOIN store.artist AS artist ON album.artist_id = artist.artist_id;