--select all accept particpation table 

SELECT ap.accept_particpation_id , ap.acceptation , ap.refuse_reason , ap.accept_massage , ap.accept_particpation_date , u.user_first_last_name , ap.admin_id , ap.deposite_id 
FROM accept_particpation ap
INNER JOIN deposite d
ON ap.deposite_id = d.deposite_id
INNER JOIN clint c
ON d.clint_id = c.clint_id
INNER JOIN users u
ON u.user_id = c.user_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select accept particpation table (user_name = 'MH')

SELECT ap.accept_particpation_id , ap.acceptation , ap.refuse_reason , ap.accept_massage , ap.accept_particpation_date , u.user_first_last_name , ap.admin_id , ap.deposite_id 
FROM accept_particpation ap
INNER JOIN deposite d
ON ap.deposite_id = d.deposite_id
INNER JOIN clint c
ON d.clint_id = c.clint_id
INNER JOIN users u
ON u.user_id = c.user_id
WHERE c.user_id = (SELECT user_id FROM users WHERE user_name = 'MH');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select accept particpation table (accept_particpation_id = 1)

SELECT ap.accept_particpation_id , ap.acceptation , ap.refuse_reason , ap.accept_massage , ap.accept_particpation_date , u.user_first_last_name , ap.admin_id , ap.deposite_id 
FROM accept_particpation ap
INNER JOIN deposite d
ON ap.deposite_id = d.deposite_id
INNER JOIN clint c
ON d.clint_id = c.clint_id
INNER JOIN users u
ON u.user_id = c.user_id
WHERE ap.accept_particpation_id = 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------