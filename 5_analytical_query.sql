-- Ranking popularitas model berdasarkan jumlah bid
SELECT 
	p.model, 
	COUNT(bid_id)
FROM bid_logs
JOIN products p
	USING(product_id)
GROUP BY 1
ORDER BY 2 DESC;


-- Membandingkan harga mobil berdasarkan harga rata-rata per kota
SELECT * FROM products
WHERE model ILIKE '%honda jazz%';
SELECT * FROM city;
SELECT * FROM sellers;

SELECT c.city, brand, model, year, price,
	AVG(price) OVER (PARTITION BY c.city) AS average_price_city
FROM products p
JOIN sellers s
	ON p.seller_id = s.user_id
JOIN city c
	USING(city_id)
WHERE model ILIKE '%honda jazz%';


-- Cari perbandingan tanggal user melakukan bid dengan bid selanjutnya 
-- beserta harga tawar yang diberikan
-- Contoh : bid utk honda jazz

-- Buat Temporary table count_bid_buyer utk product 'jazz'
CREATE TEMPORARY TABLE count_bid_buyer AS(
	SELECT 
		buyer_id, p.model,
		COUNT(bid_id) AS bid_count_buyer 
	FROM bid_logs
		JOIN products p USING(product_id)
	WHERE p.model ILIKE '%jazz%'
	GROUP BY 1,2
	ORDER BY 3 DESC
)
-- Panggil temporary table
SELECT * FROM count_bid_buyer;

SELECT buyer_id, brand, model, year, price, bid_price
FROM bid_logs
JOIN products p
	USING(product_id)
WHERE buyer_id = 124 OR buyer_id = 147
AND model ILIKE '%jazz%';

-- Query dg temporary table
SELECT  
	CONCAT(bu.first_name, ' ', bu.last_name) AS buyer_name,
	ct.car_type, bt.body_type,
	p.brand, p.model, b.date_bid, p.price, bid_price
FROM bid_logs b
	JOIN products p USING(product_id)
	JOIN buyers bu ON b.buyer_id = bu.user_id
	JOIN count_bid_buyer USING(buyer_id)
	JOIN car_types ct USING(car_type_id)
	JOIN body_types bt USING(body_type_id)
WHERE p.model ILIKE '%jazz%'
AND bid_count_buyer > 1
ORDER BY 2 DESC, 1, date_bid;


-- Membandingkan persentase perbedaan rata-rata harga mobil berdasarkan modelnya
-- dan rata-rata harga bid yang ditawarkan customer 6 bulan terakhir
--- a. difference adalah selisih antara harga rata-rata harga model mobil (avg_price)
--- dengan hara rata-rata bid yg ditawarkan pada model mobil tersebut(avg_bid_6_month)
--- b. difference dapat bernilai positif / negatif
--- c. difference_percent adalah persentase dari selisih yg telah dihitung 
--- dg cara difference / avg_price * 100%
--- d. difference_percent dapat bernilai positif / negatif

WITH bid_6_month AS(
SELECT *,
	AVG(price) OVER (PARTITION BY model) AS avg_price,
	AVG(bid_price) OVER (PARTITION BY model) AS avg_bid_6_month
FROM bid_logs
JOIN products p USING(product_id)
 WHERE date_bid >= '2023-04-01'
)
SELECT 
	model, 
	AVG(avg_price) AS avg_price_model, 
	AVG(avg_bid_6_month) AS avg_bid_6_month_model,
	(AVG(avg_price) - AVG(avg_bid_6_month)) AS difference,
	(AVG(avg_price) - AVG(avg_bid_6_month))::float / AVG(price) *100 AS difference_percent
FROM bid_6_month
GROUP BY 1;


-- Membuat window function
-- harga rata-rata bid sebuah merk dan model mobil
-- 6 bulan terakhir
-- Contoh Mobil Toyota Yaris 6 bulan terakhir
WITH yaris_logs AS(
	SELECT *
	FROM bid_logs 
	JOIN products p
		USING(product_id)
	WHERE date_bid > '2023-04-01'
	AND p.model ILIKE '%YARIS%'
)
SELECT 
	brand, model, 
	EXTRACT('MONTH' FROM date_bid) AS month,
	AVG(bid_price) AS average_bid_price_model
FROM yaris_logs
GROUP BY 1,2,3;

