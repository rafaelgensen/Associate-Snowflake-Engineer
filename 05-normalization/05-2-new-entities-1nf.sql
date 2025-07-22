-- Create a new entity
CREATE OR REPLACE TABLE ingredients (
	-- Add unique identifier 
    ingredient_id NUMBER(10,0) PRIMARY KEY,
  	-- Add other attributes 
    ingredient VARCHAR(255)
);

-- Create a new entity
CREATE OR REPLACE TABLE reviews (
	-- Add unique identifier 
    review_id NUMBER(10,0) PRIMARY KEY,
  	-- Add other attributes 
    review VARCHAR(255)
);