# 1)Write a query to display for each store its store ID, city, and country.
SELECT * from sakila.city;
SELECT store_id, city, country from sakila.address
JOIN sakila.store using (address_id)
JOIN sakila.city using (city_id)
JOIN sakila.country using (country_id);

# 2) Write a query to display how much business, in dollars, each store brought in.
SELECT * from sakila.payment;
SELECT store_id, sum(amount) from sakila.store
JOIN sakila.staff using (store_id)
JOIN sakila.payment using (staff_id)
GROUP BY store_id;

# 3) What is the average running time(length) of films by category?
SELECT * from sakila.category;
SELECT name, avg(`length`) from sakila.category
JOIN sakila.film_category using (category_id)
JOIN sakila.film using (film_id)
GROUP BY name
ORDER BY name;

# 4) Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT name, avg(`length`) from sakila.category
JOIN sakila.film_category using (category_id)
JOIN sakila.film using (film_id)
GROUP BY name
ORDER BY avg(`length`) DESC;

# 5) Display the top 5 most frequently(number of times) rented movies in descending order.
SELECT title, count(return_date) from sakila.rental
JOIN sakila.inventory using (inventory_id)
JOIN sakila.film using (film_id)
GROUP BY title
ORDER BY count(return_date) DESC
LIMIT 5;


# 6) List the top five genres in gross revenue in descending order.
SELECT * from sakila.film;
SELECT name "genre", sum(amount) "amount" 
FROM sakila.category
JOIN sakila.film_category using (category_id)
JOIN sakila.film using (film_id)
JOIN sakila.inventory using (film_id)
JOIN sakila.rental using (inventory_id)
JOIN sakila.payment using (rental_id)
GROUP BY genre
ORDER BY amount desc
LIMIT 5;

# 7) Is "Academy Dinosaur" available for rent from Store 1?
SELECT * from sakila.inventory;

SELECT title, store_id from sakila.store
JOIN sakila.inventory using (store_id)
JOIN sakila.film using (film_id)
WHERE title = "Academy Dinosaur" AND store_id = 1
GROUP BY title;
