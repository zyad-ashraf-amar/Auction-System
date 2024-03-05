SELECT u.user_first_last_name , d.auction_id 
FROM deposite d
LEFT JOIN auction a
ON a.auction_id = d.auction_id
LEFT JOIN clint c
ON d.clint_id = c.clint_id
LEFT JOIN users u
ON u.user_id = c.user_id
where percentage_id = 1 AND u.user_name = 'MH' AND d.auction_id = 1