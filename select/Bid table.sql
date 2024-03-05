--select all bid from the table

SELECT u.user_first_last_name as name , b.bid_money as money , b.bid_time 
FROM bid b , deposite d , auction a , clint c , users u , product p , pay_way py
WHERE d.clint_id = c.clint_id 
and d.deposite_id = b.deposite_id 
and u.user_id = c.user_id 
and d.auction_id = a.auction_id 
and p.product_id = a.auction_id 
and py.pay_way_id = p.pay_way_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all bid from one auction

SELECT u.user_first_last_name as name , b.bid_money as money , b.bid_time 
FROM bid b , deposite d , auction a , clint c , users u , product p , pay_way py
WHERE d.clint_id = c.clint_id 
and d.deposite_id = b.deposite_id 
and u.user_id = c.user_id 
and d.auction_id = a.auction_id 
and p.product_id = a.auction_id 
and py.pay_way_id = p.pay_way_id
and p.auction_id = 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


