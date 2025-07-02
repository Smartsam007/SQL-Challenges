 🗂️ SQL Order Management System: Data Model & Business Insights

This repository contains a complete SQL-based Order Management System, including:

* A relational data model (schema creation)
* A sample data for Customers, Suppliers, Products, Orders, and Order Items
* A collection of **business analysis SQL queries** designed to extract key insights

---

📊 Schema Overview

The database model simulates a basic commerce structure and consists of the following tables:

* `Customer`: Customer details including name, city, country, and contact
* `Supplier`: Product suppliers from multiple countries
* `Product`: Product catalog with packaging, prices, and availability
* `"Order"`: Customer orders (note: table name quoted due to reserved keyword)
* `OrderItem`: Line items for each order linking to products

The tables are linked via foreign keys to reflect real-world relationships like:

* Customers place Orders
* Orders contain OrderItems
* Products are supplied by Suppliers

---

🧪 Sample Data

The dataset includes realistic data entries across Europe, North/South America, and Asia. It covers various industries including beverages, food items, and specialty products. The data is suitable for testing analytical queries and visualizing regional sales patterns.

---

📊 Business Questions & Queries

This project addresses **20 real-world business questions** using T-SQL, such as:

* Which suppliers are based in the UK?
* What are the top-spending customers?
* How many products does each supplier offer?
* Which products are packaged in jars?
* What is the total revenue generated within a specific time frame?

Each query has been carefully crafted for performance, readability, and business value.

---

📁 Contents

* `sample-model.sql` – Schema creation script (with foreign keys and indexes)
* `sample-data.sql` – Insert script for sample records
* `business-queries.sql` – 20 SQL queries answering key business questions

---

🚀 How to Use

1. Run `sample-model.sql` to create the schema
2. Load the data using `sample-data.sql`
3. Run or adapt the queries in `business-queries.sql` using SQL Server

---

🎯 Learning Objectives

This project is ideal for:

* Practicing SQL joins, aggregate functions, and case statements
* Understanding foreign key relationships in a normalized schema
* Developing SQL skills for data analysis and business reporting
