-- Define an album_map CTE to combine albums and artists
WITH album_map AS (
    SELECT
        album.album_id, album.title AS album_name, artist.name AS artist_name,
  		-- Determine if an album is a "Greatest Hits" album
        CASE 
            WHEN album_name ILIKE '%greatest%' THEN TRUE
            ELSE FALSE
        END AS is_greatest_hits
    FROM store.album
    JOIN store.artist ON album.artist_id = artist.artist_id
), trimmed_invoicelines AS (
    SELECT
        invoiceline.invoice_id, track.album_id, invoice.total
    FROM store.invoiceline
    LEFT JOIN store.invoice ON invoiceline.invoice_id = invoice.invoice_id
    LEFT JOIN store.track ON invoiceline.track_id = track.track_id
)

SELECT
    album_map.album_name,
    album_map.artist_name,
    SUM(ti.total) AS total_sales_driven
FROM trimmed_invoicelines AS ti
JOIN album_map ON ti.album_id = album_map.album_id
-- Use a subquery to only "Greatest Hits" records
WHERE ti.album_id IN (SELECT album_id FROM album_map WHERE is_greatest_hits)
GROUP BY album_map.album_name, album_map.artist_name, is_greatest_hits
ORDER BY total_sales_driven DESC;