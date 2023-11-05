------------------------------------------------
-- Insert data city
COPY city(city_id, city, lonlat)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\tablecity.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM city;
-- TRUNCATE TABLE 
-- 	city
-- RESTART IDENTITY
-- CASCADE;

-- Insert data car_types
COPY car_types(car_type_id, car_types)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\car_types.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM car_types;


-- Insert data body_types
COPY body_types(body_type_id, body_types)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\body_types.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM body_types;

------------------------------------------------
-- Insert data sellers
COPY sellers(user_id, first_name, last_name, phone, city_id, email)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\sellers.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM sellers;


-- Insert data buyers
COPY buyers(user_id, first_name, last_name, phone, city_id, email)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\buyers.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM buyers;

------------------------------------------------
-- Insert data products
COPY products(product_id, seller_id, brand, model, year, price, car_type_id, body_type_id, kilometer, date_post)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\product_table_rev.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM products;

------------------------------------------------
-- Insert data bid_logs
COPY bid_logs(bid_id, buyer_id, product_id, date_bid, bid_price)
FROM 'D:\Data Engineering\2 SQL & Database\2 Projects\final_dataset_project2\bid_logs.csv'
DELIMITER ','
CSV
HEADER;

-- cek
SELECT * FROM bid_logs;

