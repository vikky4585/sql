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
 

