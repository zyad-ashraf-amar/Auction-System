--select all deposite to admin to get action of it

select d.deposite_recipt as recipt , u.user_first_last_name as clint_name , d.auction_id as auction_number 
, p.product_name as product_name , a.initial_price as price , pr.percentage as the_percentage 
, (a.initial_price * pr.percentage) as deposit_price 
from deposite d , clint c , users u , product p , percentage pr , auction a , accept_particpation ap
where p.product_id = d.auction_id 
and d.clint_id = c.clint_id 
and d.percentage_id = pr.percentage_id 
and c.user_id =u.user_id 
and d.auction_id = a.auction_id
and ap.deposite_id = d.deposite_id
and ap.acceptation is null
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all deposite accept or not

select d.deposite_recipt as recipt , u.user_first_last_name as clint_name , d.auction_id as auction_number , p.product_name as product_name , a.initial_price as price , pr.percentage as the_percentage , (a.initial_price * pr.percentage) as deposit_price , ap.acceptation , pr.percentage_name as status
from deposite d , clint c , users u , product p , percentage pr , auction a , accept_particpation ap
where p.product_id = d.auction_id 
and d.clint_id = c.clint_id 
and d.percentage_id = pr.percentage_id 
and c.user_id =u.user_id 
and d.auction_id = a.auction_id
and ap.deposite_id = d.deposite_id