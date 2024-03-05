--select for all Live auction with All image of each live auction product it's not sold

select p.product_id,p.product_name as title ,pimag.image as image , a.initial_price as price , p.product_brand , p.product_description as description, p.product_size , p.product_storage , p.product_summary , p.product_material ,p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model , p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.vehicle_manufacture_country ,p.vehicle_mileage , p.vehicle_interchange_partNumber , p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.wireless_carrier , p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.build_location , p.build_area , p.building_floor ,p.build_decoration ,p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type , bt.build_type_name, a.start_day_time as startTime , pw.pay_way_name as payWay , p.sold as product_sold , s.state_name as state , c.category_name as Category  
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
ON p.product_id = a.product_id 
INNER JOIN review_product rp
ON rp.product_id = p.product_id
where p.pay_way_id = 2 and rp.acceptation = 1 and p.sold = 0;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select for all Live auction with first image of each live auction product

select p.product_id,p.product_name as title ,pimag.image as image , a.initial_price as price , p.product_brand , p.product_description as description, p.product_size , p.product_storage , p.product_summary , p.product_material ,p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model , p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.vehicle_manufacture_country ,p.vehicle_mileage , p.vehicle_interchange_partNumber , p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.wireless_carrier , p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.build_location , p.build_area , p.building_floor ,p.build_decoration ,p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type , bt.build_type_name, a.start_day_time as startTime , pw.pay_way_name as payWay , p.sold as product_sold , s.state_name as state , c.category_name as Category  
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
ON p.product_id = a.product_id 
INNER JOIN review_product rp
ON rp.product_id = p.product_id
where p.pay_way_id = 2 and rp.acceptation = 1 and pimag.image_id = 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select for all Live auction with first image of each live auction product and the bider in this auction

SELECT p.product_name as title ,pimag.image as image , a.initial_price as price , p.product_brand , p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material , p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model , p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.vehicle_manufacture_country , p.vehicle_mileage , p.vehicle_interchange_partNumber , p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.wireless_carrier , p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.build_location , p.build_area , p.building_floor , p.build_decoration , p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type , bt.build_type_name, a.start_day_time as startTime , a.end_day_time as endTime , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category , u.user_first_last_name as Bider_name , b.bid_money as money , b.bid_time 
FROM product p 
INNER JOIN category_product cp
on cp.product_id = p.product_id
INNER JOIN state s
on p.state_id = s.state_id
LEFT JOIN vehicle_fuel_type vft 
on p.vehicle_fuel_type_id = vft.vehicle_fuel_type_id
LEFT JOIN vehicle_class vc
on p.vehicle_class_id = vc.vehicle_class_id
LEFT JOIN digital_type dt
on p.digital_type_id = dt.digital_type_id
LEFT JOIN build_type bt
on p.build_type_id = bt.build_type_id
LEFT JOIN product_image pimag
on pimag.product_id = p.product_id
LEFT JOIN pay_way pw
on p.pay_way_id = pw.pay_way_id
LEFT JOIN category c
on c.category_id = cp.category_id
LEFT JOIN auction a
on a.product_id = p.product_id
LEFT JOIN deposite d
on d.auction_id =a.auction_id
LEFT JOIN clint cl
on d.clint_id = cl.clint_id
INNER JOIN bid b
on d.deposite_id = b.deposite_id
LEFT JOIN users u
on u.user_id = cl.user_id
WHERE p.product_id = a.auction_id and p.pay_way_id = 2 and pimag.image_id = 1 ;



