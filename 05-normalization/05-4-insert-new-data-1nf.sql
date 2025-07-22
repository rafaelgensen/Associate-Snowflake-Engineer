SELECT
	-- Create a sequential number
	ROW_NUMBER() OVER (ORDER BY TRIM(f.value)),
	TRIM(f.value)
FROM productqualityrating,
LATERAL FLATTEN(INPUT => SPLIT(productqualityrating.ingredients, ';')) f
-- Group the data
GROUP BY TRIM(f.value);


-- Add command to insert data
INSERT INTO ingredients(ingredient_id, ingredient)
SELECT
	ROW_NUMBER() OVER (ORDER BY TRIM(f.value)) AS ingredients_id,
	TRIM(f.value) AS ingredients
FROM productqualityrating,
LATERAL FLATTEN(INPUT => SPLIT(productqualityrating.ingredients, ';')) f
GROUP BY TRIM(f.value);


-- Modify script for review
INSERT INTO reviews(review_id, review)
SELECT
	ROW_NUMBER() OVER (ORDER BY TRIM(f.value)) as review_id,
	TRIM(f.value) as review
FROM productqualityrating,
LATERAL FLATTEN(INPUT => SPLIT(productqualityrating.review, ';')) f
GROUP BY TRIM(f.value);
