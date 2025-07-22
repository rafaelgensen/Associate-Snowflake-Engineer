SELECT
	name,
    milliseconds,
    CASE
    	WHEN milliseconds < 180000 THEN 'Short Song'
        WHEN milliseconds BETWEEN 180000 AND 300000 THEN 'Normal Length'
        ELSE 'Long Song'
    END AS song_length
FROM store.track;
