-- Querying unique values while being filtered by a specific condition
SELECT DISTINCT column_name
FROM table_name
WHERE column_name condition value;

-- Counting the values aggregated by a specific column while filtering the results
SELECT column_name,
	COUNT (*) AS alias_name
FROM table_name
GROUP BY column_name
HAVING COUNT(*) condition value;

SELECT manufacturer, 
	company_location,
	-- Add a count of all the records, and set an alias for it
	count(*) as product_count
FROM productqualityrating 
-- Aggregate the results
GROUP BY manufacturer, 
	company_location
HAVING product_count > 1;

-- Select the different values for the attributes list
SELECT DISTINCT manufacturer,
	cocoa_percent, 
    ingredients
FROM productqualityrating
-- Add filter for attribute referring to name
WHERE bar_name = 'Arriba'
	-- Add filter for attribute referring to year
	AND year_reviewed > 2006;

SELECT manufacturer, 
	-- Add count of distinct combinations, and add alias to it
	COUNT(DISTINCT cocoa_percent, ingredients) AS distinct_combinations
FROM productqualityrating
WHERE bar_name = 'Arriba' 
    AND year_reviewed > 2006 
-- Group the results    
group by manufacturer;

SELECT manufacturer, 
	COUNT(DISTINCT cocoa_percent, ingredients) AS distinct_combinations
FROM productqualityrating
WHERE bar_name = 'Arriba' 
    AND year_reviewed > 2006 
GROUP BY manufacturer
-- Add the clause to filter
HAVING distinct_combinations > 1;
