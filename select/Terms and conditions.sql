--select all terms and conditions and the admin upload this terms and conditions

SELECT t.terms_id , t.terms_and_conditions , u.user_first_last_name as admin_name , t.admin_id
FROM terms_and_conditions t
INNER JOIN admin a
ON t.admin_id = a.admin_id
INNER JOIN users u
ON a.user_id = u.user_id
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------