btgeb kl 4hr atba3 ad a lma tktb al sna 2ly anta 3ayzha



SELECT c.category_name, EXTRACT(MONTH FROM b.bid_time) AS month, COUNT(DISTINCT p.product_id) AS total_sales
FROM product p
INNER JOIN category_product cp ON p.product_id = cp.product_id
INNER JOIN category c ON cp.category_id = c.category_id
INNER JOIN auction a ON a.product_id = p.product_id
INNER JOIN deposite d ON a.auction_id = d.auction_id
INNER JOIN bid b ON d.deposite_id = b.deposite_id
WHERE EXTRACT(YEAR FROM b.bid_time) = 2023
GROUP BY c.category_name, EXTRACT(MONTH FROM b.bid_time)
ORDER BY c.category_name, EXTRACT(MONTH FROM b.bid_time);







SELECT c.category_name, sum(b.bid_money) , EXTRACT(MONTH FROM b.bid_time) AS month, COUNT(DISTINCT p.product_id) AS total_sales
FROM product p
INNER JOIN category_product cp ON p.product_id = cp.product_id
INNER JOIN category c ON cp.category_id = c.category_id
INNER JOIN auction a ON a.product_id = p.product_id
INNER JOIN deposite d ON a.auction_id = d.auction_id
INNER JOIN bid b ON d.deposite_id = b.deposite_id
WHERE b.bid_money IN (SELECT MAX(b.bid_money) FROM bid b INNER JOIN deposite d ON b.deposite_id = d.deposite_id INNER JOIN auction a ON d.auction_id = a.auction_id GROUP BY a.auction_id) and EXTRACT(YEAR FROM b.bid_time) = 2023
GROUP BY c.category_name, EXTRACT(MONTH FROM b.bid_time)
ORDER BY c.category_name, EXTRACT(MONTH FROM b.bid_time);