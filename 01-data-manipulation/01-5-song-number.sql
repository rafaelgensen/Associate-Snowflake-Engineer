SELECT
    CASE
    	WHEN total IN (0.99, 1.99) THEN '1 Song'
        ELSE '2+ Songs'
    END as number_of_songs,
    AVG(total)
FROM store.invoice
GROUP BY number_of_songs;
