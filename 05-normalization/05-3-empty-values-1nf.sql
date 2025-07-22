SELECT
	-- Clean empty values
	TRIM(f.value)
FROM productqualityrating,
-- Add function to split values separated by comma
LATERAL FLATTEN(INPUT => SPLIT(productqualityrating.ingredients, ';')) f;