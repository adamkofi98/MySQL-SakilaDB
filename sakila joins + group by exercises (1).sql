/* 1) Use `INNER JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address` */
select first_name, last_name, address
from address
inner join staff
on staff.address_id = address.address_id

  
/* 2) Use `INNER JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`. */
select payment.staff_id, first_name, last_name, sum(amount) as total_amount
from payment
inner join staff
on staff.staff_id = payment.staff_id
where payment_date like "2005-08-%"
group by payment.staff_id;


/* 3) Write a query  to find the staff_id,name(last_name) along with their manager_id and name(last_name).*/
SELECT s.staff_id,s.last_name,st.manager_staff_id,s.last_name AS manager_name
FROM staff AS s
JOIN store AS st
ON s.store_id = st.store_id;
 

/* 4) List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join. */
select film.title, count(actor_id)
from film
join film_actor
on  film.film_id = film_actor.film_id
group by film.film_id


/* 5) Write a query to get the department name and number of employees in the department. */



/* 6) How many copies of the film `Hunchback Impossible` exist in the inventory system? */
select count(inventory.film_id), title
from inventory
join film
on inventory.film_id = film.film_id
where title = "Hunchback Impossible";

/* 7) Using the tables `payment` and `customer` and the `INNER JOIN` command, list the total paid by each customer. List the customers
 alphabetically by last name: */
select last_name, sum(amount)
from payment
inner join customer
on payment.customer_id = customer.customer_id
group by last_name
order by last_name asc;


/* 8) Which actor has appeared in the most films? */
select last_name,first_name, count(film_id) as no_of_films
from actor 
join film_actor 
on actor.actor_id = film_actor.actor_id 
group by last_name, first_name 
order by no_of_films desc 
limit 1;