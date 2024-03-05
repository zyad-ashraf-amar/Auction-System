
CREATE TABLE users
(

  user_id INT NOT NULL,
  user_ssn VARCHAR(14) NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  user_Phone1 VARCHAR(20) NOT NULL,
  user_Phone2 VARCHAR(20),
  user_address VARCHAR(50) NOT NULL,
  gender NUMBER(1) NOT NULL,
  user_birthday DATE NOT NULL,
  date_created DATE NOT NULL,
  got_banned NUMBER(1) NOT NULL,
  user_email VARCHAR(30) NOT NULL,
  user_Password VARCHAR(20) NOT NULL,

  CONSTRAINT gender_CK CHECK (gender IN (1,0)),
  CONSTRAINT gotBanned_CK CHECK (got_banned IN (1,0)),
  CONSTRAINT user_id_PK PRIMARY KEY (user_id),
  CONSTRAINT user_ssn_UK UNIQUE (user_ssn)

);

CREATE TABLE admin
(

  admin_id INT NOT NULL,
  recruitment_day DATE NOT NULL,
  leaving_day DATE,
  admin_image VARCHAR(200) NOT NULL,
  manage_id INT,
  user_id INT NOT NULL,

  CONSTRAINT admin_PK PRIMARY KEY (admin_id),
  CONSTRAINT FK_user_admin FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT FK_admin_admin FOREIGN KEY (manage_id) REFERENCES admin(admin_id)

);

CREATE TABLE clint
(

  clint_id INT NOT NULL,
  category_check NUMBER(1) NOT NULL,
  terms_check NUMBER(1) NOT NULL,
  user_id INT NOT NULL,

  CONSTRAINT category_check_CK CHECK (category_check IN (1,0)),
  CONSTRAINT terms_check_CK CHECK (terms_check IN (1,0)),
  CONSTRAINT clint_PK PRIMARY KEY (clint_id),
  CONSTRAINT FK_user_clint FOREIGN KEY (user_id) REFERENCES users(user_id)

);

CREATE TABLE permission
(

  permission_id INT NOT NULL,
  permission_Name VARCHAR(30) NOT NULL,

  CONSTRAINT permission_PK PRIMARY KEY (permission_id)

);

CREATE TABLE terms_and_conditions
(

  terms_id INT NOT NULL,
  terms_and_conditions VARCHAR(500) NOT NULL,
  admin_id INT NOT NULL,

  CONSTRAINT terms_PK PRIMARY KEY (terms_id),
  CONSTRAINT FK_admin_Terms FOREIGN KEY (admin_id) REFERENCES admin(admin_id)

);

CREATE TABLE salary
(

  salary_id INT NOT NULL,
  salary FLOAT NOT NULL,
  salary_day DATE NOT NULL,
  admin_id INT NOT NULL,

  CONSTRAINT salary_PK PRIMARY KEY (salary_id),
  CONSTRAINT FK_admin_salary FOREIGN KEY (admin_id) REFERENCES admin(admin_id)

);

CREATE TABLE admin_Permission
(

  admin_id INT NOT NULL,
  permission_id INT NOT NULL,

  CONSTRAINT AdminPermission_PK PRIMARY KEY (admin_id,permission_id),
  CONSTRAINT FK_admin_AdminPermission FOREIGN KEY (admin_id) REFERENCES admin(admin_id),
  CONSTRAINT FK_permission_AdminPermission FOREIGN KEY (permission_id) REFERENCES permission(permission_id)

);

CREATE TABLE category
(

  category_id INT NOT NULL,
  category_name VARCHAR(30) NOT NULL,
  category_image VARCHAR(100) NOT NULL,
  sub_category_id INT,

  CONSTRAINT category_PK PRIMARY KEY (category_id),
  CONSTRAINT FK_category_category FOREIGN KEY (sub_category_id) REFERENCES category(category_id)

);

CREATE TABLE clint_category
(

  clint_id INT NOT NULL,
  category_id INT NOT NULL,

  CONSTRAINT clintCategory_PK PRIMARY KEY (clint_id,category_id),
  CONSTRAINT FK_clint_clintCategory FOREIGN KEY (clint_id) REFERENCES clint(clint_id),
  CONSTRAINT FK_category_clintCategory FOREIGN KEY (category_id) REFERENCES category(category_id)

);

CREATE TABLE clint_accept_terms
(

  clint_id INT NOT NULL,
  terms_id INT NOT NULL,

  CONSTRAINT clintAcceptTerms_PK PRIMARY KEY (clint_id,terms_id),
  CONSTRAINT FK_clint_clintAcceptTerms FOREIGN KEY (clint_id) REFERENCES clint(clint_id),
  CONSTRAINT FK_terms_clintAcceptTerms FOREIGN KEY (terms_id) REFERENCES TERMS_AND_CONDITIONS(terms_id)

);

CREATE TABLE common_report
(

  common_report_id INT NOT NULL,
  common_report VARCHAR(60) NOT NULL,

  CONSTRAINT common_report_PK PRIMARY KEY (common_report_id)

);

CREATE TABLE report
(

  report_id INT NOT NULL,
  report_description VARCHAR(150),
  clint_id INT NOT NULL,
  common_report_id INT NOT NULL,

  CONSTRAINT report_PK PRIMARY KEY (report_id),
  CONSTRAINT FK_clint_report FOREIGN KEY (clint_id) REFERENCES clint(clint_id),
  CONSTRAINT FK_commonReport_report FOREIGN KEY (common_report_id) REFERENCES common_report(common_report_id)

);

CREATE TABLE review_report
(

  review_report_id INT NOT NULL,
  review_report VARCHAR(150) NOT NULL,
  admin_id INT NOT NULL,
  report_id INT NOT NULL,

  CONSTRAINT review_report_PK PRIMARY KEY (review_report_id),
  CONSTRAINT FK_admin_reviewReport FOREIGN KEY (admin_id) REFERENCES admin(admin_id),
  CONSTRAINT FK_report_reviewReport FOREIGN KEY (report_id) REFERENCES report(report_id)

);

CREATE TABLE car_fuel_type
(

  car_fuel_type_id INT NOT NULL,
  car_fuel_type_name VARCHAR(40) NOT NULL,

  CONSTRAINT car_fuel_type_PK PRIMARY KEY (car_fuel_type_id)

);

CREATE TABLE car_class
(

  car_class_id INT NOT NULL,
  car_class VARCHAR(20) NOT NULL,

  CONSTRAINT car_class_PK PRIMARY KEY (car_class_id)

);

CREATE TABLE digital_type
(

  digital_type_id INT NOT NULL,
  digital_type VARCHAR(40) NOT NULL,

  CONSTRAINT digital_type_PK PRIMARY KEY (digital_type_id)

);

CREATE TABLE build_type
(

  build_type_id INT NOT NULL,
  build_type_name VARCHAR(50) NOT NULL,

  CONSTRAINT build_type_PK PRIMARY KEY (build_type_id)

);

CREATE TABLE state
(

  state_id INT NOT NULL,
  state_name VARCHAR(50) NOT NULL,

  CONSTRAINT state_PK PRIMARY KEY (state_id)

);

CREATE TABLE pay_way
(

  pay_way_id INT NOT NULL,
  pay_way_name VARCHAR(20) NOT NULL,

  CONSTRAINT pay_way_PK PRIMARY KEY (pay_way_id)

);

CREATE TABLE product
(

  product_id INT NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  product_price FLOAT,
  product_brand VARCHAR(20) NOT NULL,
  product_description VARCHAR(200) NOT NULL,
  product_size VARCHAR(20),
  product_storage VARCHAR(20),
  product_summary VARCHAR(100) NOT NULL,
  product_material VARCHAR(20),
  product_color VARCHAR(20),
  product_payment_date DATE,
  product_description_state VARCHAR(200),
  car_model VARCHAR(20),
  car_horse_power FLOAT,
  car_cc INT,
  car_structure VARCHAR(20),
  car_manifacture_year VARCHAR(20),
  car_manifacture_country VARCHAR(20),
  car_mileage FLOAT,
  car_interchange_part_number INT,
  car_gear_stick NUMBER(1) NOT NULL,
  water_resistance NUMBER(1) NOT NULL,
  screen_resolution VARCHAR(20),
  screen_Hz INT,
  build_location VARCHAR(60),
  build_area INT,
  building_floor INT,
  build_decoration VARCHAR(20),
  build_rooms_number INT,
  upload_date DATE,
  car_fuel_type_id INT,
  car_class_id INT,
  digital_type_id INT,
  build_type_id INT,
  state_id INT NOT NULL,
  pay_way_id INT NOT NULL,
  clint_id INT NOT NULL,
  
  CONSTRAINT waterResistance_CK CHECK (water_resistance IN (1,0)),
  CONSTRAINT carGearStick_CK CHECK (car_gear_stick IN (1,0)),
  CONSTRAINT product_PK PRIMARY KEY (product_id),
  CONSTRAINT FK_carFuelType_product FOREIGN KEY (car_fuel_type_id) REFERENCES car_fuel_type(car_fuel_type_id),
  CONSTRAINT FK_carClass_product FOREIGN KEY (car_class_id) REFERENCES car_class(car_class_id),
  CONSTRAINT FK_digitalType_product FOREIGN KEY (digital_type_id) REFERENCES digital_type(digital_type_id),
  CONSTRAINT FK_buildType_product FOREIGN KEY (build_type_id) REFERENCES build_type(build_type_id),
  CONSTRAINT FK_state_product FOREIGN KEY (state_id) REFERENCES state(state_id),
  CONSTRAINT FK_payWay_product FOREIGN KEY (pay_way_id) REFERENCES pay_way(pay_way_id),
  CONSTRAINT FK_clint_product FOREIGN KEY (clint_id) REFERENCES clint(clint_id)
);

CREATE TABLE product_image
(

  product_id INT NOT NULL,
  image_id INT NOT NULL,
  image VARCHAR(100) NOT NULL,

  CONSTRAINT productImage_PK PRIMARY KEY (product_id,image_id),
  CONSTRAINT FK_product_productImage FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE category_product
(

  product_id INT NOT NULL,
  category_id INT NOT NULL,

  CONSTRAINT productCategory_PK PRIMARY KEY (product_id,category_id),
  CONSTRAINT FK_product_productCategory FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT FK_category_productCategory FOREIGN KEY (category_id) REFERENCES category(category_id)

);

CREATE TABLE review_product
(

  review_product_id INT NOT NULL,
  acceptation NUMBER(1) NOT NULL,
  refuse_reason VARCHAR(150),
  admin_id INT NOT NULL,
  product_id INT NOT NULL,

  CONSTRAINT acceptation_CK CHECK (acceptation IN (1,0)),
  CONSTRAINT reviewProduct_PK PRIMARY KEY (review_product_id),
  CONSTRAINT FK_admin_reviewProduct FOREIGN KEY (admin_id) REFERENCES admin(admin_id),
  CONSTRAINT FK_product_reviewProduct FOREIGN KEY (product_id) REFERENCES product(product_id)

);

CREATE TABLE auction
(

  auction_id INT NOT NULL,
  start_day DATE NOT NULL,
  end_day DATE,
  start_time DATE NOT NULL,
  end_time DATE,
  initial_price FLOAT NOT NULL,
  product_id INT NOT NULL,

  CONSTRAINT auction_PK PRIMARY KEY (auction_id),
  CONSTRAINT FK_product_auction FOREIGN KEY (product_id) REFERENCES product(product_id)

);

CREATE TABLE percentage
(

  percentage_id INT NOT NULL,
  percentage_name VARCHAR(20) NOT NULL,
  percentage FLOAT NOT NULL,

  CONSTRAINT percentage_PK PRIMARY KEY (percentage_id)

);

CREATE TABLE deposite
(

  deposite_id INT NOT NULL,
  deposite_price FLOAT NOT NULL,
  deposite_recipt VARCHAR(100) NOT NULL,
  percentage_id INT NOT NULL,
  clint_id INT NOT NULL,
  product_id INT NOT NULL,
  auction_id INT NOT NULL,

  CONSTRAINT deposite_PK PRIMARY KEY (deposite_id),
  CONSTRAINT FK_percentage_deposite FOREIGN KEY (percentage_id) REFERENCES percentage(percentage_id),
  CONSTRAINT FK_clint_deposite FOREIGN KEY (clint_id) REFERENCES clint(clint_id),
  CONSTRAINT FK_product_deposite FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT FK_auction_deposite FOREIGN KEY (auction_id) REFERENCES auction(auction_id)

);

CREATE TABLE accept_particpation
(

  accept_particpation_id INT NOT NULL,
  acceptation NUMBER(1) NOT NULL,
  refuse_reason VARCHAR(150),
  admin_id INT NOT NULL,
  deposite_id INT NOT NULL,

  CONSTRAINT acceptation_AP_CK CHECK (acceptation IN (1,0)),
  CONSTRAINT acceptParticpation_PK PRIMARY KEY (accept_particpation_id),
  CONSTRAINT FK_admin_acceptParticpation FOREIGN KEY (admin_id) REFERENCES admin(admin_id),
  CONSTRAINT FK_deposite_acceptParticpation FOREIGN KEY (deposite_id) REFERENCES deposite(deposite_id)

);

CREATE TABLE bid
(

  bid_id INT NOT NULL,
  bid_money FLOAT NOT NULL,
  bid_time DATE NOT NULL,
  deposite_id INT NOT NULL,

  CONSTRAINT bid_PK PRIMARY KEY (bid_id),
  CONSTRAINT FK_deposite_bid FOREIGN KEY (deposite_id) REFERENCES deposite(deposite_id)

);

