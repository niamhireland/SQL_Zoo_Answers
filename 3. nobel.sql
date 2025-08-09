-- 1. Display Nobel prize details for 1950. 
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- 2. Show the 1962 winner for literature. 
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature'

-- 3. Show the year and subject that won Albert Einstein his prize. 
SELECT yr, subject
FROM nobel 
WHERE winner = 'Albert Einstein'

-- 4. Give the peace prize winners for 2000 onwards (including 2000).
SELECT winner 
FROM nobel 
WHERE yr >= 2000
AND subject = 'peace'

-- 5. All details for literature prize winners for 1980 to 1989
SELECT *
FROM nobel 
WHERE subject = 'literature' 
AND yr BETWEEN 1980 AND 1989

-- 6. Show all details of the presidential winners Barack Obama, Jimmy Carter, Theodore Roosevelt, Thomas Woodrow Wilson.
SELECT * FROM nobel
WHERE winner IN ('Barack Obama', 'Jimmy Carter', 'Thomas Woodrow Wilson', 'Theodore Roosevelt')

-- 7. Show the winners with first name John 
SELECT winner
FROM nobel 
WHERE winner LIKE 'John%'

-- 8. Show the year, subject and name of physics winners from 1980, as well as chemistry winners for 1984
SELECT * 
FROM nobel 
WHERE (subject = 'physics' AND yr = 1980)
OR (subject = 'chemistry' AND yr = 1984)

-- 9. Show the year, subject and name of winners for 1980 excluding chemistry and medicine
SELECT * 
FROM nobel
WHERE subject NOT IN ('chemistry', 'medicine') AND yr = 1980

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT * 
FROM nobel 
WHERE (subject = 'medicine' AND yr < 1910)
OR (subject = 'literature' AND yr >= 2004)

-- 11. Find all details of the prize won by PETER GRÜNBERG
SELECT * 
FROM nobel 
WHERE winner = 'Peter Grunberg'

-- 12. Find all details of the prize won by EUGENE O'NEILL
SELECT * 
FROM nobel 
WHERE winner = "Eugene O'Neill"

-- 13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel 
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

-- 14. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
FROM nobel
WHERE yr=1984
 ORDER BY CASE 
WHEN subject IN ('physics', 'chemistry') THEN 1 
ELSE 0
END
