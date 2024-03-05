--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select p.product_id, a.auction_id,p.product_name as title ,pimag.image as image ,a.initial_price as price , p.product_brand 
, p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material 
, p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model 
, p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.wireless_carrier 
, p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.vehicle_manufacture_country , p.vehicle_mileage , p.vehicle_interchange_partNumber 
, p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.build_location , p.build_area , p.building_floor 
, p.build_decoration , p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type 
, bt.build_type_name, a.START_DAY_TIME , a.END_DAY_TIME , a.END_LIVE_AUCTION , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category
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
INNER JOIN product_image pimag 
ON p.product_id = pimag.product_id
INNER JOIN pay_way pw 
ON p.pay_way_id = pw.pay_way_id
INNER JOIN category c 
ON cp.category_id = c.category_id 
INNER JOIN review_product rp 
ON p.product_id = rp.product_id
LEFT JOIN auction a 
ON p.product_id = a.product_id
LEFT JOIN deposite d
ON d.auction_id = a.auction_id
LEFT JOIN accept_particpation ap
ON d.deposite_id = ap.deposite_id
where rp.acceptation = 1 and  p.sold = 0 and pimag.IMAGE_ID = 1 and d.percentage_id = 1 and ap.acceptation = 1 and p.pay_way_id = (SELECT pay_way_id FROM pay_way where pay_way_name = 'Schedule Auction');


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select p.product_id, a.auction_id,p.product_name as title ,pimag.image as image ,a.initial_price as price , p.product_brand 
, p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material 
, p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model 
, p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.wireless_carrier 
, p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.vehicle_manufacture_country , p.vehicle_mileage , p.vehicle_interchange_partNumber 
, p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.build_location , p.build_area , p.building_floor 
, p.build_decoration , p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type 
, bt.build_type_name, a.START_DAY_TIME , a.END_DAY_TIME , a.END_LIVE_AUCTION , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category
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
INNER JOIN product_image pimag 
ON p.product_id = pimag.product_id
INNER JOIN pay_way pw 
ON p.pay_way_id = pw.pay_way_id
INNER JOIN category c 
ON cp.category_id = c.category_id 
INNER JOIN review_product rp 
ON p.product_id = rp.product_id
LEFT JOIN auction a 
ON p.product_id = a.product_id
LEFT JOIN deposite d
ON d.auction_id = a.auction_id
LEFT JOIN accept_particpation ap
ON d.deposite_id = ap.deposite_id
where rp.acceptation = 1 and  p.sold = 0 and pimag.IMAGE_ID = 1 and d.percentage_id = 1 and ap.acceptation = 1 and c.category_id = (select category_id from category where category_name = 'Cars') and p.pay_way_id = (SELECT pay_way_id FROM pay_way where pay_way_name = 'Schedule Auction');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------