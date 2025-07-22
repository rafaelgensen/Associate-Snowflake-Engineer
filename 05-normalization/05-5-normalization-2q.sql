-- Add new entity
CREATE OR REPLACE TABLE manufacturers (
  	-- Assign unique identifier
  	manufacturer_id NUMBER(10,0) PRIMARY KEY,
  	--Add other attributes
  	company_location VARCHAR(255),
  	manufacturer VARCHAR(255)
);

-- Add values to manufacturers
INSERT INTO manufacturers (manufacturer_id, manufacturer, company_location)
SELECT 
	-- Generate a sequential number
	ROW_NUMBER() OVER (order by manufacturer, company_location),
    manufacturer, 
	company_location
FROM productqualityrating
-- Aggregate data by the other attributes
GROUP BY manufacturer, 
	company_location;
