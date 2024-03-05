--select all clint data to all clint

SELECT c.clint_id , u.user_first_last_name , u.user_phone1 , u.user_phone2 , u.user_ssn , u.user_address , u.gender , u.user_birthday , u.date_created , u.user_email , u.user_name , u.user_password , c.terms_check ,c.category_check
FROM clint c
INNER JOIN users u
ON u.user_id = c.user_id ;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all clint data from one clint with his username

SELECT c.clint_id , u.user_first_last_name , u.user_phone1 , u.user_phone2 , u.user_ssn , u.user_address , u.gender , u.user_birthday , u.date_created , u.user_email , u.user_name , u.user_password , c.terms_check ,c.category_check
FROM clint c
INNER JOIN users u
ON u.user_id = c.user_id 
WHERE c.user_id = (SELECT user_id FROM users WHERE user_name = 'MH');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all clint data from one clint with his clint_id

SELECT c.clint_id , u.user_first_last_name , u.user_phone1 , u.user_phone2 , u.user_ssn , u.user_address , u.gender , u.user_birthday , u.date_created , u.user_email , u.user_name , u.user_password , c.terms_check ,c.category_check
FROM clint c
INNER JOIN users u
ON u.user_id = c.user_id 
WHERE c.clint_id = 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------