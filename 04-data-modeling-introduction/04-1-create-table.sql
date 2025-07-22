-- Describe the ecommerceonlineretail entity
DESC TABLE ecommerceonlineretail;

-- Create a new products entity
CREATE OR REPLACE TABLE products(
	-- List the entity's attributes
	stockcode VARCHAR(255),
    description VARCHAR(255)
);

-- Create a new orders entity
CREATE OR REPLACE TABLE orders (
	-- List the invoice attributes
	invoiceno VARCHAR(10),
  	invoicedate TIMESTAMP_NTZ(9),
  	-- List the attributes related to price and quantity
  	unitprice NUMBER(10,2),
  	quantity NUMBER(38,0)
);

-- Create customers table 
CREATE OR REPLACE TABLE customers (
  -- Define unique identifier
  customerid NUMBER(38,0) PRIMARY KEY,
  country VARCHAR(255)
);

-- Re-create orders table
CREATE OR REPLACE TABLE orders (
  -- Assign unique identifier column
  invoiceno VARCHAR(10) PRIMARY KEY,
  invoicedate TIMESTAMP_NTZ(9),
  unitprice NUMBER(10,2),
  quantity NUMBER(38,0),
  customerid NUMBER(38,0)
);

CREATE OR REPLACE TABLE orders (
  	invoiceno VARCHAR(10) PRIMARY KEY,
  	invoicedate TIMESTAMP_NTZ(9),
  	unitprice NUMBER(10,2),
  	quantity NUMBER(38,0),
  	-- Add columns that will refer the foreign key 
	customerid NUMBER(38,0) FOREIGN KEY REFERENCES customers(customerid),
  	stockcode VARCHAR(255) FOREIGN KEY REFERENCES  products(stockcode)
);

CREATE OR REPLACE TABLE orders (
  	invoiceno VARCHAR(10) PRIMARY KEY,
  	invoicedate TIMESTAMP_NTZ(9),
  	unitprice NUMBER(10,2),
  	quantity NUMBER(38,0),
  	customerid NUMBER(38,0),
  	stockcode VARCHAR(255),
  	-- Add foreign key refering to the foreign tables
	FOREIGN KEY (customerid) REFERENCES customers(customerid),
	FOREIGN KEY (stockcode) REFERENCES  products(stockcode)
);

-- Create entity
CREATE OR REPLACE TABLE batchdetails (
	-- Add numerical attribute
	batch_id NUMBER(10,0),
	-- Add characters attributes
    batch_number VARCHAR(255),
    production_notes VARCHAR(255)
);
