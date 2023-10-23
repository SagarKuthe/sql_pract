Create database cars;
use cars;

-- 1. Reading the Data--
select * from car_dekho;

-- 2. total count of cars --
select count(name) as total_count
from car_dekho;

-- 3. The Manager asked to the Employee how many cars are available in 2023?--
select count(*) as cars_in_2023
from car_dekho
where year="2023";

-- 4.The Manager asked to the Employee how many cars are available in 2020,2021,2022?
select count(*)
from car_dekho
where year=2020 or year=2021 or year=2022;

-- by using group by method--
select count(*)
from car_dekho
where year in(2020,2021,2022)
group by year; 

-- 5.The client asked me to print the total of all cars by years. I am not interested in the entrie details?
select year,count(*)
from car_dekho
group by year;

-- 6. Client asked to the car dealer agent how many Diesel cars will be there in 2020?
select count(*)
from car_dekho
where fuel="Diesel" and year = 2020;

-- 7. Client Requested to the car dealer agent how many Petrol cars will be there in 2020?
select count(*)
from car_dekho
where fuel="Petrol" and year="2020";

-- 8. The Manager told the Employee to give the print of all the fuel cars( Petrol , Diesel and CNG) come by all year--
select year, count(*)
from car_dekho
where fuel in ("Petrol","Diesel","CNG")
group by year;

-- 9. Manager said there were More than 100 cars in given year, which year had more than 100 cars?
select year , count(*) as count_cars
from car_dekho
group by year
having count_cars > 100;

-- 10. The Manager said to the employee all cars count details between 2015 and 2023, we need a complete list?
select year,count(*)
from car_dekho
group by year
having year between 2015 and 2023;

-- 11. The Manager said to the employee all cars details between 2015 and 2023, we need a complete list?
select * from car_dekho
where year between 2015 and 2023;