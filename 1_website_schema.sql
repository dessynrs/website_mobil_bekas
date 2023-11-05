------------------------------------------------

-- 1. tabel city
CREATE TABLE city(
	city_id integer PRIMARY KEY,
	city VARCHAR(100),
	lonlat POINT
);

------------------------------------------------
-- 2. tabel sellers
CREATE TABLE sellers(
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(20),
	city_id INT,
	email VARCHAR(100)
);

-- 3. tabel buyers
CREATE TABLE buyers(
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(20),
	city_id INT,
	email VARCHAR(100)
);

ALTER TABLE sellers
ADD CONSTRAINT seller_city
	FOREIGN KEY(city_id) REFERENCES city(city_id);
	
ALTER TABLE buyers
ADD CONSTRAINT buyer_city
	FOREIGN KEY(city_id) REFERENCES city(city_id);	
------------------------------------------------
-- 4. tabel car_types
CREATE TABLE car_types(
	car_type_id SERIAL PRIMARY KEY,
	car_types VARCHAR(100)
);

ALTER TABLE car_types
RENAME COLUMN car_types TO car_type;

-- 5. tabel body_types
CREATE TABLE body_types(
	body_type_id SERIAL PRIMARY KEY,
	body_types VARCHAR(100)
);

ALTER TABLE body_types
RENAME COLUMN body_types TO body_type;

------------------------------------------------
-- 6. tabel products
CREATE TABLE products(
	product_id INT PRIMARY KEY,
	seller_id INT NOT NULL,
	brand VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	year INT NOT NULL,
	price INT NOT NULL,
	car_type_id INT NOT NULL,
	body_type_id INT NOT NULL,
	kilometer INT,
	date_post DATE NOT NULL,
	FOREIGN KEY(seller_id)
		REFERENCES sellers(user_id),
	FOREIGN KEY(car_type_id)
		REFERENCES car_types(car_type_id),
	FOREIGN KEY(body_type_id)
		REFERENCES body_types(body_type_id)
);

ALTER TABLE products
ADD CONSTRAINT price
	CHECK(price > 0);
------------------------------------------------
-- 7. tabel bid_logs
CREATE TABLE bid_logs(
	bid_id SERIAL PRIMARY KEY,
	buyer_id INT NOT NULL,
	product_id INT NOT NULL,
	date_bid DATE NOT NULL,
	bid_price INT NOT NULL,
	FOREIGN KEY(buyer_id)
		REFERENCES buyers(user_id),
	FOREIGN KEY(product_id)
		REFERENCES products(product_id)
);

ALTER TABLE bid_logs
ADD CONSTRAINT bid_price
	CHECK(bid_price > 0);