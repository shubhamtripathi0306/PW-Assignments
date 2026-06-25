use world;

## Question 1: Count how many cities are there in each country

SELECT Country_Name,
COUNT(City.ID) AS Total_Cities
FROM Country
INNER JOIN City
ON Country.Code = City.CountryCode
GROUP BY Country_Name;

## Question 2:  Display all continents having more than 30 countries.

SELECT Continent,
COUNT(*) AS Total_Countries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;

## Question 3: List regions whose total population exceeds 200 million

SELECT Region,
SUM(Population) AS Total_Population
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;

## Question 4: Find the top 5 continents by average GNP per country

SELECT Continent,
avg(GNP) as Avg_GNP
FROM Country
GROUP BY Continent
ORDER BY Avg_GNP DESC
LIMIT 5;

## Question 5: Find the total number of official languages spoken in each continent

SELECT c.Continent,
COUNT(cl.Language) AS Total_Official_Languages
FROM Country c
JOIN CountryLanguage cl
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial='T'
GROUP BY c.Continent;

## Question 6: Find the maximum and minimum GNP for each continent

SELECT Continent,
MAX(GNP) AS Maximum_GNP,
MIN(GNP) AS Minimum_GNP
FROM Country
GROUP BY Continent;

## Question 7: Find the country with the highest average city population

SELECT Country_Name,
AVG(City.Population) AS Avg_City_Population
FROM Country
JOIN City
ON Country.Code = City.CountryCode
GROUP BY Country_Name
ORDER BY Avg_City_Population DESC
LIMIT 1;

## Question 8 : List continents where the average city population is greater than 200,000

SELECT Country.Continent,
AVG(City.Population) AS Avg_City_Population
FROM Country
JOIN City
ON Country.Code = City.CountryCode
GROUP BY Country.Continent
HAVING AVG(City.Population) > 200000;

## Question 9: Find total population and average life expectancy for each continent ordered by life expectancy descending

SELECT Continent,
SUM(Population) AS Total_Population,
AVG(LifeExpectancy) AS Avg_LifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY Avg_LifeExpectancy DESC;

## Question 10. Find top 3 continents with highest average life expectancy where total population > 200 million

SELECT Continent,
AVG(LifeExpectancy) AS Avg_LifeExpectancy,
SUM(Population) AS Total_Population
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Avg_LifeExpectancy DESC
LIMIT 3;
