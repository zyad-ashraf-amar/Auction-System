-select all product to the admin to get action if this product accept or not

select p.product_name as title ,pimag.image as image , p.product_id as id, p.product_price as price_of_instans , a.initial_price as price_of_auction, p.product_brand as brand , p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material , p.product_color , p.product_payment_date , p.product_description_state , a.start_day_time as startTime , a.end_day_time as endTime , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category 
from product p 
INNER JOIN category_product cp 
ON p.product_id = cp.product_id  
INNER JOIN state s 
ON p.state_id = s.state_id  
LEFT JOIN vehicle_fuel_type vft 
ON p.vehicle_fuel_type_id = vft.vehicle_fuel_type_id  
LEFT JOIN vehicle_class vc 
ON p.vehicle_class_id = vc.vehicle_class_id  
LEFT JOIN digital_type dt 
ON p.digital_type_id = dt.digital_type_id  
LEFT JOIN build_type bt 
ON p.build_type_id = bt.build_type_id  
LEFT JOIN product_image pimag 
ON p.product_id = pimag.product_id  
LEFT JOIN pay_way pw 
ON p.pay_way_id = pw.pay_way_id
LEFT JOIN category c 
ON cp.category_id = c.category_id  
LEFT JOIN auction a 
ON a.product_id = p.product_id
INNER JOIN review_product rp
on rp.product_id = p.product_id
where rp.acceptation is null and pimag.image_id = 1 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



