--select all instant product with all images for clints 

select p.product_id ,p.product_name as title ,pimag.image as image , p.product_price as price , p.product_brand , p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material , p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model , p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.vehicle_manufacture_country , p.vehicle_mileage , p.vehicle_interchange_partNumber , p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.wireless_carrier , p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.build_location, p.build_area , p.building_floor , p.build_decoration , p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type , bt.build_type_name , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category  
from product p 
INNER JOIN category_product cp 
ON p.product_id = cp.product_id  
INNER JOIN state s 
ON p.state_id = s.state_id  
LEFT JOIN vehicle_fuel_type vft 
ON p.vehicle_fuel_type_id= vft.vehicle_fuel_type_id  
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
INNER JOIN review_product rp
ON rp.product_id = p.product_id
where pw.pay_way_name = 'Instant'
and rp.acceptation = 1
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--select all instant product with all images for clints it's not sold

select p.product_id ,p.product_name as title ,pimag.image as image , p.product_price as price , p.product_brand , p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material , p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model , p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.vehicle_manufacture_country , p.vehicle_mileage , p.vehicle_interchange_partNumber , p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.wireless_carrier , p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.build_location, p.build_area , p.building_floor , p.build_decoration , p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type , bt.build_type_name , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category , p.sold as product_sold
from product p 
INNER JOIN category_product cp 
ON p.product_id = cp.product_id  
INNER JOIN state s 
ON p.state_id = s.state_id  
LEFT JOIN vehicle_fuel_type vft 
ON p.vehicle_fuel_type_id= vft.vehicle_fuel_type_id  
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
INNER JOIN review_product rp
ON rp.product_id = p.product_id
where pw.pay_way_name = 'Instant' and p.sold = 0 and rp.acceptation = 1 ;
