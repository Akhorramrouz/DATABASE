
-- Adel Khorramrouz,
-- ISTE 608
-- HW3 Part 1

USE WORLD;

-- q1
SELECT headOfState
 FROM country
 WHERE localName = "United States";

-- q2
 UPDATE country
 SET headOfState = "Joseph R. Biden Jr."
 WHERE localName = "United States";

 SELECT headOfState
 FROM country
 WHERE localName = "United States";

-- q3
 SELECT NAME
 FROM country
 WHERE indepYear IS NULL;

 -- q4

 SELECT name, continent
 FROM country
 WHERE population >= 1000000000 AND lifeExpectancy BETWEEN 70 AND 80;


 -- q5

 SELECT NAME
 FROM country
 WHERE continent in("North America","South America");
 