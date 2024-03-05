--select all catagory and sub catagory

SELECT category_name as titel , category_image as image FROM category ;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all catagory

SELECT category_name as main_catagory , category_image as image FROM category 
WHERE sub_category_id is null;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all sub catagory

SELECT category_name as All_sub_catagory , category_image as image FROM category 
WHERE sub_category_id is not null;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select all sub catagory of one main catagory

SELECT category_name as Electronics_sub_catagory , category_image as image FROM category 
WHERE sub_category_id = 
(
  SELECT category_id FROM category
  WHERE category_name = 'Electronics'
);





