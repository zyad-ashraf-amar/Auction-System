SELECT fr.report_id , fr.common_report_id , r.report_date , r.done , r.clint_id , r.bid_id
FROM final_report fr
INNER JOIN report r
ON r.report_id = fr.report_id
INNER JOIN clint c
ON r.clint_id = c.clint_id
INNER JOIN users u
ON u.user_id = c.user_id
where fr.rateing is null and fr.report_description is null and c.user_id = (SELECT user_id FROM users where user_name = 'MH')


SELECT fr.report_id , fr.common_report_id , r.report_date , r.done , r.clint_id , r.bid_id , cr.common_report_id ,cr.rep_rat_sugg_id , rrs.rep_rat_sugg ,cr.common_report
FROM final_report fr
INNER JOIN report r
ON r.report_id = fr.report_id
INNER JOIN common_report cr
ON fr.common_report_id = cr.common_report_id
INNER JOIN rep_rat_sugg rrs
ON rrs.rep_rat_sugg_id = cr.rep_rat_sugg_id
INNER JOIN clint c
ON r.clint_id = c.clint_id
INNER JOIN users u
ON u.user_id = c.user_id
where fr.rateing is null and fr.report_description is null and c.user_id = (SELECT user_id FROM users where user_name = 'MH')