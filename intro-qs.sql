--Week 5 - Monday Questions
--1. How many actors are there with the last name ‘Wahlberg’?
--Answer: 2
SELECT COUNT(first_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--Answer: 5607
SELECT COUNT(payment)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)
--Answer: film 193, 'Crossroads Casualties'
SELECT film_id,COUNT(inventory_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT DESC;

SELECT title
FROM film
WHERE film_id = 193;

--4. How many customers have the last name ‘William’?
--Answer: 0 (closest is Williams)
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';

--Check:
SELECT last_name
FROM customer
ORDER BY last_name DESC;

--5. What store employee (get the id) sold the most rentals?
--Answer: staff_id is 1 (8040)
SELECT COUNT(*)
FROM rental; --total rentals <> 16044

SELECT COUNT(*)
FROM rental
WHERE staff_id = 1; --8040 rentals

SELECT COUNT(*)
FROM rental
WHERE staff_id = 2; --8004 rentals

--6. How many different district names are there?
--Answer: 378
SELECT COUNT(DISTINCT district)
FROM address
WHERE district IS NOT NULL;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Answer: film 508, 'Lambs Cincinnati'
SELECT film_id,COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;

SELECT title
FROM film
WHERE film_id = 508;

--Check with:
SELECT actor_id
FROM film_actor
WHERE film_id = 508;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--Answer: 21
SELECT COUNT(customer_id)
FROM customer
WHERE last_name LIKE '_%es';

--Check with:
SELECT customer_id,last_name
FROM customer
WHERE last_name LIKE '_%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--Answer: 2
SELECT COUNT(DISTINCT amount)
FROM payment
GROUP BY customer_id BETWEEN 380 and 430
HAVING COUNT(*) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
--Answer: 5, PG-13
SELECT rating,COUNT(rating)
FROM film
GROUP BY rating
ORDER by COUNT DESC;