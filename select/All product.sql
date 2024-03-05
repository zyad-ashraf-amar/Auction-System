--select all product used in first report

SELECT p.product_name as title ,pimag.image as image , p.product_id as id , p.product_price as price_of_instans , a.initial_price as price_of_auction , p.product_brand , p.product_description as description , p.product_size , p.product_storage , p.product_summary , p.product_material , p.product_color , p.product_payment_date , p.product_description_state , p.vehicle_model , p.vehicle_horse_power , p.vehicle_cc , p.vehicle_structure , p.vehicle_manufacture_year , p.vehicle_manufacture_country , p.vehicle_mileage , p.vehicle_interchange_partNumber , p.vehicle_gear_stick , p.water_resistance , p.screen_resolution , p.screen_Hz , p.wireless_carrier , p.slot_of_card , p.battery , p.camera_pixels , p.RAM , p.build_location , p.build_area , p.building_floor , p.build_decoration , p.build_rooms_number , p.upload_date ,vft.vehicle_fuel_type_name , vc.vehicle_class , dt.digital_type , bt.build_type_name, a.start_day_time as startTime , a.end_day_time as endTime , pw.pay_way_name as payWay , s.state_name as state , c.category_name as Category  , rp.acceptation 
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
INNER JOIN review_product rp
on rp.product_id = p.product_id
WHERE pimag.image_id = 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
