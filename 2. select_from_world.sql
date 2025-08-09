-- 1. Show name, continent and population of all countries. 
SELECT name, continent, population 
FROM world

-- 2. Show the name of the countries with at least 200 million people. 
SELECT name FROM world
WHERE population >= 200000000

-- 3. Give the name and per capita GDP of countries with at least 200 million people. 
SELECT name, (gdp / population) AS per_capita_gdp
FROM world 
WHERE population >= 200000000

-- 4. Show the name and population for the countries of the continent South America
SELECT name, (population / 1000000) AS population
FROM world 
WHERE continent = 'South America'

-- 5. Show name and population for France, Germany, Italy
SELECT name, population
FROM world 
WHERE name IN ('France', 'Germany', 'Italy')

-- 6. Show the countries whose name includes the word 'United' 
SELECT name 
FROM world 
WHERE name LIKE '%United%'

--7. Show the countries that have an area of more than 3 million sq km or a population of more than 250 million. 
SELECT name, population, area 
FROM world
WHERE population > 250000000
OR area > 3000000

-- 8. Show countries that are big by area or big by population but not both. 
SELECT name, population, area 
FROM world 
WHERE (population < 250000000
AND area > 3000000) OR 
(population > 250000000
AND area < 3000000)

-- 9. Show name and population in millions and GDP in billions for the South American countries, using ROUND() to show the values to two decimal places. 
SELECT name, 
ROUND(population / 1000000.0, 2) AS population,
ROUND(gdp / 1000000000.0, 2) AS gdp
FROM world 
WHERE continent = 'South America'

-- 10. Show the name and per capita GDP for countries with a GDP of at least 1 trillion, rounded to the nearest 1000. 
SELECT name, 
ROUND(gdp / population, -3) AS per_capita_gdp 
FROM world 
WHERE gdp >= 1000000000000

-- 11. Show the name and capital where name and capital have the same number of characters. 
SELECT name, capital 
FROM world 
WHERE LENGTH(name) = LENGTH(capital)

-- 12. Show the name and capital where the first letters of each match (but not where they are the same word). 
SELECT name, capital 
FROM world 
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital

-- 13. Find the country that has all the vowels and no spaces in the name. 
SELECT name
FROM world 
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'
