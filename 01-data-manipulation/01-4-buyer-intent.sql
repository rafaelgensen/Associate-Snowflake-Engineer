SELECT
    name,
    unit_price,
    CASE
        WHEN unit_price = 0.99 AND genre_id IN (5, 9) THEN 'High'
        WHEN milliseconds < 300000 AND genre_id != 15 THEN 'Neutral'
        ELSE 'Low'
    END AS buyer_intent
FROM store.track;