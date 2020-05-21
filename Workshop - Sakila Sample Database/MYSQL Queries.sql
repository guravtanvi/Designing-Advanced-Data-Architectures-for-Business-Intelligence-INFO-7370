-- Name: Tanvi Gurav
-- NUID: 001306848

-- 1.1 Contribution of Countries & Cities (in hierarchy) by rental amount - Treemap (or Heatmap) & sql query

SELECT c.country 'AS Country',
       ci.city AS 'City',
       sum(p.amount) AS 'Total Rental Amount'
FROM country c
INNER JOIN city ci ON c.country_id = ci.country_id
INNER JOIN address a ON a.city_id = ci.city_id
INNER JOIN customer cust ON cust.address_id = a.address_id
INNER JOIN payment p ON p.customer_id = cust.customer_id
GROUP BY c.country,
         ci.city
ORDER BY sum(p.amount) DESC;


-- 1.2 Rental amounts by countries for PG & PG-13 rated films - bar chart & sql query

SELECT c.country AS 'Country',
       sum(p.amount) AS 'Total Amount for PG & PG-13'
FROM country c
INNER JOIN city ci ON c.country_id = ci.country_id
INNER JOIN address a ON a.city_id = ci.city_id
INNER JOIN customer cust ON cust.address_id = a.address_id
INNER JOIN payment p ON p.customer_id = cust.customer_id
WHERE p.rental_id IN
    (SELECT rental_id
     FROM rental
     WHERE inventory_id IN
         (SELECT inventory_id
          FROM inventory
          WHERE film_id IN
              (SELECT film_id
               FROM film
               WHERE rating IN ('PG','PG-13'))))
GROUP BY c.country
ORDER BY sum(p.amount) DESC;


-- 1.3. Top 20 cities by number of customers who rented - bar chart & sql query


SELECT ci.city AS 'City',
       count(r.customer_id) as 'Number of Customers'
FROM rental r
INNER JOIN customer cust ON r.customer_id = cust.customer_id
INNER JOIN address a ON a.address_id = cust.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
WHERE cust.customer_id in (select customer_id from rental)
GROUP BY ci.city
ORDER BY count(r.customer_id) DESC limit 20;


-- 1.4. Top 20 cities by number of films rented - bar chart & sql query

SELECT ci.city AS 'City',
       count(r.inventory_id) as 'Total Film Rentals'
FROM rental r
INNER JOIN customer cust ON r.customer_id = cust.customer_id
INNER JOIN address a ON a.address_id = cust.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
GROUP BY ci.city
ORDER BY count(r.inventory_id) DESC limit 20;


-- 1.5. Rank cities by average rental cost - bar chart & sql query

SELECT ci.city AS 'City',
       AVG(p.amount) "Average Rental Amount",
       RANK() OVER (ORDER BY AVG(p.amount) DESC) AS 'Rank'
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
AND p.customer_id = c.customer_id
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
GROUP BY ci.city
ORDER BY AVG(p.amount) DESC;



-- 2.1 Film categories by rental amount (ranked) & rental quantity – tabular& sql query

SELECT c.name AS 'Film Category',
       sum(p.amount) AS 'Total Rental Amount',
       count(r.rental_id) AS 'Rental Quantity',
       RANK() OVER (ORDER BY sum(p.amount) DESC) AS 'Rank'
FROM category AS c
INNER JOIN film_category AS f ON c.category_id = f.category_id
INNER JOIN inventory AS i ON i.film_id = f.film_id
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
INNER JOIN payment AS p ON p.rental_id = r.rental_id 
GROUP  BY c.name
ORDER  BY sum(p.amount) DESC;


-- 2.2 Film categories by rental amount (ranked) – bar chart & sql query


SELECT RANK() OVER (ORDER BY sum(p.amount) DESC) AS 'Rank',
	   c.name AS 'Film Category',
       sum(p.amount) AS 'Total Rental Amount'
FROM category AS c
INNER JOIN film_category AS f ON c.category_id = f.category_id
INNER JOIN inventory AS i ON i.film_id = f.film_id
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
INNER JOIN payment AS p ON p.rental_id = r.rental_id 
GROUP  BY c.name
ORDER  BY sum(p.amount) DESC;
 

-- 2.3 Film categories by average rental amount (ranked) & – tabular & sql query


SELECT RANK() OVER (ORDER BY avg(p.amount) DESC) AS 'Rank',
	   c.name AS 'Film Category',
       avg(p.amount) AS 'Average Rental Amount'
FROM category AS c
INNER JOIN film_category AS f ON c.category_id = f.category_id
INNER JOIN inventory AS i ON i.film_id = f.film_id
INNER JOIN rental AS r ON r.inventory_id = i.inventory_id
INNER JOIN payment AS p ON p.rental_id = r.rental_id 
GROUP  BY c.name
ORDER  BY avg(p.amount) DESC;



-- 2.4 Contribution of Film Categories by number of customers - Treemap (or Heatmap) & sql query



SELECT ct.name,
       count(r.customer_id) AS 'Number of Customers'
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id=i.inventory_id
INNER JOIN film_category AS f ON f.film_id=i.film_id
INNER JOIN category AS ct ON ct.category_id=f.category_id GROUP  BY ct.name
ORDER  BY count(r.customer_id) DESC;


-- 2.5 Contribution of Film Categories by rental amount - Treemap (or Heatmap) & sql query


SELECT ct.name,
       sum(p.amount) AS RentalAmount
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id=i.inventory_id
INNER JOIN film_category AS f ON f.film_id=i.film_id
INNER JOIN category AS ct ON ct.category_id=f.category_id
INNER JOIN payment AS p ON p.rental_id=r.rental_id GROUP  BY ct.category_id, ct.name
ORDER  BY RentalAmount DESC;


-- 3.1 List Films with rental amount, rental quantity, rating, rental rate, replacement cost and category name – tabular
-- & sql query

SELECT f.title AS films,
       f.replacement_cost,
       f.rental_rate,
       f.rating,
       sum(p.amount) AS rental_amount,
       count(r.rental_id) AS 'Rental Quantity',
       c.name AS category_name,
       c.category_id
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
GROUP BY f.title order by sum(p.amount) desc;


-- 3.2. List top 10 Films by rental amount (ranked) – bar chart & sql query

SELECT RANK() OVER (ORDER BY sum(p.amount) DESC) AS 'Rank',
	   f.title AS films,
       sum(p.amount) AS rental_amount
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rental_amount DESC
LIMIT 10;

-- 3.3. List top 20 Films by number of customers(ranked) – bar chart & sql query


SELECT row_number() OVER (ORDER BY count(r.customer_id) DESC) AS 'Rank',
                         f.title,
                         count(r.customer_id) AS COUNT
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY count(r.customer_id) DESC
LIMIT 20;


-- 3.4. List Films with the word “punk” in title with rental amount and number of customers – 
-- Tabular & sql query

SELECT f.film_id,
       f.title,
       sum(p.amount) AS rental_amount,
       count(r.customer_id)
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
WHERE f.title LIKE '%punk%'
GROUP BY film_id;


-- 3.5 Contribution by rental amount for films with a documentary category - Treemap (or Heatmap) & sql query


SELECT f.title as Films,
       sum(p.amount) AS rental_amount
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_category AS g ON i.film_id = g.film_id
INNER JOIN category AS c ON g.category_id = c.category_id
WHERE c.name LIKE '%doc%'
GROUP BY f.title
ORDER BY sum(p.amount) DESC;


-- 4.1 List Customers (Last name, First Name) with rental amount, rental quantity, active status, country and city –
-- tabular & sql query

SELECT c.first_name,
       c.last_name,
       sum(p.amount) AS RentalAmount,
       count(r.rental_id) AS Rental_Quantity,
       country.country,
       city.city,
       c.active
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id=i.inventory_id
INNER JOIN film_category AS f ON f.film_id=i.film_id
INNER JOIN category AS ct ON ct.category_id=f.category_id
INNER JOIN payment AS p ON p.rental_id=r.rental_id
INNER JOIN address AS a ON a.address_id=c.address_id
INNER JOIN city AS city ON a.city_id=city.city_id
INNER JOIN country AS country ON country.country_id=city.country_id
WHERE c.active = 1 GROUP  BY c.last_name,
                             c.first_name
  ORDER  BY c.last_name,
			c.first_name desc;



-- 4.2 List top 10 Customers (Last name, First Name) by rental amount (ranked) for PG & PG-13 rated films – bar chart
-- & sql query

SELECT c.first_name,
	   c.last_name,
       sum(p.amount) AS RentalAmount,
       fil.rating
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
INNER JOIN inventory AS i ON r.inventory_id=i.inventory_id
INNER JOIN film_category AS f ON f.film_id=i.film_id
INNER JOIN film AS fil ON fil.film_id = f.film_id
INNER JOIN category AS ct ON ct.category_id=f.category_id
INNER JOIN payment AS p ON p.rental_id=r.rental_id
WHERE fil.rating ='PG' OR fil.rating = 'PG-13' 
  GROUP  BY c.last_name,
			c.first_name
  ORDER  BY RentalAmount DESC
LIMIT 10;


-- 4.3 Contribution by rental amount for customers from France, Italy or Germany - Treemap (or Heatmap) & sql
-- query


SELECT c.first_name, c.last_name,
       SUM(p.amount) AS 'Total Rental Amount'
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON  p.rental_id = r.rental_id AND p.customer_id = c.customer_id
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country co ON co.country_id = ci.country_id
WHERE co.country='France'
  OR co.country='Italy'
  OR co.country='Germany'
GROUP BY c.customer_id
ORDER BY SUM(p.amount) DESC;


-- 4.4 List top 20 Customers (Last name, First Name) by rental amount (ranked) for comedy films – bar chart & sql
-- query

SELECT c.first_name,
       c.last_name,
       SUM(p.amount) AS 'Rental Amount',
       RANK() OVER(ORDER BY SUM(p.amount) DESC) AS 'Rank'
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
AND p.customer_id = c.customer_id
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film_category f ON f.film_id = i.film_id
INNER JOIN category fc ON fc.category_id = f.category_id
WHERE fc.name='Comedy'
GROUP BY c.first_name,
         c.last_name
ORDER BY SUM(p.amount) DESC
LIMIT 20;


-- 4.5 List top 10 Customers (Last name, First Name) from China by rental amount (ranked) for films that have
-- replacement costs greater than $24 – bar chart & sql query

SELECT c.first_name,
       c.last_name,
       SUM(p.amount) AS 'Rental Amount',
       RANK() OVER(ORDER BY SUM(p.amount) DESC) AS 'Rank'
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
AND p.customer_id = c.customer_id
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country co ON co.country_id = ci.country_id
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
WHERE co.country='China'
  AND f.replacement_cost > 24
GROUP BY c.first_name,
         c.last_name
ORDER BY SUM(p.amount) DESC
LIMIT 10;


