### Assignment: Fruit Store Database with INNER JOIN

#### Overview

In this assignment, you will create a database for a Fruit Store that sells fruits from different brands. You will design a database schema consisting of four tables: `fruits`, `brands`, `categories`, and `stock`. The focus of this assignment is to practice creating tables, inserting values, and using the `INNER JOIN` SQL command to retrieve data that exists across multiple tables.

#### Objectives

1. **Create the Database**: Create a PostgreSQL database named `fruit_store`.
2. **Design and Create Tables**: Design and create four tables (`fruits`, `brands`, `categories`, and `stock`) with specified columns and relationships.
3. **Insert Data**: Populate the tables with sample data.
4. **Query Data with INNER JOIN**: Write SQL queries using `INNER JOIN` to retrieve combined data from the tables.

#### Tasks

1. **Create the Database**

   - Create a PostgreSQL database named `fruit_store`.

2. **Design and Create Tables**

   - **`brands` Table**: Stores information about fruit brands.
     - Columns: `brand_id` (Primary Key), `brand_name`.
   
   - **`categories` Table**: Stores categories of fruits.
     - Columns: `category_id` (Primary Key), `category_name`.
   
   - **`fruits` Table**: Stores information about fruits.
     - Columns: `fruit_id` (Primary Key), `fruit_name`, `brand_id` (Foreign Key), `category_id` (Foreign Key).
   
   - **`stock` Table**: Stores stock information for fruits.
     - Columns: `stock_id` (Primary Key), `fruit_id` (Foreign Key), `quantity`.
   
   - Ensure to define the appropriate data types for each column and establish the foreign key relationships.

3. **Insert Data**

   - Populate the `brands` table with at least 3 different fruit brands.
   - Populate the `categories` table with at least 3 different fruit categories.
   - Populate the `fruits` table with at least 5 fruits, ensuring some fruits belong to the same brand and category.
   - Populate the `stock` table with stock information for each fruit.

4. **Query Data with INNER JOIN**

   - Write an SQL query to list all fruits with their brand names and categories.
   - Write an SQL query to list all fruits with their stock quantities, including the fruit name, brand, and category.
   - Write an SQL query to list fruits from a specific brand and their stock quantities.

#### Deliverables

1. SQL script file containing all the commands used to create the database, tables, and insert data.
2. SQL script file containing the queries for the INNER JOIN operations.
3. A brief report explaining your schema design, the relationships between tables, and the rationale behind your `INNER JOIN` queries.

#### Keep Eyes on below Criteria

- Correctness of SQL syntax.
- Proper use of primary and foreign keys to establish relationships between tables.
- Effective use of `INNER JOIN` to retrieve and display combined data from multiple tables.
- Clarity and organization of the report.



This assignment will help you understand how to design relational databases, populate them with data, and use `INNER JOIN` to query related data across multiple tables. 
Good luck!
