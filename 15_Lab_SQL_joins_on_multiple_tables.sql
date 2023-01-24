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
Expected output:

Action		111.61
Animation	111.02
Children	109.80
Classics	111.67
Comedy	115.83
Documentary	108.75
Drama	120.84
Family		114.78
Foreign	121.70
Games	127.84
Horror		112.48
Music		113.65
New		111.13
Sci-Fi		108.20
Sports		128.20
Travel		113.32
Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
Expected output:

Sports		128.20
Games	127.84
Foreign	121.70
Drama	120.84
Comedy	115.83
Display the top 5 most frequently(number of times) rented movies in descending order.
Expected output:

BUCKET BROTHERHOOD
ROCKETEER MOTHER
FORWARD TEMPLE
GRIT CLOCKWORK
JUGGLER HARDLY
List the top five genres in gross revenue in descending order.
Expected output:

Sports		5314.21
Sci-Fi		4756.98
Animation	4656.30
Drama	4587.39
Comedy	4383.58
Is "Academy Dinosaur" available for rent from Store 1?
Expected output:

ACADEMY DINOSAUR	1