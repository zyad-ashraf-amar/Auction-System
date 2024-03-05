bt5tar al sana w al catagory w al 4hr 



SELECT c.category_name, EXTRACT(MONTH FROM b.bid_time) AS month, COUNT(DISTINCT p.product_id) AS total_sales
FROM product p
INNER JOIN category_product cp ON p.product_id = cp.product_id
INNER JOIN category c ON cp.category_id = c.category_id
INNER JOIN auction a ON a.product_id = p.product_id
INNER JOIN deposite d ON a.auction_id = d.auction_id
INNER JOIN bid b ON d.deposite_id = b.deposite_id
WHERE EXTRACT(YEAR FROM b.bid_time) = 2023 and EXTRACT(MONTH FROM b.bid_time) = 2 and c.category_name = 'Cars'
GROUP BY c.category_name, EXTRACT(MONTH FROM b.bid_time) 
ORDER BY c.category_name, EXTRACT(MONTH FROM b.bid_time);



bt5tar al sana w al catagory



SELECT c.category_name, EXTRACT(MONTH FROM b.bid_time) AS month, COUNT(DISTINCT p.product_id) AS total_sales
FROM product p
INNER JOIN category_product cp ON p.product_id = cp.product_id
INNER JOIN category c ON cp.category_id = c.category_id
INNER JOIN auction a ON a.product_id = p.product_id
INNER JOIN deposite d ON a.auction_id = d.auction_id
INNER JOIN bid b ON d.deposite_id = b.deposite_id
WHERE EXTRACT(YEAR FROM b.bid_time) = 2023 and c.category_name = 'Cars'
GROUP BY c.category_name, EXTRACT(MONTH FROM b.bid_time) 
ORDER BY c.category_name, EXTRACT(MONTH FROM b.bid_time);