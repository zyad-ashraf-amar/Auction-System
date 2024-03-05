SELECT user_first_last_name, SUM(COALESCE(review_count, 0)) AS review_product, SUM(COALESCE(auction_count, 0)) AS accept_particpation, (SUM(COALESCE(review_count, 0)) + SUM(COALESCE(auction_count, 0))) AS sum_of_all_action
FROM (SELECT u.user_first_last_name, COUNT(rp.admin_id) AS review_count, NULL AS auction_count
FROM product p
INNER JOIN review_product rp ON rp.product_id = p.product_id
INNER JOIN admin a ON rp.admin_id = a.admin_id
INNER JOIN users u ON u.user_id = a.user_id
GROUP BY u.user_first_last_name
UNION
SELECT u.user_first_last_name, NULL AS review_count, COUNT(ap.admin_id) AS auction_count
FROM product p
INNER JOIN auction a ON p.product_id = a.product_id
INNER JOIN deposite d ON d.auction_id = a.auction_id
INNER JOIN accept_particpation ap ON d.deposite_id = ap.deposite_id
INNER JOIN admin a ON ap.admin_id = a.admin_id
INNER JOIN users u ON u.user_id = a.user_id
GROUP BY u.user_first_last_name )
GROUP BY user_first_last_name
ORDER BY sum_of_all_action DESC;