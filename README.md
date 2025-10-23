# SQL1
# 🛍️ E-Commerce Data Warehouse (SQL Project)

## 📘 Project Overview
This project demonstrates the design and implementation of a **Data Warehouse** for an e-commerce business using SQL.

It focuses on analyzing **sales, customers, products, regions, and reviews** to generate valuable business insights such as:
- Monthly revenue trends
- Top-performing products
- Customer satisfaction ratings
- Regional sales performance

---

## 🧱 Schema Design
The data model follows a **Star Schema** structure, ideal for analytical queries and reporting.

### 🟩 Dimension Tables
- **DimCustomer** → Stores customer details (name, age, gender, location, signup date)  
- **DimProduct** → Contains product details (name, category, brand, price, description)  
- **DimDate** → Time dimension (day, month, quarter, year)  
- **DimRegion** → Regional and country-level information  

### 🟦 Fact Tables
- **FactSales** → Records sales transactions (product, date, region, customer, sales amount, quantity)  
- **FactInventory** → Tracks inventory stock for each product and date  
- **FactCustomerReviews** → Stores product ratings and review comments from customers  

📊 *Fact tables reference dimension tables through foreign keys — enabling multi-dimensional analysis.*

---

## ⚙️ Key Database Features

### 1️⃣ Indexing
Improves query performance for large datasets:

CREATE INDEX idx_sales_date ON FactSales(date_id);
CREATE INDEX idx_sales_product ON FactSales(product_id);
CREATE INDEX idx_inventory_product ON FactInventory(product_id);
CREATE INDEX idx_review_product ON FactCustomerReviews(product_id);

2️⃣ Trigger – Inventory Auto Update

Automatically updates stock levels after each sale:

CREATE TRIGGER trg_update_inventory
AFTER INSERT ON FactSales
FOR EACH ROW
BEGIN
    UPDATE FactInventory
    SET quantity_in_stock = quantity_in_stock - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END;

3️⃣ Stored Procedure – Monthly Revenue Report

Encapsulates revenue logic for reusability:

CREATE PROCEDURE sp_monthly_revenue()
BEGIN
    SELECT 
        dd.year,
        dd.month,
        SUM(fs.sales_amount) AS total_revenue
    FROM FactSales fs
    JOIN DimDate dd ON fs.date_id = dd.date_id
    GROUP BY dd.year, dd.month
    ORDER BY dd.year, dd.month;
END;

4️⃣ View – Sales Summary by Category & Region

Creates a summarized dataset for reporting:

CREATE VIEW v_sales_summary AS
SELECT 
    dd.year,
    dd.month,
    dp.category,
    dr.region_name,
    SUM(fs.sales_amount) AS total_sales,
    SUM(fs.quantity_sold) AS total_quantity
FROM FactSales fs
JOIN DimDate dd ON fs.date_id = dd.date_id
JOIN DimProduct dp ON fs.product_id = dp.product_id
JOIN DimRegion dr ON fs.region_id = dr.region_id
GROUP BY dd.year, dd.month, dp.category, dr.region_name;

📈 Example Analytical Queries
🔹 1. Monthly Revenue
CALL sp_monthly_revenue();

🔹 2. Top 5 Selling Products
SELECT dp.product_name, SUM(fs.sales_amount) AS total_sales
FROM FactSales fs
JOIN DimProduct dp ON fs.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY total_sales DESC
LIMIT 5;

🔹 3. Average Rating per Product
SELECT dp.product_name, AVG(fr.rating) AS avg_rating
FROM FactCustomerReviews fr
JOIN DimProduct dp ON fr.product_id = dp.product_id
GROUP BY dp.product_name;



From this data warehouse:
-Identify top-performing products by sales revenue
-Track monthly revenue growth trends
-Measure customer satisfaction using average product ratings
-Evaluate regional performance for business expansion

🧰 Tools & Technologies
-MySQL / SQL Server
-Data Warehousing (Star Schema)
-Triggers, Views, Stored Procedures, Indexing
-DrawSQL.app for ER diagram design

🧩 Future Improvements
-Add Power BI or Tableau dashboard for visualization
-Introduce ETL scripts for automated data loading
-Add partitioning for large-scale data performance

👩‍💻 Author

Nandhini Peddamadathala
🎓 Marri Laxman Reddy Institute of Technology and Management
📍 Hyderabad, India

GitHub: @PEDDAMADATHALA-NANDINI
Email:nandhinipm862@gmail.com
