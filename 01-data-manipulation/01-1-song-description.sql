SELECT
	name,
    composer,
    CASE
    	WHEN unit_price = 0.99 THEN 'Standard Song'
        WHEN unit_price = 1.99 THEN 'Premium Song'
    END AS song_description
FROM store.track;
