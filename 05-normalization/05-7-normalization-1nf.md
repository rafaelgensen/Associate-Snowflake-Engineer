# Normalization

## Unnormalized Data

- **Data Redundancy**: Unnecessary repetition of data.  
- **Data Anomalies**: Irregularities or inconsistencies in the data.

## The Process of Data Normalization

**Data Normalization**: Multi-step process of structuring data to minimize duplication and dependencies.

- **1NF**: Eliminates multiple values in one data item. Ensures each column in an entity holds unique atomic values.
- **2NF**: Eliminates partial dependencies.
- **3NF**: Eliminates transitive dependencies.

---

## Functions

### TRIM  
Removes empty spaces from the start and end of values.

```sql
SELECT TRIM(category)
FROM allproducts;
```

- **LATERAL & FLATTEN**: Treat list of values like a table with individual items

- **SPLIT**: Separetes values based on a delimiter

```sql
SELECT TRIM(f.value)
FROM allproducts,
LATERAL FLATTEN(INPUT => SPLIT(allproducts.category, ',')) f;
```

## Applying 1NF

-- **Step 1**: Create a new entity to transfer the UNF atribute values

```sql
CREATE OR REPLACE TABLE categories (
	category_id NUMBER(10,0) PRIMARY KEY,
	category VARCHAR(255)
);
```

-- **Step 2.1**: Fill new entity with data from the initially unnormalized entity.
INSERT INTO: SQL command to insert new rows into a table.

```sql
INSERT INTO categories (category_id, category)
___;
```

-- **Step 2.2**: Select the data from allproducts, the initially unnormalized entity.

```sql
INSERT INTO categories (category_id, category)
SELECT
    ___,
    ___
FROM allproducts___;
```

-- **Step 2.3**: Use function to split values within a specific attribute

```sql
INSERT INTO categories (category_id, category)
SELECT
    ___,
    TRIM(f.value)
FROM allproducts,
LATERAL FLATTEN(INPUT => SPLIT(allproducts.category, ',')) f;
```

-- **Step 2.4**: Select the row number to define a unique identifier

```sql
INSERT INTO categories (category_id, category)
SELECT
    ROW_NUMBER() OVER (ORDER BY TRIM(f.value)),
    TRIM(f.value)
FROM allproducts,
LATERAL FLATTEN(INPUT => SPLIT(allproducts.category, ',')) f;
```

-- **Step 2.5**: Aggregate the data to generate unique category values

```sql
-- Fill a entity with data from a query result
INSERT INTO categories (category_id, category)
SELECT
    -- Generate a unique value using the row number
    ROW_NUMBER() OVER (ORDER BY TRIM(f.value)),
    TRIM(f.value)
FROM allproducts,
-- Split a text attribute value based on a delimiter
LATERAL FLATTEN(INPUT => SPLIT(allproducts.category, ',')) f
-- Aggregate the data to ensure uniqueness of values
GROUP BY (TRIM(f.value));
```
