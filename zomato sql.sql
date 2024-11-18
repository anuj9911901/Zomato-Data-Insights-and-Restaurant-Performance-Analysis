-- create database
create database food;

-- use database
use food;

-- Describe the Table
desc zomato;

-- Add a Primary Key
ALTER TABLE zomato
ADD PRIMARY KEY (restaurant_id);

-- Retrieve all rows and columns from the zomato table
select * from zomato;

-- Retrieve the first 10 rows from the zomato table
select * from zomato limit 10;

-- Count the total number of rows in the zomato table
select count(*) from zomato;


-- Calculate the minimum, maximum, and average ratings from the zomato table, rounded to 2 decimal places
select
round(min(rating), 2) as min_rating,
round(max(rating), 2)as max_rating,
round(avg(rating), 2) as avg_rating
From zomato;


-- Calculate the minimum, maximum, and average number of ratings from the zomato table, rounded to 2 decimal places
select
round(min(num_of_ratings),2) as min_num_of_ratings,
round(max(num_of_ratings),2) as max_num_of_ratings,
round(avg(num_of_ratings),2) as avg_num_of_ratings
from zomato;


-- Calculate the minimum, maximum, and average of the average cost from the zomato table, rounded to 2 decimal places
select
round(min(avg_cost),2) as min_avg_cost,
round(max(avg_cost),2) as max_avg_cost,
round(avg(avg_cost),2) as avg_avg_cost
from zomato;

-- Count the frequency of each rating in the zomato table, grouped by rating, and sorted in descending order
select rating, count(*) as frequency
from zomato
group by rating
order by rating desc;


/*Count the frequency of each rating in the zomato table, group by rating, 
sort the results by rating in descending order, and limit the output to the top 10 ratings*/
select rating, count(*) as frequency
from zomato
group by rating
order by rating desc
limit 10;


-- Retrieve the restaurant names and their ratings from the zomato table 
-- where the rating is greater than 4.5
select restaurant_name,rating 
from zomato
 where rating>4.5;


-- Calculate the frequency of each average cost in the zomato table, 
-- group the data by average cost, and order the results by avg_cost in descending order
select avg_cost, count(*) as frequency
from zomato
group by avg_cost
order by avg_cost desc;

/* show the top 10 restaruant name and rating
where rating is greaterthan 4.5*/
select restaurant_name, rating from zomato
where rating>4.5 order by rating desc limit 10; 

/* show all the restaurant detail which provide online order facility*/
select * from zomato
where online_order = 'yes';

-- what are the avg rating and avg cost for restaurants that offer online orders compared to those that don't?

select online_order, round(avg(rating),2) as avg_rate,
round(avg(avg_cost),2) as avg_cost
from zomato
group by online_order;


-- Calculate the average rating and average cost for each table_booking option from the zomato table
-- Group the results by the table_booking column
select table_booking, round(avg(rating),2) as avg_rate,
round(avg(avg_cost),2) as avg_cost
from zomato
group by table_booking;

/*what are the average rating and average cost for the top 10 most common cuisines types?*/
select cuisines_type, round(avg(rating),2) as avg_rate,
round(avg(avg_cost),2) as avg_cost
from zomato
group by cuisines_type
order by count(*) desc
limit 10;


/* show the top rating according to restarrant type*/
select restaurant_type, round(avg(rating),2) as avg_rating
from zomato
group by restaurant_type
order by avg_rating desc;

-- Calculate the average rating for each area from the zomato table,
-- Group the results by area and order them by the average rating in descending order
select area, round(avg(rating),2) as avg_rating
from zomato
group by area
order by avg_rating desc;

/* what are the avg rating, avg cost and the number of restaurants in the top 10 areas with the most restaurants?*/
select area, round(avg(rating),2) as avg_rating,
round(avg(avg_cost),2) as avg_cost,
count(*) as num_restaurants
from zomato
group by area 
order by num_restaurants desc
limit 10;


/* what  are the top 10 highest- rated restaurants, considering both rating and number of rating*/
select restaurant_name, rating, num_of_ratings, avg_cost,area
from zomato 
order by rating desc, num_of_ratings desc
limit 10;

/* what are the top 10 most expensive restaurants based on the avg cost for two people*/
select restaurant_name, avg_cost, rating, num_of_ratings, area
from zomato
order by avg_cost desc
limit 10;

-- what are the top 10 restaurants with the highest number of rating?
select restaurant_name, num_of_ratings, rating, avg_cost, area
from zomato
order by num_of_ratings desc
limit 10;

-- list restaurants where the avg cost for 2 people is higher than the overall avg cost, but the rating is below avg rating

select restaurant_name, avg_cost, rating
from zomato
where avg_cost > (select avg(avg_cost) from zomato)
and rating < (select avg (rating) from zomato);

/* find the top 5 areas with the highest  number of restaurants that have online ordering available*/
select area, count(*) as num_of_restaurants
from zomato
where online_order = 'yes'
group by area
order by num_of_restaurants desc
limit 5;

/* identify the avg rating of restaurant in each area that offer a specific cuisine type, eg 'chinese'*/
select area, round(avg(rating),2) as avg_rating
from zomato
where cuisines_type like '%chinese%'
group by area 
order by avg_rating desc;


