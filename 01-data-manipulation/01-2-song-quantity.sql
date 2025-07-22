SELECT
	customer_id,
    total,
    CASE
    	WHEN total IN (0.99, 1.99) THEN '1 Song'
        ELSE '2+ Songs'
    END AS number_of_songs
FROM store.invoice;

