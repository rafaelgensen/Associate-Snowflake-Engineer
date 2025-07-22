WITH track_metrics AS (
    SELECT 
        composer,
        milliseconds / 1000 AS num_seconds,
        unit_price
    FROM store.track
    WHERE composer IS NOT NULL
)

SELECT
    composer,
    AVG(unit_price / num_seconds) AS cost_per_second
FROM track_metrics
GROUP BY composer
ORDER BY cost_per_second DESC;
