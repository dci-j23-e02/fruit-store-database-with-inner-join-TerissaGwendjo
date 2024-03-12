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


