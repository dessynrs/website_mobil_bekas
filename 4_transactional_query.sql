-- Mencari mobil keluaran 2015 ke atas
SELECT 
	brand, 
	model, 
	year, 
	price
FROM products
WHERE year >= 2015;


-- Menambahkan satu data bid baru
-- Tabel sebelum ada bid
SELECT * FROM buyers;
SELECT * FROM bid_logs;
SELECT * FROM products;

SELECT * FROM bid_logs
ORDER BY 1 DESC;


INSERT INTO 
	bid_logs(
	bid_id,
	buyer_id, 
	product_id, 
	date_bid,
	bid_price)
VALUES(201, 1, 1, '2023-01-01', 155000000);


-- Mobil yang dijual oleh akun 'Koko Dabukke'
-- Cari seller yg menjual > 1
SELECT seller_id, COUNT(product_id) 
FROM products
GROUP BY 1 
ORDER BY 2 DESC;

-- Ambil seller_id = 34
SELECT *
FROM sellers
WHERE user_id = 34;

SELECT 
	brand, model, year, price, kilometer
FROM products
WHERE seller_id = (
	SELECT user_id 
	FROM sellers
	WHERE first_name = 'Koko' 
		and last_name = 'Dabukke'
	);
	
	
-- Mobil bekas termurah berdasarkan keyword
-- Contoh keyword 'Yaris'
SELECT * FROM body_types
SELECT 
	model, c.car_type, b.body_type, year, price
FROM products
JOIN body_types b
	USING(body_type_id)
JOIN car_types c
	USING(car_type_id)
WHERE model ILIKE '%jazz%'
ORDER BY price ASC;


-- Mencari mobil bekas berdasarkan id_kota
-- Jarak terdekat dihitung berdasarkan longitude dan latitude
-- Contoh mencari mobil terdekat dengan id_kota 3173

-- Create function
CREATE FUNCTION 
	haversine_distance(
		point1 POINT, point2 POINT)
RETURNS float AS $$
DECLARE
	lon1 float := radians(point1[0]);
	lat1 float := radians(point1[1]);
	lon2 float := radians(point2[0]);
	lat2 float := radians(point2[1]);

	dlon float := lon2 - lon1;
	dlat float := lat2 - lat1;
	a float;
	c float;
	r float := 6371;
	jarak float;

BEGIN
	-- Haversine formula
	a := sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
	c := 2 * asin(sqrt(a));
	jarak := r * c;
	RETURN jarak;
END;

$$ LANGUAGE plpgsql;

-- Mencari produk dengan jarak terdekat dari lokasi buyer
-- lokasi buyer = 3173
-- CTE
WITH data_rekap AS(
SELECT product_id, brand, model, car_type, body_type, year, price, s.city_id, c.lonlat,
	(SELECT lonlat FROM city WHERE city_id = 3173) AS kota_buyer
FROM products p
JOIN sellers s ON p.seller_id = s.user_id
JOIN city c USING(city_id)
JOIN car_types USING(car_type_id)
JOIN body_types USING(body_type_id)
)
SELECT brand, model, car_type, body_type, year, price,
	haversine_distance(lonlat, kota_buyer) AS distance_km
FROM data_rekap
ORDER BY distance_km
LIMIT 10;
