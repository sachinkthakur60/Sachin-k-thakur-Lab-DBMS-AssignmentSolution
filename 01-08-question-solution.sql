/*-----------------------------------Question 1 - solution start---------------------------------------------*/

#supplier table creation
drop table if exists `supplier`;

create table if not exists `supplier`(
`supp_id` int primary key,
`supp_name` varchar(50) not null,
`supp_city` varchar(50) not null,
`supp_phone` varchar(10) not null);

#custommer table creation
drop table if exists `customer`;

create table if not exists `customer`(
`cus_id` int not null primary key,
`cus_name` varchar(20) not null,
`cus_phone` varchar(10) not null,
`cus_city` varchar(30) not null,
`cus_gender` char);

#catagory table creation
drop table if exists `category`;

create table if not exists `category`(
`cat_id` int not null primary key,
`cat_name` varchar(50) not null);

#product table creation
drop table if exists `product`;

create table if not exists `product`(
`pro_id` int not null primary key,
`pro_name` varchar(20) not null default "Dummy product",
`pro_desc` varchar(60),
`cat_id` int not null,
foreign key (`cat_id`) references category(`cat_id`));

#supplier pricing table creation
drop table if exists `supplier_pricing`;

create table if not exists `supplier_pricing`(
`pricing_id` int not null primary key,
`pro_id` int not null,
`supp_id` int not null,
`supp_price` int default 0,
foreign key (`pro_id`) references product(`pro_id`),
foreign key (`supp_id`) references supplier(`supp_id`));

#order table creation
drop table if exists `order`;

create table if not exists `order`(
`ord_id` int not null primary key,
`ord_amount` int not null,
`ord_date` date,
`cus_id` int not null,
`pricing_id` int not null,
foreign key (`cus_id`) references customer (`cus_id`),
foreign key (`pricing_id`) references supplier_pricing (`pricing_id`)
);

#rating table creation
drop table if exists `rating`;

create table if not exists `rating` (
`rat_id` int not null primary key,
`ord_id` int not null,
`rat_ratstars` int not null,
foreign key (`ord_id`) references `order` (`ord_id`)
);

/*-----------------------------------Question 1 - solution end-----------------------------------------------*/


/*-----------------------------------Question 2 - solution start---------------------------------------------*/

#supplier detaails insertion
#single data insertion
insert into supplier values (1, "Rajesh Retails","Delhi",'1234567890');
insert into supplier values (2,"Appario Ltd.","Mumbai",'2589631470');
insert into supplier values (3,"Knome products","Banglore",'9785462315');
insert into supplier values (4,"Bansal Retails","Kochi",'8975463285');
insert into supplier values (5,"Mittal Ltd.","Lucknow",'7898456532');

#multi data insertion
/*
insert into supplier values (1, "Rajesh Retails","Delhi",'1234567890'),
(2,"Appario Ltd.","Mumbai",'2589631470'),
(3,"Knome products","Banglore",'9785462315'),
(4,"Bansal Retails","Kochi",'8975463285'),
(5,"Mittal Ltd.","Lucknow",'7898456532');
*/

#customer details insertion
#single data insertion
insert into customer values (1,"AAKASH",'9999999999',"DELHI",'M');
insert into customer values (2,"AMAN",'9785463215',"NOIDA",'M');
insert into customer values (3,"NEHA",'9999999999',"MUMBAI",'F');
insert into customer values (4,"MEGHA",'9994562399',"KOLKATA",'F');
insert into customer values (5,"PULKIT",'7895999999',"LUCKNOW",'M');

#multi data insertion
/*
insert into customer values (1,"AAKASH",'9999999999',"DELHI",'M'),
(2,"AMAN",'9785463215',"NOIDA",'M'),
(3,"NEHA",'9999999999',"MUMBAI",'F'),
(4,"MEGHA",'9994562399',"KOLKATA",'F'),
(5,"PULKIT",'7895999999',"LUCKNOW",'M');
*/

#category data insertion
#single data insertion
insert into category values ( 1,"BOOKS");
insert into category values (2,"GAMES");
insert into category values (3,"GROCERIES");
insert into category values (4,"ELECTRONICS");
insert into category values (5,"CLOTHES");

#multi data insertion
/*
insert into category values ( 1,"BOOKS"), (2,"GAMES"), (3,"GROCERIES"), (4,"ELECTRONICS"), (5,"CLOTHES");
*/

#product data insertion
insert into product values (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product values (2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
insert into product values (3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into product values (4,"OATS","Highly Nutritious from Nestle",3);
insert into product values (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into product values (6,"MILK","1L Toned MIlk",3);
insert into product values (7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
insert into product values (8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
insert into product values (9,"Project IGI","compatible with windows 7 and above",2);
insert into product values (10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product values (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into product values (12,"Train Your Brain","By Shireen Stephen",1);

#supplier pricing data insertion
insert into supplier_pricing values (1,1,2,1500);
insert into supplier_pricing values (2,3,5,30000);
insert into supplier_pricing values (3,5,1,3000);
insert into supplier_pricing values (4,2,3,2500);
insert into supplier_pricing values (5,4,1,1000);
insert into supplier_pricing values (6,12,2,780);
insert into supplier_pricing values (7,12,4,789);
insert into supplier_pricing values (8,3,1,31000);
insert into supplier_pricing values (9,1,5,1450);
insert into supplier_pricing values (10,4,2,999);
insert into supplier_pricing values (11,7,3,549);
insert into supplier_pricing values (12,7,4,529);
insert into supplier_pricing values (13,6,2,105);
insert into supplier_pricing values (14,6,1,99);
insert into supplier_pricing values (15,2,5,2999);
insert into supplier_pricing values (16,5,2,2999);

#order data insertion
insert into `order` values (101,1500,"2021-10-06",2,1);
insert into `order` values (102,1000,"2021-10-12",3,5);
insert into `order` values (103,30000,"2021-09-16",5,2);
insert into `order` values (104,1500,"2021-10-05",1,1);
insert into `order` values (105,3000,"2021-08-16",4,3);
insert into `order` values (106,1450,"2021-08-18",1,9);
insert into `order` values (107,789,"2021-09-01",3,7);
insert into `order` values (108,780,"2021-09-07",5,6);
insert into `order` values (109,3000,"2021-0-10",5,3);
insert into `order` values (110,2500,"2021-09-10",2,4);
insert into `order` values (111,1000,"2021-09-15",4,5);
insert into `order` values (112,789,"2021-09-16",4,7);
insert into `order` values (113,31000,"2021-09-16",1,8);
insert into `order` values (114,1000,"2021-09-16",3,5);
insert into `order` values (115,3000,"2021-09-16",5,3);
insert into `order` values (116,99,"2021-09-17",2,14);

#rating data insertion
insert into rating values (1,101,4);
insert into rating values (2,102,3);
insert into rating values (3,103,1);
insert into rating values (4,104,2);
insert into rating values (5,105,4);
insert into rating values (6,106,3);
insert into rating values (7,107,4);
insert into rating values (8,108,4);
insert into rating values (9,109,3);
insert into rating values (10,110,5);
insert into rating values (11,111,3);
insert into rating values (12,112,4);
insert into rating values (13,113,2);
insert into rating values (14,114,1);
insert into rating values (15,115,1);
insert into rating values (16,116,0);

/*-----------------------------------Question 2 - solution end---------------------------------------------*/


/*-----------------------------------Question 3 - solution start---------------------------------------------*/

select count(cus_gender) as TotalNoOfCustomers, cus_gender 
from ( select cus_gender, cus_name from customer as cus
inner join (
select ord_id, cus_id from `order` where ord_amount >= '3000'
)
as o
on cus.cus_id = o.cus_id
group by cus.cus_id
)
as T
group by cus_gender;

/*-----------------------------------Question 3 - solution end---------------------------------------------*/

/*-----------------------------------Question 4 - solution start---------------------------------------------*/

select cus_name, pro_name, ord_id, ord_date, ord_amount from customer as c, product p, supplier_pricing as sp, 
`order` as o 
where c.cus_id = '2'
and c.cus_id = o.cus_id
and p.pro_id = sp.pro_id
and o.pricing_id = sp.pricing_id;

/*-----------------------------------Question 4 - solution end---------------------------------------------*/

/*-----------------------------------Question 5 - solution start---------------------------------------------*/

select sup.supp_id, supp_name, supp_city, supp_phone 
from supplier as sup
inner join
(
select * from supplier_pricing group by 
supp_id having count(supp_id) > 1 
) as sp
on sup.supp_id = sp.supp_id;

/*-----------------------------------Question 5 - solution end---------------------------------------------*/

/*-----------------------------------Question 6 - solution start---------------------------------------------*/

select cat.cat_id, cat_name, pro_id, pro_name, min(min_price) from category as cat
inner join
(
select prod.pro_id, pro_name, cat_id, min_price from product as prod
inner join
(select pro_id as pro_id, min(supp_price) as min_price from supplier_pricing 
group by pro_id) as sp
on prod.pro_id = sp.pro_id)
as pro_sp
on cat.cat_id = pro_sp.CAT_ID
group by cat_id;

/*-----------------------------------Question 6 - solution end---------------------------------------------*/

/*-----------------------------------Question 7 - solution start---------------------------------------------*/

select p.pro_id, p.pro_name from product as p 
inner join 
(
select pro_id, sp.pricing_id from supplier_pricing as sp
inner join
(select pricing_id from `order` where ord_date > "2021-10-05") as o
on sp.pricing_id = o.pricing_id
) as sp_o
on p.pro_id = sp_o.pro_id;


/*-----------------------------------Question 7 - solution end---------------------------------------------*/

/*-----------------------------------Question 8 - solution start---------------------------------------------*/

select customer.cus_name,customer.cus_gender from customer 
where customer.cus_name like 'A%' or customer.cus_name like '%A';

/*-----------------------------------Question 8 - solution start---------------------------------------------*/

/*-----------------------------------Question 9 - solution start---------------------------------------------*/

call displaySupplierDetails();

/*-----------------------------------Question 9 - solution end---------------------------------------------*/