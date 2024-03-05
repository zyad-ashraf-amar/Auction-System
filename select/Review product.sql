--select all review product table and name of the admin of accept the product

SELECT rp.review_product_id , rp.acceptation , rp.refuse_reason , rp.accept_massage , rp.review_product_date , u.user_first_last_name , rp.admin_id , p.product_name ,rp.product_id
FROM review_product rp
INNER JOIN product p
ON rp.product_id = p.product_id
LEFT JOIN admin a
ON rp.admin_id = a.admin_id
LEFT JOIN users u
ON a.user_id = u.user_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select review product table if (user_name = 'AG')

SELECT rp.review_product_id , rp.acceptation , rp.refuse_reason , rp.accept_massage , rp.review_product_date , u.user_first_last_name , rp.admin_id , p.product_name ,rp.product_id
FROM review_product rp
INNER JOIN product p
ON rp.product_id = p.product_id
LEFT JOIN admin a
ON rp.admin_id = a.admin_id
LEFT JOIN users u
ON a.user_id = u.user_id
WHERE a.user_id = (SELECT user_id FROM users WHERE user_name = 'AG');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select review product table if (review_product_id = 1)

SELECT rp.review_product_id , rp.acceptation , rp.refuse_reason , rp.accept_massage , rp.review_product_date , u.user_first_last_name , rp.admin_id , p.product_name ,rp.product_id
FROM review_product rp
INNER JOIN product p
ON rp.product_id = p.product_id
LEFT JOIN admin a
ON rp.admin_id = a.admin_id
LEFT JOIN users u
ON a.user_id = u.user_id
WHERE rp.review_product_id = 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------