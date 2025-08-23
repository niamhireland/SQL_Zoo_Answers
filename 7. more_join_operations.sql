-- 1. List the films where the yr is 1962 and the budget is over 2000000.
SELECT id, title
FROM movie
WHERE yr=1962 AND budget < 2000000 

-- 2. Give year of 'Citizen Kane'.
SELECT yr 
FROM movie 
WHERE title = 'Citizen Kane'

  -- 3. List all of the Star Trek movies, include the id, title and yr. Order results by year. 
SELECT id, title, yr 
FROM movie 
WHERE title LIKE "Star Trek%"
ORDER BY yr 

-- 4. What id number does the actor 'Glenn Close' have?
SELECT id 
FROM actor 
WHERE name = 'Glenn Close'

-- 5. What is the id of the 1942 film 'Casablanca'
SELECT id 
FROM movie 
WHERE title = 'Casablanca' AND yr = 1942

-- 6. Obtain the cast list for 1942's 'Casablanca'.
SELECT name AS castlist
FROM actor JOIN casting ON (casting.actorid = actor.id) 
WHERE casting.movieid = 132689

-- 7. Obtain the cast list for the film 'Alien'.
SELECT actor.name AS castlist
FROM movie, actor, casting
WHERE movie.title = 'Alien' 
AND actor.id = casting.actorid AND movie.id = casting.movieid

-- 8. List the films in which 'Harrison Ford' has appeared. 
SELECT movie.title AS harrison_movie 
FROM movie, casting, actor
WHERE actor.name = 'Harrison Ford'
AND casting.actorid = actor.id AND movie.id = casting.movieid

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
SELECT movie.title AS harrison_movies 
FROM movie, casting, actor
WHERE actor.name = 'Harrison Ford'
AND casting.actorid = actor.id 
AND movie.id = casting.movieid
AND ord <> 1

-- 10. List the films together with the leading star for all 1962 films.
SELECT movie.title AS film, actor.name AS star
FROM movie, actor, casting
WHERE movie.yr = 1962 AND casting.ord = 1
AND casting.actorid = actor.id 
AND movie.id = casting.movieid

-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT movie.yr,COUNT(movie.title) AS movies
FROM movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE actor.name='Rock Hudson'
GROUP BY movie.yr
HAVING COUNT(title) > 2

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT movie.title AS film_title, actor.name AS actor
FROM movie, actor, casting
WHERE movieid IN (SELECT movie.id FROM movie, actor, casting 
WHERE actor.name = 'Julie Andrews' 
AND movie.id = casting.movieid 
AND actor.id = casting.actorid) 
AND movie.id = casting.movieid 
AND actor.id = casting.actorid
AND ord = 1

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name 
FROM actor JOIN casting ON (casting.actorid = actor.id)
WHERE ord = 1
GROUP BY name
HAVING COUNT(name) >= 15

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) AS actor_count
FROM movie JOIN casting ON (casting.movieid = movie.id) 
WHERE yr = 1978 
GROUP BY title
ORDER BY 2 DESC, 1

-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT name 
FROM actor JOIN casting ON (casting.actorid = actor.id)
WHERE name <> 'Art Garfunkel'
AND movieid IN (SELECT movieid FROM actor, casting 
WHERE name = 'Art Garfunkel' AND casting.actorid = actor.id)
