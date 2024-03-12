-- Create the brands table
CREATE TABLE brands (
                        brand_id SERIAL PRIMARY KEY,
                        brand_name TEXT NOT NULL
);

-- Create the categories table
CREATE TABLE categories (
                            category_id SERIAL PRIMARY KEY,
                            category_name TEXT NOT NULL
);

-- Create the fruits table with foreign key constraints
CREATE TABLE fruits (
                        fruit_id SERIAL PRIMARY KEY,
                        fruit_name TEXT NOT NULL,
                        brand_id INTEGER REFERENCES brands(brand_id),
                        category_id INTEGER REFERENCES categories(category_id)
);

-- Create the stock table with foreign key constraints
CREATE TABLE stock (
                       stock_id SERIAL PRIMARY KEY,
                       fruit_id INTEGER REFERENCES fruits(fruit_id),
                       quantity INTEGER NOT NULL
);

-- Populate the brands table
INSERT INTO brands (brand_name) VALUES
                                    ('Apple Inc.'),
                                    ('Banana Co.'),
                                    ('Orange Farms');

-- Populate the categories table
INSERT INTO categories (category_name) VALUES
                                           ('Apples'),
                                           ('Bananas'),
                                           ('Citrus');

-- Populate the fruits table
INSERT INTO fruits (fruit_name, brand_id, category_id) VALUES
                                                           ('Granny Smith', 1, 1),
                                                           ('Fuji', 1, 1),
                                                           ('Cavendish', 2, 2),
                                                           ('Navel', 3, 3),
                                                           ('Valencia', 3, 3);

-- Populate the stock table
INSERT INTO stock (fruit_id, quantity) VALUES
                                           (1, 100),
                                           (2, 150),
                                           (3, 200),
                                           (4, 120),
                                           (5, 180);


-- List all fruits with their brand names and categories:
SELECT f.fruit_name, b.brand_name, c.category_name
FROM fruits f
         INNER JOIN brands b ON f.brand_id = b.brand_id
         INNER JOIN categories c ON f.category_id = c.category_id;

-- List all fruits with their stock quantities, including the fruit name, brand, and category:
SELECT f.fruit_name, b.brand_name, c.category_name, s.quantity
FROM fruits f
         INNER JOIN brands b ON f.brand_id = b.brand_id
         INNER JOIN categories c ON f.category_id = c.category_id
         INNER JOIN stock s ON f.fruit_id = s.fruit_id;

--List fruits from a specific brand and their stock quantities:
SELECT f.fruit_name, b.brand_name, c.category_name, s.quantity
FROM fruits f
         INNER JOIN brands b ON f.brand_id = b.brand_id
         INNER JOIN categories c ON f.category_id = c.category_id
         INNER JOIN stock s ON f.fruit_id = s.fruit_id
WHERE b.brand_name = 'Apple Inc.';


/*
BRIEF REPORT
Schema Design:

brands Table:

Stores information about fruit brands.
Contains columns: brand_id (Primary Key), brand_name.
categories Table:

Stores categories of fruits.
Contains columns: category_id (Primary Key), category_name.
fruits Table:

Stores information about fruits.
Contains columns: fruit_id (Primary Key), fruit_name, brand_id (Foreign Key), category_id (Foreign Key).
Establishes a many-to-one relationship with both the brands and categories tables, as one fruit belongs to one brand and one category.
stock Table:

Stores stock information for fruits.
Contains columns: stock_id (Primary Key), fruit_id (Foreign Key), quantity.
Establishes a one-to-many relationship with the fruits table, as one fruit can have multiple stock entries.
Relationships Between Tables:

The brands and categories tables are independent entities storing unique brand and category information.
The fruits table serves as a junction between brands, categories, and actual fruit information, utilizing foreign keys to establish relationships.
The stock table is linked to the fruits table through a foreign key, maintaining a record of the available stock quantities for each fruit.
Rationale Behind INNER JOIN Queries:

List all fruits with their brand names and categories:
This query combines data from the fruits, brands, and categories tables to provide comprehensive information about each fruit, including its brand name and category. It utilizes INNER JOINs on the brand_id and category_id columns to match corresponding records across tables.

List all fruits with their stock quantities, including the fruit name, brand, and category:
This query extends the previous query by including stock quantities for each fruit. It performs INNER JOINs with the stock table on the fruit_id column to retrieve stock information for each fruit.

List fruits from a specific brand and their stock quantities:
This query filters fruits based on a specific brand name and retrieves their corresponding stock quantities. It uses INNER JOINs on the brand_id column to match fruits with the desired brand, and then INNER JOINs with the stock table to fetch stock quantities.

Overall:
The schema design facilitates efficient storage and retrieval of information about fruits, including their brands, categories, and stock quantities. The INNER JOIN queries leverage the relationships between tables to generate meaningful reports that provide insights into fruit data while maintaining data integrity through foreign key constraints.
*/