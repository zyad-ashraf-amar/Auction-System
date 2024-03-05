SELECT c.category_name, cp.category_id, COUNT(cp.product_id) AS product_count
FROM category_product cp
INNER JOIN category c ON cp.category_id = c.category_id
WHERE c.category_id = (
    SELECT cp.category_id
    FROM category_product cp
    INNER JOIN category c ON cp.category_id = c.category_id
    INNER JOIN product p ON p.product_id = cp.product_id
    INNER JOIN auction a ON a.product_id = p.product_id
    INNER JOIN deposite d ON a.auction_id = d.auction_id
    INNER JOIN accept_particpation ap ON d.deposite_id = ap.deposite_id
    WHERE d.percentage_id = 1 and ap.acceptation = 1 and d.clint_id = p.clint_id and ap.date_of_action >= SYSDATE - INTERVAL '6' MONTH
    GROUP BY cp.category_id
    ORDER BY COUNT(cp.product_id) DESC
    FETCH FIRST 1 ROWS ONLY
)
GROUP BY c.category_name, cp.category_id;