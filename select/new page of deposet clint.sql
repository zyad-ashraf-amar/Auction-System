SELECT p.product_name , pi.image , d.deposite_price , pw.pay_way_name 
FROM product p
INNER JOIN review_product rp
ON rp.product_id = p.product_id
INNER JOIN product_image pi
ON pi.product_id = p.product_id
INNER JOIN pay_way pw
ON pw.pay_way_id = p.pay_way_id
INNER JOIN auction a
ON p.product_id = a.product_id
INNER JOIN deposite d
ON d.auction_id = a.auction_id
INNER JOIN accept_particpation ap
ON d.deposite_id = ap.deposite_id
INNER JOIN clint c
ON p.clint_id = c.clint_id 
INNER JOIN users u
ON u.user_id = c.user_id
WHERE rp.acceptation = 1 and pi.image_id = 1 and d.percentage_id = 1 and (ap.acceptation is null or ap.acceptation = 0) and u.user_id = (SELECT user_id FROM users WHERE users.user_name = 'OH') ;







SELECT p.product_name , pi.image ,p.product_price , a.initial_price , d.deposite_price , pe.percentage , pw.pay_way_name 
FROM product p
INNER JOIN review_product rp
ON rp.product_id = p.product_id
INNER JOIN product_image pi
ON pi.product_id = p.product_id
INNER JOIN pay_way pw
ON pw.pay_way_id = p.pay_way_id
INNER JOIN auction a
ON p.product_id = a.product_id
INNER JOIN deposite d
ON d.auction_id = a.auction_id
INNER JOIN percentage pe
ON pe.percentage_id = d.percentage_id
INNER JOIN accept_particpation ap
ON d.deposite_id = ap.deposite_id
INNER JOIN clint c
ON p.clint_id = c.clint_id 
INNER JOIN users u
ON u.user_id = c.user_id
WHERE (ap.acceptation is null or ap.acceptation = 0) and pi.image_id = 1 and d.percentage_id = 1  and u.user_id = (SELECT user_id FROM users WHERE users.user_name = 'MoMo') ;