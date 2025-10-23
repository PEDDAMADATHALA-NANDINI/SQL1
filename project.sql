CREATE DATABASE ecommerce_project;
USE  ecommerce_project;

CREATE TABLE DimCustomer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    location VARCHAR(100),
    signup_date DATE
);

CREATE TABLE DimProduct (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    description TEXT
);

CREATE TABLE DimDate (
    date_id INT PRIMARY KEY,
    date DATE,
    day_of_week VARCHAR(10),
    month INT,
    quarter INT,
    year INT
);

CREATE TABLE DimRegion (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE FactSales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    product_id INT,
    customer_id INT,
    region_id INT,
    quantity_sold INT,
    sales_amount DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES DimDate(date_id),
    FOREIGN KEY (product_id) REFERENCES DimProduct(product_id),
    FOREIGN KEY (customer_id) REFERENCES DimCustomer(customer_id),
    FOREIGN KEY (region_id) REFERENCES DimRegion(region_id)
);

CREATE TABLE FactInventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    date_id INT,
    quantity_in_stock INT,
    FOREIGN KEY (product_id) REFERENCES DimProduct(product_id),
    FOREIGN KEY (date_id) REFERENCES DimDate(date_id)
);

CREATE TABLE FactCustomerReviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    date_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (product_id) REFERENCES DimProduct(product_id),
    FOREIGN KEY (customer_id) REFERENCES DimCustomer(customer_id),
    FOREIGN KEY (date_id) REFERENCES DimDate(date_id)
);

 -- INSERTING THE VALUES --
 
INSERT INTO DimCustomer (customer_name, email, gender, age, location, signup_date) VALUES
('Nandini', 'nandini1@example.com', 'Female', 22, 'Hyderabad', '2024-01-15'),
('Manoj kumar', 'mannu9@example.com', 'Male', 30, 'Bangalore', '2023-12-20'),
('Priya Sharma', 'priya1@example.com', 'Female', 28, 'Delhi', '2024-03-05'),
('Arjun Singh', 'arjun1@example.com', 'Male', 32, 'Mumbai', '2024-02-10'),
('Sneha Reddy', 'sneha1@example.com', 'Female', 27, 'Chennai', '2023-11-12'),
('Vikram Patel', 'vikram1@example.com', 'Male', 35, 'Ahmedabad', '2024-01-25'),
('Anita Joshi', 'anita1@example.com', 'Female', 29, 'Pune', '2024-03-18'),
('Karan Mehta', 'karan1@example.com', 'Male', 26, 'Kolkata', '2024-02-22'),
('Isha Verma', 'isha1@example.com', 'Female', 31, 'Noida', '2023-12-30'),
('Rahul Gupta', 'rahul1@example.com', 'Male', 28, 'Lucknow', '2024-01-05'),
('Manish Sharma', 'manish1@example.com', 'Male', 33, 'Jaipur', '2024-03-01'),
('Deepa Nair', 'deepa1@example.com', 'Female', 25, 'Kochi', '2023-11-20'),
('Ramesh Rao', 'ramesh1@example.com', 'Male', 40, 'Hyderabad', '2024-01-18'),
('Pooja Singh', 'pooja1@example.com', 'Female', 27, 'Delhi', '2024-02-05'),
('Suresh Kumar', 'suresh1@example.com', 'Male', 34, 'Chennai', '2024-03-10'),
('Tanya Sharma', 'tanya1@example.com', 'Female', 26, 'Bangalore', '2024-01-12'),
('Anil Verma', 'anil1@example.com', 'Male', 31, 'Mumbai', '2023-12-28'),
('Neha Joshi', 'neha1@example.com', 'Female', 29, 'Pune', '2024-02-15'),
('Amit Mehta', 'amit1@example.com', 'Male', 28, 'Ahmedabad', '2024-03-02'),
('Divya Reddy', 'divya1@example.com', 'Female', 24, 'Hyderabad', '2024-01-08'),
('Rajesh Kumar', 'rajesh1@example.com', 'Male', 32, 'Bangalore', '2024-02-25'),
('Sneha Sharma', 'sneha2@example.com', 'Female', 27, 'Delhi', '2024-01-22'),
('Vikram Singh', 'vikram2@example.com', 'Male', 36, 'Chennai', '2024-03-12'),
('Anita Patel', 'anita2@example.com', 'Female', 30, 'Pune', '2024-01-18'),
('Karan Rao', 'karan2@example.com', 'Male', 29, 'Mumbai', '2024-02-02'),
('Isha Mehta', 'isha2@example.com', 'Female', 31, 'Ahmedabad', '2024-03-08'),
('Rahul Sharma', 'rahul2@example.com', 'Male', 27, 'Bangalore', '2024-01-25'),
('Manish Verma', 'manish2@example.com', 'Male', 34, 'Delhi', '2024-02-15'),
('Deepa Joshi', 'deepa2@example.com', 'Female', 25, 'Pune', '2024-03-05'),
('Ramesh Singh', 'ramesh2@example.com', 'Male', 40, 'Hyderabad', '2024-01-30'),
('Pooja Patel', 'pooja2@example.com', 'Female', 28, 'Chennai', '2024-02-10'),
('Suresh Mehta', 'suresh2@example.com', 'Male', 33, 'Mumbai', '2024-03-12'),
('Tanya Rao', 'tanya2@example.com', 'Female', 26, 'Ahmedabad', '2024-01-15'),
('Anil Sharma', 'anil2@example.com', 'Male', 31, 'Bangalore', '2024-02-20'),
('Neha Singh', 'neha2@example.com', 'Female', 29, 'Delhi', '2024-03-01'),
('Amit Patel', 'amit2@example.com', 'Male', 28, 'Pune', '2024-01-18'),
('Divya Mehta', 'divya2@example.com', 'Female', 24, 'Mumbai', '2024-02-05'),
('Rajesh Rao', 'rajesh2@example.com', 'Male', 32, 'Ahmedabad', '2024-03-08'),
('Sneha Verma', 'sneha3@example.com', 'Female', 27, 'Bangalore', '2024-01-12'),
('Vikram Joshi', 'vikram3@example.com', 'Male', 36, 'Delhi', '2024-02-28'),
('Anita Sharma', 'anita3@example.com', 'Female', 30, 'Chennai', '2024-03-10'),
('Karan Singh', 'karan3@example.com', 'Male', 29, 'Pune', '2024-01-25'),
('Isha Patel', 'isha3@example.com', 'Female', 31, 'Mumbai', '2024-02-18'),
('Rahul Mehta', 'rahul3@example.com', 'Male', 27, 'Ahmedabad', '2024-03-05'),
('Manish Sharma', 'manish3@example.com', 'Male', 34, 'Bangalore', '2024-01-10'),
('Deepa Rao', 'deepa3@example.com', 'Female', 25, 'Delhi', '2024-02-22'),
('Ramesh Patel', 'ramesh3@example.com', 'Male', 40, 'Chennai', '2024-03-01'),
('Pooja Verma', 'pooja3@example.com', 'Female', 28, 'Pune', '2024-01-18'),
('Suresh Joshi', 'suresh3@example.com', 'Male', 33, 'Mumbai', '2024-02-12'),
('Tanya Mehta', 'tanya3@example.com', 'Female', 26, 'Ahmedabad', '2024-03-08'),
('Anil Patel', 'anil3@example.com', 'Male', 31, 'Bangalore', '2024-01-22');

SELECT * FROM DimCustomer;

INSERT INTO DimProduct (product_name, category, brand, price, description) VALUES
('Smartphone X1', 'Electronics', 'Samsung', 19999.99, '5G smartphone with 128GB storage'),
('Smartphone X2', 'Electronics', 'Apple', 69999.00, 'Latest iPhone model with Face ID'),
('Laptop Pro 13', 'Electronics', 'Dell', 55999.00, '13-inch laptop with 16GB RAM'),
('Laptop Pro 15', 'Electronics', 'HP', 64999.50, '15-inch laptop with 512GB SSD'),
('Wireless Earbuds A', 'Accessories', 'Sony', 2999.50, 'Noise cancelling Bluetooth earbuds'),
('Wireless Earbuds B', 'Accessories', 'JBL', 1999.99, 'Waterproof earbuds with bass boost'),
('Smartwatch S1', 'Wearables', 'Apple', 12999.00, 'Fitness tracking smartwatch'),
('Smartwatch S2', 'Wearables', 'Samsung', 9999.50, 'Smartwatch with heart rate monitor'),
('Tablet T1', 'Electronics', 'Samsung', 15999.99, '10-inch tablet with stylus support'),
('Tablet T2', 'Electronics', 'Apple', 45999.00, 'iPad with Retina display'),
('Gaming Console G1', 'Electronics', 'Sony', 34999.99, 'Next-gen gaming console'),
('Gaming Console G2', 'Electronics', 'Microsoft', 39999.50, 'Xbox series X console'),
('Camera C1', 'Photography', 'Canon', 25999.00, 'DSLR camera with 18-55mm lens'),
('Camera C2', 'Photography', 'Nikon', 27999.50, 'DSLR camera with 24-70mm lens'),
('DSLR Lens L1', 'Photography', 'Canon', 14999.00, 'Zoom lens 70-200mm'),
('DSLR Lens L2', 'Photography', 'Nikon', 16999.50, 'Prime lens 50mm f/1.8'),
('Headphones H1', 'Accessories', 'Sony', 4999.99, 'Over-ear noise cancelling headphones'),
('Headphones H2', 'Accessories', 'Bose', 8999.50, 'Wireless over-ear headphones'),
('Router R1', 'Electronics', 'TP-Link', 1999.99, 'WiFi router with dual band'),
('Router R2', 'Electronics', 'Netgear', 2999.50, 'High-speed router with parental control'),
('Keyboard K1', 'Accessories', 'Logitech', 999.50, 'Mechanical keyboard with RGB'),
('Keyboard K2', 'Accessories', 'Dell', 1299.99, 'Wireless keyboard'),
('Mouse M1', 'Accessories', 'Logitech', 499.99, 'Wireless optical mouse'),
('Mouse M2', 'Accessories', 'HP', 599.50, 'Gaming mouse'),
('Monitor M1', 'Electronics', 'Samsung', 10999.00, '27-inch curved monitor'),
('Monitor M2', 'Electronics', 'LG', 12999.50, '24-inch IPS monitor'),
('Projector P1', 'Electronics', 'Epson', 39999.99, '4K home theater projector'),
('Projector P2', 'Electronics', 'BenQ', 35999.50, 'Full HD projector for presentations'),
('TV T1', 'Electronics', 'Samsung', 49999.00, '55-inch QLED Smart TV'),
('TV T2', 'Electronics', 'LG', 45999.50, '50-inch OLED TV'),
('Fridge F1', 'Home Appliances', 'LG', 35999.99, 'Double door fridge with inverter'),
('Fridge F2', 'Home Appliances', 'Samsung', 37999.50, 'Frost-free fridge with smart features'),
('Washing Machine W1', 'Home Appliances', 'Bosch', 24999.00, 'Front load washing machine'),
('Washing Machine W2', 'Home Appliances', 'IFB', 26999.50, 'Top load washing machine'),
('Microwave MW1', 'Home Appliances', 'Samsung', 8999.00, 'Convection microwave oven'),
('Microwave MW2', 'Home Appliances', 'LG', 7999.50, 'Solo microwave oven'),
('Air Purifier A1', 'Home Appliances', 'Philips', 12999.00, 'HEPA filter air purifier'),
('Air Purifier A2', 'Home Appliances', 'Mi', 8999.50, 'Smart air purifier'),
('Coffee Maker C1', 'Home Appliances', 'Nescafe', 2999.00, 'Automatic coffee maker'),
('Coffee Maker C2', 'Home Appliances', 'Philips', 3499.50, 'Drip coffee maker'),
('Fitness Band F1', 'Wearables', 'Mi', 1999.99, 'Fitness tracker with step counter'),
('Fitness Band F2', 'Wearables', 'Realme', 1499.50, 'Smart fitness band'),
('Blender B1', 'Home Appliances', 'Philips', 2999.99, 'Mixer grinder with jar set'),
('Blender B2', 'Home Appliances', 'Bajaj', 1999.50, 'Hand blender'),
('Speaker S1', 'Accessories', 'JBL', 2499.99, 'Portable Bluetooth speaker'),
('Speaker S2', 'Accessories', 'Sony', 3499.50, 'Waterproof Bluetooth speaker'),
('Power Bank P1', 'Accessories', 'Mi', 999.99, '10000mAh portable charger'),
('Power Bank P2', 'Accessories', 'Samsung', 1499.50, '20000mAh portable charger'),
('Camera Bag CB1', 'Photography', 'Canon', 1999.00, 'DSLR backpack'),
('Camera Bag CB2', 'Photography', 'Nikon', 2499.50, 'Camera sling bag'),
('Tripod T1', 'Photography', 'Manfrotto', 4999.00, 'Camera tripod 150cm');

INSERT INTO DimDate (date_id, date, day_of_week, month, quarter, year) VALUES
(1,'2025-01-01','Wednesday',1,1,2025),
(2,'2025-01-02','Thursday',1,1,2025),
(3,'2025-01-03','Friday',1,1,2025),
(4,'2025-01-04','Saturday',1,1,2025),
(5,'2025-01-05','Sunday',1,1,2025),
(6,'2025-01-06','Monday',1,1,2025),
(7,'2025-01-07','Tuesday',1,1,2025),
(8,'2025-01-08','Wednesday',1,1,2025),
(9,'2025-01-09','Thursday',1,1,2025),
(10,'2025-01-10','Friday',1,1,2025),
(11,'2025-01-11','Saturday',1,1,2025),
(12,'2025-01-12','Sunday',1,1,2025),
(13,'2025-01-13','Monday',1,1,2025),
(14,'2025-01-14','Tuesday',1,1,2025),
(15,'2025-01-15','Wednesday',1,1,2025),
(16,'2025-01-16','Thursday',1,1,2025),
(17,'2025-01-17','Friday',1,1,2025),
(18,'2025-01-18','Saturday',1,1,2025),
(19,'2025-01-19','Sunday',1,1,2025),
(20,'2025-01-20','Monday',1,1,2025),
(21,'2025-01-21','Tuesday',1,1,2025),
(22,'2025-01-22','Wednesday',1,1,2025),
(23,'2025-01-23','Thursday',1,1,2025),
(24,'2025-01-24','Friday',1,1,2025),
(25,'2025-01-25','Saturday',1,1,2025),
(26,'2025-01-26','Sunday',1,1,2025),
(27,'2025-01-27','Monday',1,1,2025),
(28,'2025-01-28','Tuesday',1,1,2025),
(29,'2025-01-29','Wednesday',1,1,2025),
(30,'2025-01-30','Thursday',1,1,2025),
(31,'2025-01-31','Friday',1,1,2025),
(32,'2025-02-01','Saturday',2,1,2025),
(33,'2025-02-02','Sunday',2,1,2025),
(34,'2025-02-03','Monday',2,1,2025),
(35,'2025-02-04','Tuesday',2,1,2025),
(36,'2025-02-05','Wednesday',2,1,2025),
(37,'2025-02-06','Thursday',2,1,2025),
(38,'2025-02-07','Friday',2,1,2025),
(39,'2025-02-08','Saturday',2,1,2025),
(40,'2025-02-09','Sunday',2,1,2025),
(41,'2025-02-10','Monday',2,1,2025),
(42,'2025-02-11','Tuesday',2,1,2025),
(43,'2025-02-12','Wednesday',2,1,2025),
(44,'2025-02-13','Thursday',2,1,2025),
(45,'2025-02-14','Friday',2,1,2025),
(46,'2025-02-15','Saturday',2,1,2025),
(47,'2025-02-16','Sunday',2,1,2025),
(48,'2025-02-17','Monday',2,1,2025),
(49,'2025-02-18','Tuesday',2,1,2025),
(50,'2025-02-19','Wednesday',2,1,2025),
(51,'2025-02-20','Thursday',2,1,2025),
(52,'2025-02-21','Friday',2,1,2025),
(53,'2025-02-22','Saturday',2,1,2025),
(54,'2025-02-23','Sunday',2,1,2025),
(55,'2025-02-24','Monday',2,1,2025),
(56,'2025-02-25','Tuesday',2,1,2025),
(57,'2025-02-26','Wednesday',2,1,2025),
(58,'2025-02-27','Thursday',2,1,2025),
(59,'2025-02-28','Friday',2,1,2025),
(60,'2025-03-01','Saturday',3,1,2025),
(61,'2025-03-02','Sunday',3,1,2025),
(62,'2025-03-03','Monday',3,1,2025),
(63,'2025-03-04','Tuesday',3,1,2025),
(64,'2025-03-05','Wednesday',3,1,2025),
(65,'2025-03-06','Thursday',3,1,2025),
(66,'2025-03-07','Friday',3,1,2025),
(67,'2025-03-08','Saturday',3,1,2025),
(68,'2025-03-09','Sunday',3,1,2025),
(69,'2025-03-10','Monday',3,1,2025),
(70,'2025-03-11','Tuesday',3,1,2025),
(71,'2025-03-12','Wednesday',3,1,2025),
(72,'2025-03-13','Thursday',3,1,2025),
(73,'2025-03-14','Friday',3,1,2025),
(74,'2025-03-15','Saturday',3,1,2025),
(75,'2025-03-16','Sunday',3,1,2025),
(76,'2025-03-17','Monday',3,1,2025),
(77,'2025-03-18','Tuesday',3,1,2025),
(78,'2025-03-19','Wednesday',3,1,2025),
(79,'2025-03-20','Thursday',3,1,2025),
(80,'2025-03-21','Friday',3,1,2025),
(81,'2025-03-22','Saturday',3,1,2025),
(82,'2025-03-23','Sunday',3,1,2025),
(83,'2025-03-24','Monday',3,1,2025),
(84,'2025-03-25','Tuesday',3,1,2025),
(85,'2025-03-26','Wednesday',3,1,2025),
(86,'2025-03-27','Thursday',3,1,2025),
(87,'2025-03-28','Friday',3,1,2025),
(88,'2025-03-29','Saturday',3,1,2025),
(89,'2025-03-30','Sunday',3,1,2025),
(90,'2025-03-31','Monday',3,1,2025),
(91,'2025-04-01','Tuesday',4,2,2025),
(92,'2025-04-02','Wednesday',4,2,2025),
(93,'2025-04-03','Thursday',4,2,2025),
(94,'2025-04-04','Friday',4,2,2025),
(95,'2025-04-05','Saturday',4,2,2025),
(96,'2025-04-06','Sunday',4,2,2025),
(97,'2025-04-07','Monday',4,2,2025),
(98,'2025-04-08','Tuesday',4,2,2025),
(99,'2025-04-09','Wednesday',4,2,2025),
(100,'2025-04-10','Thursday',4,2,2025);




INSERT INTO DimRegion (region_name, country) VALUES
('North ','India'),
('South ','India'),
('West ','India'),
('East ','India'),
('Central','India'),
('Delhi NCR','India'),
('Mumbai Metro','India'),
('Kolkata Metro','India'),
('Bangalore Metro','India'),
('Chennai Metro','India');

INSERT INTO FactSales (date_id, product_id, customer_id, region_id, quantity_sold, sales_amount) VALUES
(1,1,1,1,1,19999.99),(2,2,2,2,2,139998.00),(3,3,3,3,1,55999.00),
(4,4,4,4,3,194998.50),(5,5,5,5,2,5999.00),(6,6,6,6,1,1999.99),
(7,7,7,7,1,12999.00),(8,8,8,8,2,19999.00),(9,9,9,9,1,15999.99),
(10,10,10,10,1,45999.00),(11,11,11,1,1,34999.99),(12,12,12,2,1,39999.50),
(13,13,13,3,2,51998.00),(14,14,14,4,1,16999.50),(15,15,15,5,1,14999.00),
(16,16,16,6,2,9999.98),(17,17,17,7,1,4999.99),(18,18,18,8,3,26998.50),
(19,19,19,9,1,1999.99),(20,20,20,10,2,2599.00),(21,21,21,1,1,999.50),
(22,22,22,2,1,1299.99),(23,23,23,3,2,999.98),(24,24,24,4,1,10999.00),
(25,25,25,5,1,12999.50),(26,26,26,6,1,39999.99),(27,27,27,7,2,71999.00),
(28,28,28,8,1,35999.50),(29,29,29,9,1,49999.00),(30,30,30,10,1,45999.50),
(31,31,31,1,1,35999.99),(32,32,32,2,2,53999.00),(33,33,33,3,1,24999.00),
(34,34,34,4,1,26999.50),(35,35,35,5,1,8999.00),(36,36,36,6,1,7999.50),
(37,37,37,7,2,25998.00),(38,38,38,8,1,8999.50),(39,39,39,9,1,2999.00),
(40,40,40,10,1,3499.50),(41,41,41,1,2,3999.98),(42,42,42,2,1,1499.50),
(43,43,43,3,1,2999.99),(44,44,44,4,1,1999.50),(45,45,45,5,2,4999.98),
(46,46,46,6,1,1099.99),(47,47,47,7,1,1199.50),(48,48,48,8,1,849.50),
(49,49,49,9,2,9998.00),(50,50,50,10,1,4999.00),(51,1,2,3,1,19999.99),(52,2,3,4,2,139998.00),(53,3,4,5,1,55999.00),
(54,4,5,6,3,194998.50),(55,5,6,7,2,5999.00),(56,6,7,8,1,1999.99),
(57,7,8,9,1,12999.00),(58,8,9,10,2,19999.00),(59,9,10,1,1,15999.99),
(60,10,1,2,1,45999.00),(61,11,2,3,1,34999.99),(62,12,3,4,1,39999.50),
(63,13,4,5,2,51998.00),(64,14,5,6,1,16999.50),(65,15,6,7,1,14999.00),
(66,16,7,8,2,9999.98),(67,17,8,9,1,4999.99),(68,18,9,10,3,26998.50),
(69,19,10,1,1,1999.99),(70,20,1,2,2,2599.00),(71,21,2,3,1,999.50),
(72,22,3,4,1,1299.99),(73,23,4,5,2,999.98),(74,24,5,6,1,10999.00),
(75,25,6,7,1,12999.50),(76,26,7,8,1,39999.99),(77,27,8,9,2,71999.00),
(78,28,9,10,1,35999.50),(79,29,10,1,1,49999.00),(80,30,1,2,1,45999.50),
(81,31,2,3,1,35999.99),(82,32,3,4,2,53999.00),(83,33,4,5,1,24999.00),
(84,34,5,6,1,26999.50),(85,35,6,7,1,8999.00),(86,36,7,8,1,7999.50),
(87,37,8,9,2,25998.00),(88,38,9,10,1,8999.50),(89,39,10,1,1,2999.00),
(90,40,1,2,1,3499.50),(91,41,2,3,2,3999.98),(92,42,3,4,1,1499.50),
(93,43,4,5,1,2999.99),(94,44,5,6,1,1999.50),(95,45,6,7,2,4999.98),
(96,46,7,8,1,1099.99),(97,47,8,9,1,1199.50),(98,48,9,10,1,849.50),
(99,49,10,1,2,9998.00),(100,50,1,2,1,4999.00);



INSERT INTO FactInventory (product_id, date_id, quantity_in_stock) VALUES
(1,1,50),(2,1,30),(3,1,40),(4,1,25),(5,1,100),
(6,1,80),(7,1,60),(8,1,55),(9,1,70),(10,1,35),
(11,1,20),(12,1,25),(13,1,15),(14,1,20),(15,1,40),
(16,1,30),(17,1,50),(18,1,60),(19,1,45),(20,1,35),
(21,1,25),(22,1,30),(23,1,20),(24,1,25),(25,1,15),
(26,1,10),(27,1,5),(28,1,8),(29,1,12),(30,1,18),
(31,1,22),(32,1,25),(33,1,30),(34,1,28),(35,1,15),
(36,1,20),(37,1,35),(38,1,30),(39,1,25),(40,1,20),
(41,1,15),(42,1,10),(43,1,12),(44,1,8),(45,1,5),
(46,1,10),(47,1,12),(48,1,8),(49,1,5),(50,1,10);

INSERT INTO FactCustomerReviews (product_id, customer_id, date_id, rating, review_text) VALUES
(1,1,1,5,'Excellent smartphone, very fast'),
(2,2,2,4,'Good quality, a bit expensive'),
(3,3,3,5,'Highly recommend this laptop'),
(4,4,4,3,'Average performance, okay for daily use'),
(5,5,5,4,'Good earbuds for the price'),
(6,6,6,5,'Perfect sound quality'),
(7,7,7,4,'Useful smartwatch for fitness'),
(8,8,8,3,'Battery life could be better'),
(9,9,9,5,'Great tablet for drawing and work'),
(10,10,10,4,'iPad works smoothly'),
(11,11,11,5,'Amazing gaming console'),
(12,12,12,4,'Very good console, minor lag'),
(13,13,13,3,'Camera works okay, lens quality average'),
(14,14,14,5,'Excellent DSLR, perfect shots'),
(15,15,15,4,'Lens works well, very clear images'),
(16,16,16,5,'Headphones are super comfy'),
(17,17,17,4,'Good quality, little heavy'),
(18,18,18,3,'Router coverage is okay'),
(19,19,19,4,'Keyboard is smooth to type'),
(20,20,20,5,'Mouse is very responsive'),
(21,21,21,4,'Monitor quality is good'),
(22,22,22,5,'Projector image clarity excellent'),
(23,23,23,3,'TV works fine'),
(24,24,24,4,'Fridge cooling perfect'),
(25,25,25,5,'Washing machine performs well'),
(26,26,26,4,'Microwave is handy'),
(27,27,27,5,'Air purifier works excellently'),
(28,28,28,3,'Coffee maker is average'),
(29,29,29,4,'Fitness band useful'),
(30,30,30,5,'Blender works very well'),
(31,31,31,4,'Speaker sound is amazing'),
(32,32,32,5,'Power bank charges quickly'),
(33,33,33,4,'Camera bag very durable'),
(34,34,34,5,'Tripod is stable');

-- sql indexing --
CREATE INDEX idx_sales_date ON FactSales(date_id);
CREATE INDEX idx_sales_product ON FactSales(product_id);
CREATE INDEX idx_inventory_product ON FactInventory(product_id);
CREATE INDEX idx_review_product ON FactCustomerReviews(product_id);

--  triggering --
DELIMITER //

CREATE TRIGGER trg_update_inventory
AFTER INSERT ON FactSales
FOR EACH ROW
BEGIN
    UPDATE FactInventory
    SET quantity_in_stock = quantity_in_stock - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- created stored procedure --
DELIMITER //

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
END //

DELIMITER ;

-- creating views -- 
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

-- Total revenue per month:--
CALL sp_monthly_revenue();

-- top selling products --
SELECT dp.product_name, SUM(fs.sales_amount) AS total_sales
FROM FactSales fs
JOIN DimProduct dp ON fs.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY total_sales DESC
LIMIT 5; 

-- average rating per product --
SELECT dp.product_name, AVG(fr.rating) AS avg_rating
FROM FactCustomerReviews fr
JOIN DimProduct dp ON fr.product_id = dp.product_id
GROUP BY dp.product_name;  


 
 
  
  
 



