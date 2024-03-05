select u.user_first_last_name as userName , u.user_email as email , u.got_banned as Status , u.user_phone1 as phone_1 , u.user_phone2 as phone_2 , c.category_check as Category_check , c.terms_check as terms_check , u.user_ssn as SSN , u.date_created as created_date , u.user_birthday as birthdate , u.gender , u.user_address as address 
from users u , clint c
WHERE c.user_id = u.user_id
order by u.user_id desc 
fetch  first 3 rows only;