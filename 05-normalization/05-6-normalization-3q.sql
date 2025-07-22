-- Create entity
CREATE OR REPLACE TABLE locations (
	-- Add unique identifier
  	location_id NUMBER(10,0) PRIMARY KEY,
  	-- Add main attribute
  	location VARCHAR(255)
);

-- Populate entity from other entity's data
INSERT INTO locations (location_id, location)
SELECT 
	-- Generate unique sequential number
	ROW_NUMBER() OVER (ORDER BY company_location),
    -- Select the main attribute
	company_location
FROM manufacturers
-- Aggregate data by main attribute
GROUP BY company_location;

-- Modify entity
ALTER TABLE manufacturers
-- Remove attribute
DROP COLUMN IF EXISTS company_location;