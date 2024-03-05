SELECT u.user_first_last_name , ap.acceptation
FROM deposite d
INNER JOIN auction a
ON a.auction_id = d.auction_id
INNER JOIN clint c
ON c.clint_id = d.clint_id
INNER JOIN accept_particpation ap
ON ap.deposite_id = d.deposite_id
INNER JOIN users u
ON u.user_id = c.user_id
WHERE d.PERCENTAGE_ID = 2 AND ap.acceptation = 1 AND a.auction_id = 1;
