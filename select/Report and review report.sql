--select all report and review report and name of the clint

SELECT r.report_id , r.clint_id , u.user_first_last_name as reporter_name , u.user_email as email , cr.common_report as common_report , r.report_description as report_description , r.report_date as report_date , rr.review_report_id ,rr.admin_id as admin_id , rr.review_report as review_report , rr.review_report_date as review_report_date 
FROM report r
INNER JOIN review_report rr 
ON rr.report_id = r.report_id
LEFT JOIN common_report cr
ON r.common_report_id = cr.common_report_id
LEFT JOIN clint c
ON r.clint_id = c.clint_id
LEFT JOIN admin a
ON rr.admin_id = a.admin_id
LEFT JOIN users u
ON c.user_id = u.user_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select one report and review report and name of the clint (user_name = 'MH')

SELECT r.report_id , r.clint_id , u.user_first_last_name as reporter_name , u.user_email as email , cr.common_report as common_report , r.report_description as report_description , r.report_date as report_date , rr.review_report_id ,rr.admin_id as admin_id , rr.review_report as review_report , rr.review_report_date as review_report_date 
FROM report r
INNER JOIN review_report rr 
ON rr.report_id = r.report_id
LEFT JOIN common_report cr
ON r.common_report_id = cr.common_report_id
LEFT JOIN clint c
ON r.clint_id = c.clint_id
LEFT JOIN admin a
ON rr.admin_id = a.admin_id
LEFT JOIN users u
ON c.user_id = u.user_id
WHERE c.user_id = (SELECT user_id FROM users WHERE user_name = 'MH');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all report and review report

SELECT r.report_id , r.report_description , cr.common_report , r.report_date , r.clint_id ,r.report_product , rr.review_report_id , rr.review_report , rr.review_report_date , rr.admin_id
FROM report r 
INNER JOIN review_report rr 
ON r.REPORT_ID = rr.REPORT_ID
LEFT JOIN common_report cr
ON r.common_report_id = cr.common_report_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select one report and review report (report_id = 1)

SELECT r.report_id , r.report_description , cr.common_report , r.report_date , r.clint_id ,r.report_product , rr.review_report_id , rr.review_report , rr.review_report_date , rr.admin_id
FROM report r 
INNER JOIN review_report rr 
ON r.REPORT_ID = rr.REPORT_ID
LEFT JOIN common_report cr
ON r.common_report_id = cr.common_report_id
WHERE r.report_id = 1;