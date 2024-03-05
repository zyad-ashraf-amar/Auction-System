SELECT cat.category_name, COALESCE(s.total_sales, 0) AS total_sales, all_months.month, COALESCE(s.total_bid, 0) AS total_bid
FROM (
  SELECT DISTINCT category_id, category_name
  FROM category
) cat
CROSS JOIN (
  SELECT LEVEL AS month
  FROM dual
  CONNECT BY LEVEL <= 12
) all_months
LEFT JOIN (
  SELECT
    c.category_id,
    EXTRACT(MONTH FROM b.bid_time) AS month,
    COUNT(DISTINCT p.product_id) AS total_sales,
    SUM(b.bid_money) AS total_bid
  FROM
    product p
    INNER JOIN category_product cp ON p.product_id = cp.product_id
    INNER JOIN category c ON cp.category_id = c.category_id
    INNER JOIN auction a ON a.product_id = p.product_id
    INNER JOIN deposite d ON a.auction_id = d.auction_id
    INNER JOIN bid b ON d.deposite_id = b.deposite_id
  WHERE
    b.bid_money IN (
      SELECT MAX(bid_money)
      FROM bid b
      INNER JOIN deposite d ON b.deposite_id = d.deposite_id
      INNER JOIN auction a ON d.auction_id = a.auction_id
      GROUP BY a.auction_id
    )
    AND EXTRACT(YEAR FROM b.bid_time) = 2023
    AND c.SUB_CATEGORY_ID IS NOT NULL
  GROUP BY
    c.category_id,
    EXTRACT(MONTH FROM b.bid_time)
) s ON cat.category_id = s.category_id AND all_months.month = s.month
ORDER BY all_months.month;