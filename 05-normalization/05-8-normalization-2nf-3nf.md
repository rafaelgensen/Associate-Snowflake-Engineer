# Introduction to 2NF

-- **Second normal form (2NF)**: Eliminates partial dependencies; every non-key atribute must functionally depend on the primary key.
-- **Funcional Dependency**: The primary key explicitly identifies an atribute.

## Transitioning to 2NF

-- **Step 1**: Create new entities to allocate the atributes that had a partial dependency. 

```sql
CREATE OR REPLACE TABLE manufacturers (
	manufacturer_id NUMBER(10,0) PRIMARY KEY,
	manufacturer VARCHAR(255),
	location VARCHAR(255)
);
```

```sql
CREATE OR REPLACE TABLE details (
	detail_id NUMBER (10,0) PRIMARY KEY,
	detail VARCHAR
);
```

-- **Step 2: Fill entities with data from the initially unnormalized entity.

```sql
INSERT INTO manufacturers (manufacturer_id, manufacturer, location)
SELECT DISTINCT manufacturer_id,
	manufacturer_name,
	location
FROM allproducts;
```

```sql
INSERT INTO details (detail_id, detail)
SELECT DISTINCT detail_id,
	detail_description
FROM allproducts;
```

# Introduction to 3NF

-- **Third normal form (3NF)**: Eliminates transitive dependencies; non-key atributes must directly depend on the primary key. 
-- **Transitive Dependency**: Na atribute depends on another atribute, which is not the primary key. 

## Transitioning to 3NF

-- **Step 1**: Create new entity to allocate the atributes that had a transitive dependency. 


```sql
CREATE TABLE locations(
	location_id NUMBER(10,0) PRIMARY KEY,
	location VARCHAR(255)
);
```

-- **Step 2**: Fill entities with data from the initially unnormalized entity.

```sql
INSERT INTO locations(location_id,location)
SELECT ROW_NUMBER() OVER (ORDER BY location),
	location
FROM manufacturers
GROUP BY location; 
```

```sql
ALTER TABLE
DROP COLUMN location;
```

-- **Step 3**: Create a new entity to extract from the unnormalized entity the remaining atributes.

```sql
CREATE OR REPLACE TABLE products(
	product_id NUMBER(10,0) PRIMARY KEY,
	name VARCHAR(255)
);
```

-- **Step 4**: Fill the entity with the unique values left in the unnormalized entity.

```sql
INSERT INTO products(product_id,name)
SELECT DISTINCT product_id,
	product_name
FROM allproducts;
```