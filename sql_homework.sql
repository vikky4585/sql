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
left join address as a on s.address_id = a.address_id

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
 


 

