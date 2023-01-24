use sakila;
# 1) Which actor has appeared in the most films?
select * from actor; 
select * from film_actor;
select first_name, last_name, count(film_id) from actor inner join film_actor using (actor_id) 
group by actor_id order by count(film_id) DESC limit 1;

# 2) Most active customer (the customer that has rented the most number of films)
select * from customer;
select * from rental;
select first_name, last_name, count(rental_id) from customer inner join rental using (customer_id) 
group by customer_id order by count(rental_id) DESC limit 1;

# 3) List number of films per category.
select * from film_category;
select * from film;
select * from category;
select name, count(category_id) from category inner join film_category using (category_id) 
group by category_id order by name;

# 4) Display the first and last names, as well as the address, of each staff member.
select * from staff;
select * from address;
select first_name, last_name, address from staff inner join address using (address_id);

# 5) get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT * from film;
SELECT * from language;

SELECT title, name from sakila.film
INNER JOIN sakila.language using (language_id)
WHERE title like "M%" and name = "English" or "Italian"
ORDER BY title DESC;

# 6) Display the total amount rung up by each staff member in August of 2005.
SELECT * from staff;
SELECT * from payment;
SELECT first_name, last_name, sum(amount) from sakila.staff
INNER JOIN sakila.payment using (staff_id)
WHERE payment_date between "2005-08-01" and "2005-08-31" 
GROUP BY staff_id
ORDER BY first_name;

# 7) List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) from sakila.film
LEFT JOIN sakila.film_actor using (film_id)
GROUP BY film_id
ORDER BY count(actor_id) DESC, title;

# 8) Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT first_name, last_name, sum(amount) from sakila.customer
INNER JOIN sakila.payment using (customer_id)
GROUP BY customer_id
ORDER BY last_name;

# 9) Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT * from actor;
SELECT * from film_actor;
SELECT first_name, last_name from sakila.actor
INNER JOIN sakila.film_actor using (actor_id)
WHERE film_id = "";

# 10) get the addresses that have NO customers, and ends with the letter "e"
SELECT * from sakila.address;
SELECT * from sakila.customer;
SELECT address from sakila.address
LEFT JOIN sakila.customer using (address_id)
WHERE address like "%e" and postal_code like "";

# 11) Optional: what is the most rented film?
SELECT title, count(return_date) from sakila.rental
JOIN sakila.inventory using (inventory_id)
JOIN sakila.film using (film_id)
GROUP BY title
ORDER BY count(return_date) DESC
LIMIT 1;

