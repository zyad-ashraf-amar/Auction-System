SELECT
  u.USER_FIRST_LAST_NAME,
  COUNT(d.clint_id) AS want_to_pay_deposit,
  SUM(CASE WHEN ap.acceptation = 1 THEN 1 ELSE 0 END) AS accept_deposit,
  SUM(CASE WHEN ap.acceptation = 0 THEN 1 ELSE 0 END) AS not_accept_deposit,
  SUM(CASE WHEN ap.acceptation IS NULL THEN 1 ELSE 0 END) AS wait_in_review_deposit,
  COUNT(DISTINCT a.auction_id) AS user_auction_count,
  SUM(CASE WHEN b.bid_money IN (SELECT MAX(bid_money) FROM bid b INNER JOIN deposite d ON b.deposite_id = d.deposite_id INNER JOIN auction a ON d.auction_id = a.auction_id GROUP BY a.auction_id) THEN 1 ELSE 0 END) AS won_auction
FROM deposite d
INNER JOIN clint c ON d.clint_id = c.clint_id
INNER JOIN users u ON u.user_id = c.user_id
INNER JOIN auction a ON d.auction_id = a.auction_id
INNER JOIN accept_particpation ap ON d.deposite_id = ap.deposite_id
LEFT JOIN bid b ON d.deposite_id = b.deposite_id
LEFT JOIN (
    SELECT d2.clint_id, MAX(b2.bid_money) AS max_bid_money
    FROM deposite d2
    INNER JOIN bid b2 ON d2.deposite_id = b2.deposite_id
    GROUP BY d2.clint_id
) max_bid ON c.clint_id = max_bid.clint_id
WHERE d.percentage_id = 2
GROUP BY u.USER_FIRST_LAST_NAME, d.clint_id
ORDER BY d.clint_id;