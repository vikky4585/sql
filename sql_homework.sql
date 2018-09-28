use sakila;

#1a
select first_name, last_name from actor;
#1b
select concat(first_name,' ', last_name) as 'Actor Name' from actor;

#2a
select actor_id,first_name,last_name from actor where first_name = 'Joe';

#2b
select * from actor where last_name like '%GEN%';

#2c
select * from actor where last_name like '%LI%' order by last_name,first_name;

#2d
select country_id,country from country where country in ('Afghanistan','Bangladesh','China');

#3a
alter table actor add column middle_name blob after first_name;

#3c
alter table actor drop column middle_name;

#4a
select last_name,count(last_name) from actor group by last_name; 

#4b
select last_name,count(last_name) from actor group by last_name having count(last_name) >=2; 

#4c
update actor set first_name = 'HARPO' where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

#4d
update actor set first_name = 'GROUCHO' where first_name = 'HARPO' and last_name = 'WILLIAMS';

update actor set first_name = 'MUCHO GROUCHO' where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

#5a

show create table address;

#6a
select s.first_name, s.last_name, a.address
from staff as s 
left join address as a on s.address_id = a.address_id;

#6b

select s.first_name, s.last_name, sum(p.amount) as 'Total Amount'
from staff as s 
left join payment as p on s.staff_id = p.staff_id
where payment_date like '2005-08%'
group by s.staff_id;

#6c

select f.title , count(fa.actor_id) as 'Number Of Actors'
from film as f
inner join film_actor as fa where f.film_id = fa.film_id
group by f.film_id;

 #6d
 select count(*) from inventory
 where film_id in (select film_id from film where title='Hunchback Impossible');
 
 #6e
 
 select c.first_name, c.last_name, sum(p.amount) as 'Total Amount Paid'
 from customer as c
 inner join payment as p where c.customer_id = p.payment_id
 group by c.customer_id
 order by c.last_name;
 
 #7a
 
 select * from film where
 title like 'K%' or title like 'Q%'
 and language_id in (select language_id from language where name= 'English');
 
 #7b
 
 select * from actor
 where actor_id in 
 (select actor_id from film_actor where film_id in 
 (select film_id from film where title = 'Alone Trip'));
 
#7c

select first_name,last_name,email from customer 
where address_id in 
(select address_id from address where city_id in
(select city_id from city where country_id in
(select country_id from country where
country = 'Canada')));

#7d
select * from film
where film_id in (
select film_id from film_category
where category_id in
(select category_id from category where name = 'Family'));

#7e
select title, count(rental_id) as 'Time Rented' from film
inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
group by film.film_id
order by count(rental_id) desc;

#7f

select s.store_id,sum(p.amount)  from store as s
inner join inventory as i on s.store_id = i.store_id
inner join rental as r on i.inventory_id = r.inventory_id
inner join payment as p on r.rental_id = p.rental_id
group by s.store_id;

#7g

select s.store_id, ci.city, co.country from store as s
inner join address as a on s.address_id = a.address_id
inner join city as ci on a.city_id = ci.city_id
inner join country as co on ci.country_id = co.country_id;

#7h

select c.name, sum(p.amount) from category as c
inner join film_category as fc on c.category_id = fc.category_id
inner join inventory as i on fc.film_id = i.film_id
inner join rental as r on i.inventory_id = r.inventory_id
inner join payment as p on r.rental_id = p.rental_id
group by c.name
order by sum(p.amount) desc limit 5;


#8a
create view top_five_genres as
select c.name, sum(p.amount) from category as c
inner join film_category as fc on c.category_id = fc.category_id
inner join inventory as i on fc.film_id = i.film_id
inner join rental as r on i.inventory_id = r.inventory_id
inner join payment as p on r.rental_id = p.rental_id
group by c.name
order by sum(p.amount) desc limit 5;

#8b

select * from top_five_genres;


#8c

drop view top_five_genres;


 

