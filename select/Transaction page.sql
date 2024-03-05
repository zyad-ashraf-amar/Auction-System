SELECT p.product_id,
       p.product_name AS title,
       pimag.image AS image,
       pw.pay_way_name AS payWay,
       s.state_name AS state,
       a.initial_price AS initial_price_of_auction,
       a.start_day_time AS startTime,
       MAX(CASE WHEN a.end_day_time is null THEN b.BID_TIME +  (INTERVAL '1' MINUTE) * a.END_LIVE_AUCTION ELSE a.end_day_time END) AS endTime,
       u2.user_first_last_name AS saller_name,
       MAX(CASE WHEN u1.user_first_last_name = u2.user_first_last_name THEN NULL ELSE u1.user_first_last_name END) AS winner_name,
       MAX(b.bid_money) AS last_price_of_auction,
       a.auction_id AS auction_number
FROM auction a
LEFT JOIN deposite d ON d.auction_id = a.auction_id
LEFT JOIN accept_particpation ap ON ap.deposite_id = d.deposite_id
LEFT JOIN bid b ON b.deposite_id = d.deposite_id
LEFT JOIN clint c1 ON d.clint_id = c1.clint_id
LEFT JOIN users u1 ON c1.user_id = u1.user_id
LEFT JOIN product p ON a.product_id = p.product_id
LEFT JOIN clint c2 ON p.clint_id = c2.clint_id
LEFT JOIN users u2 ON c2.user_id = u2.user_id
LEFT JOIN state s ON p.state_id = s.state_id
LEFT JOIN product_image pimag ON p.product_id = pimag.product_id
LEFT JOIN pay_way pw ON p.pay_way_id = pw.pay_way_id
LEFT JOIN percentage per ON per.percentage_id = d.percentage_id
WHERE pimag.image_id = 1
  AND (b.bid_money IN (SELECT MAX(b.bid_money) FROM bid b INNER JOIN deposite d ON b.deposite_id = d.deposite_id INNER JOIN auction a ON d.auction_id = a.auction_id GROUP BY a.auction_id)
       OR (d.percentage_id = 1 AND ap.acceptation = 1))
GROUP BY p.product_id, p.product_name, pimag.image, pw.pay_way_name, s.state_name, a.initial_price, a.start_day_time, a.end_day_time, u2.user_first_last_name, a.auction_id
ORDER BY a.auction_id;




SELECT p.product_id,
       p.product_name AS title,
       pimag.image AS image,
       pw.pay_way_name AS payWay,
       s.state_name AS state,
       a.initial_price AS initial_price_of_auction,
       a.start_day_time AS startTime,
       a.end_day_time AS endTime,
       u2.user_first_last_name AS saller_name,
       MAX(CASE WHEN u1.user_first_last_name = u2.user_first_last_name THEN NULL ELSE u1.user_first_last_name END) AS winner_name,
       MAX(b.bid_money) AS last_price_of_auction,
       a.auction_id AS auction_number
FROM auction a
LEFT JOIN deposite d ON d.auction_id = a.auction_id
LEFT JOIN accept_particpation ap ON ap.deposite_id = d.deposite_id
LEFT JOIN bid b ON b.deposite_id = d.deposite_id
LEFT JOIN clint c1 ON d.clint_id = c1.clint_id
LEFT JOIN users u1 ON c1.user_id = u1.user_id
LEFT JOIN product p ON a.product_id = p.product_id
LEFT JOIN clint c2 ON p.clint_id = c2.clint_id
LEFT JOIN users u2 ON c2.user_id = u2.user_id
LEFT JOIN state s ON p.state_id = s.state_id
LEFT JOIN product_image pimag ON p.product_id = pimag.product_id
LEFT JOIN pay_way pw ON p.pay_way_id = pw.pay_way_id
LEFT JOIN percentage per ON per.percentage_id = d.percentage_id
WHERE pimag.image_id = 1
  AND (b.bid_money IN (SELECT MAX(b.bid_money) FROM bid b INNER JOIN deposite d ON b.deposite_id = d.deposite_id INNER JOIN auction a ON d.auction_id = a.auction_id GROUP BY a.auction_id)
       OR (d.percentage_id = 1 AND ap.acceptation = 1))
GROUP BY p.product_id, p.product_name, pimag.image, pw.pay_way_name, s.state_name, a.initial_price, a.start_day_time, a.end_day_time, u2.user_first_last_name, a.auction_id
ORDER BY a.auction_id;