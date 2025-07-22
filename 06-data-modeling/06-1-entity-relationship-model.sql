-- Create new entity
CREATE OR REPLACE TABLE employee_training_details (
  	-- Assign a unique identifier for the entity
	employee_training_id NUMBER(10,0) PRIMARY KEY,
  	-- Add new attribute
    year NUMBER(4,0),
  	-- Add new attributes to reference foreign entities
  	employee_id NUMBER(38,0),
    training_id NUMBER(38,0),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (training_id) REFERENCES trainings(training_id)
);

SELECT 
	employees.employee_id, 
    trainings.avg_training_score
FROM employees
	JOIN trainings 
	ON employees.employee_id = trainings.employee_id
-- Add filter
WHERE trainings.avg_training_score > 65
LIMIT 50;

SELECT 
	employees.employee_id, 
    trainings.avg_training_score
FROM employees
	JOIN trainings 
	ON employees.employee_id = trainings.employee_id
    -- Merge new entity
	JOIN departments 
	ON employees.department_id = departments.department_id
WHERE trainings.avg_training_score > 65 AND
	-- Add extra filter
	departments.department_name = 'Operations'
LIMIT 50;
