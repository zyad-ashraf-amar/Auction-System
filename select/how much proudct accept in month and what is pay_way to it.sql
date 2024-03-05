SELECT c.category_name, EXTRACT(MONTH FROM rp.DATE_OF_ACTION) AS month,pw.pay_way_name , COUNT(DISTINCT p.product_id) AS total_sales
FROM product p
INNER JOIN pay_way pw ON pw.pay_way_id = p.pay_way_id
INNER JOIN state s ON s.state_id = p.state_id
INNER JOIN category_product cp ON p.product_id = cp.product_id
INNER JOIN category c ON cp.category_id = c.category_id
INNER JOIN review_product rp ON p.product_id = rp.product_id
WHERE EXTRACT(YEAR FROM rp.DATE_OF_ACTION) = 2022 and rp.ACCEPTATION = 1
GROUP BY c.category_name, pw.pay_way_name , EXTRACT(MONTH FROM rp.DATE_OF_ACTION)
ORDER BY c.category_name, EXTRACT(MONTH FROM rp.DATE_OF_ACTION);