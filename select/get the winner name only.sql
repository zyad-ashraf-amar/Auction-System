--get the winner name of the auction

select u.USER_FIRST_LAST_NAME from bid b
inner join deposite d
on d.deposite_id in b.deposite_id
inner join auction a
on d.auction_id in a.auction_id
inner join clint c
on d.clint_id in c.clint_id
inner join users u
on u.user_id in c.user_id
where b.bid_money in 
(select MAX(b.bid_money) from bid b
inner join deposite d
on d.deposite_id in b.deposite_id
inner join auction a
on d.auction_id in a.auction_id 
group by a.auction_id)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------