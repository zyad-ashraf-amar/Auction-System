SELECT a.admin_image as image , u.user_first_last_name as admin_name FROM admin a , users u 
WHERE a.user_id = u.user_id ;

SELECT a.admin_image as image , u.user_first_last_name as admin_name FROM admin a , users u 
WHERE a.user_id = u.user_id  and a.admin_id = 
(SELECT user_id FROM users
 WHERE user_name = 'AG');