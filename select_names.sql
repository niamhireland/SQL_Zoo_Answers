-- 1. Find the country that starts with Y. 
SELECT name FROM world
WHERE name LIKE 'Y%'

-- 2. Find countries that end with Y. 
SELECT name FROM world
WHERE name LIKE '%Y'

-- 3. Find countries that contain X. 
SELECT name FROM world
WHERE name LIKE '%X%'

-- 4. Find countries that end with land. 
SELECT name FROM world
WHERE name LIKE '%LAND'

-- 5. Find countries that start with C and end with ia. 
  SELECT name FROM world
  WHERE name LIKE 'C%IA'

-- 6. Find a country with oo in the name. 
SELECT name FROM world
WHERE name LIKE '%oo%'

-- 7. Find the countries that have 3 or more As in the name.
SELECT name FROM world
WHERE name LIKE '%a%a%a%'

-- 8. Find the countries with T as the second character. 
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

-- 9. Find the countries with two o characters, separated by two others. 
SELECT name FROM world
WHERE name LIKE '%o__o%'

-- 10. Find the countries with exactly four characters. 
SELECT name FROM world
WHERE LENGTH(name) = 4

-- 11. Find the country where the name is the capital city. 
SELECT name
FROM world
WHERE name = capital

-- 12. Find the country where the capital is the country plus 'City' 
SELECT name
FROM world
WHERE capital = CONCAT(name, ' City');

-- 13. Find the capital and name where the capital includes the name of the country. 
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');

--14. Find the capital and name where the capital is an extension of the country name. 
SELECT capital, name 
FROM world 
WHERE capital LIKE CONCAT('%', name, '%')
AND LENGTH(capital) > LENGTH(name);

-- 15. Show the name and the extension where the capital is a proper extension of the name of the country. 
SELECT name, REPLACE(capital, name, '') AS Extension
FROM world 
WHERE capital LIKE CONCAT(name, '%')
AND capital <> name;
