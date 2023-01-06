--PROFIT ANALYSIS--
/* Within the space of the last three years, what was the profit worth of the breweries,*/
SELECT SUM(profit) AS profits 
FROM breweries
WHERE years IN ('2017', '2018', '2019');

/* Compare the total profit between these two territories in order for the territory manager,
Mr. Stone to make a strategic decision that will aid profit maximization in 2020.*/
SELECT SUM(B1.profit) AS anglophone_region,
			(SELECT SUM(profit) AS francophone_region 
			FROM breweries WHERE countries IN ('Benin', 'Togo', 'Senegal')) 
FROM breweries AS B1
INNER JOIN breweries AS B2
ON B1.sales_id = B2.sales_id
WHERE B1.countries IN ('Ghana', 'Nigeria');

/* Country that generated the highest profit in 2019 */
SELECT countries, SUM(profit) AS profits
FROM breweries
WHERE years = 2019
GROUP BY countries
ORDER BY profits DESC
LIMIT 1;

/*Help him find the year with the highest profit.*/
SELECT years, SUM(profit) AS profits
FROM breweries
GROUP BY years
ORDER BY profits DESC
LIMIT 1;

/* Which month in the three years was the least profit generated? */
SELECT months, MIN(profit) AS least_profit 
FROM breweries
GROUP BY months
ORDER BY least_profit ASC
LIMIT 1

/* What was the minimum profit in the month of December 2018? */
SELECT months, MIN(profit) AS profits
FROM breweries
WHERE years = 2018 AND months = 'December'
GROUP BY months
ORDER BY profits ASC;

/* Compare the profit in percentage for each of the month in 2019*/ 
SELECT months, profit_per_month,
			ROUND((profit_per_month * 100.00/(SELECT SUM(profit) AS profits 
											  FROM breweries WHERE years = 2019)),2) AS perc_profit
FROM (SELECT months, SUM(profit) AS profit_per_month 
	  FROM breweries WHERE years = 2019 GROUP BY months) AS S1;

/* Which particular brand generated the highest profit in Senegal? */
SELECT brands, SUM(profit) AS profit
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY profit DESC
LIMIT 1;

--BRAND ANALYSIS--
/* Within the last two years, the brand manager wants to know the top three 
brands consumed in the francophone countries */
SELECT countries, brands, SUM(quantity) AS quantity
FROM breweries
WHERE years IN ('2018', '2019') AND countries IN ('Togo', 'Senegal', 'Benin')
GROUP BY countries, brands
ORDER BY quantity DESC
LIMIT 3;

/* Find out the top two choice of consumer brands in Ghana */
SELECT brands, SUM(quantity) AS quantities FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY quantities DESC
LIMIT 2;

/* Within the space of the last three years, what was the profit worth of the breweries,*/
SELECT SUM(profit) AS profits FROM breweries
WHERE years IN ('2017', '2018', '2019');

/* Compare the total profit between these two territories in order for the territory manager,
Mr. Stone to make a strategic decision that will aid profit maximization in 2020.*/
SELECT SUM(B1.profit) AS anglophone_region,
			(SELECT SUM(profit) AS francophone_region 
			FROM breweries WHERE countries IN ('Benin', 'Togo', 'Senegal')) 
FROM breweries AS B1
INNER JOIN breweries AS B2
ON B1.sales_id = B2.sales_id
WHERE B1.countries IN ('Ghana', 'Nigeria');

/* Country that generated the highest profit in 2019 */
SELECT countries, SUM(profit) AS profits
FROM breweries
WHERE years = 2019
GROUP BY countries
ORDER BY profits DESC
LIMIT 1;

/*Help him find the year with the highest profit.*/
SELECT years, SUM(profit) AS profits
FROM breweries
GROUP BY years
ORDER BY profits DESC
LIMIT 1;

/* Which month in the three years was the least profit generated? */
SELECT months, MIN(profit) AS least_profit FROM breweries
GROUP BY months
ORDER BY least_profit ASC
LIMIT 1

/* What was the minimum profit in the month of December 2018? */
SELECT months, MIN(profit) AS profits
FROM breweries
WHERE years = 2018 AND months = 'December'
GROUP BY months
ORDER BY profits ASC;

/* Compare the profit in percentage for each of the month in 2019*/ 
SELECT months, profit_per_month,
			ROUND((profit_per_month * 100.00/(SELECT SUM(profit) AS profits 
													 FROM breweries WHERE years = 2019)),2) AS perc_profit
FROM (SELECT months, 
	  SUM(profit) AS profit_per_month 
	  FROM breweries WHERE years = 2019 GROUP BY months) AS S1;

/* Which particular brand generated the highest profit in Senegal? */
SELECT brands, SUM(profit) AS profit
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY profit DESC
LIMIT 1;

/* Find out the details of beers consumed in the past three years 
in the most oil rich country in West Africa. */
SELECT brands, ROUND(AVG(quantity),1) 
FROM breweries
WHERE countries = 'Nigeria' 
AND brands NOT LIKE '%malt'
GROUP BY brands;

/* 4.Favorites malt brand in Anglophone region between 2018 and 2019 */
SELECT brands, SUM(quantity) AS Quantity
FROM breweries
WHERE countries IN ('Nigeria', 'Ghana')
AND years IN (2018, 2019)
AND brands LIKE ('%malt')
GROUP BY brands
ORDER BY Quantity DESC
LIMIT 1;

/* Which brands sold the highest in 2019 in Nigeria? */
SELECT brands, SUM(quantity) AS Num_sold FROM breweries
WHERE countries = 'Nigeria' 
AND years = '2019'
GROUP BY brands
ORDER BY Num_sold DESC;

/* Favorites brand in South South region in Nigeria*/
SELECT brands, SUM(quantity) AS Num_sold
FROM breweries
WHERE countries = 'Nigeria' AND region ILIKE 'southsouth'
GROUP BY brands
ORDER by Num_sold DESC;

/* Beer consumption in Nigeria */
SELECT brands, SUM(quantity) AS Total_beer_sold
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT LIKE '%malt'
GROUP BY brands;

/*Level of consumption of Budweiser in the regions in Nigeria*/
SELECT brands, SUM(quantity) AS Total_beer_sold
FROM breweries
WHERE countries = 'Nigeria'
AND brands LIKE '%budweiser'
GROUP BY brands;

/*Level of consumption of Budweiser in the regions in Nigeria in 2019 */
SELECT brands, region, SUM(quantity) AS Total_beer_sold
FROM breweries
WHERE countries = 'Nigeria'
AND years = '2019'
AND brands LIKE '%budweiser'
GROUP BY brands, region;


--COUNTRIES ANALYSIS--
/*1. Country with the highest consumption of beer.*/
SELECT countries, brands, SUM(quantity) AS Total_beer_sold
FROM breweries
WHERE brands NOT LIKE '%malt'
GROUP BY brands, countries
ORDER BY Total_beer_sold DESC
LIMIT 1;

/*2. Highest sales personnel of Budweiser in Senegal*/
SELECT sales_rep, SUM(quantity) AS Total_beer_sold
FROM breweries
WHERE countries = 'Senegal'
AND brands LIKE '%budweiser'
GROUP BY sales_rep
ORDER BY Total_beer_sold DESC;

/*3. Country with the highest profit of the fourth quarter in 2019*/
SELECT countries, SUM(profit) AS profits
FROM breweries
WHERE years = '2019' AND months IN ('October', 'November', 'December')
GROUP BY countries
ORDER BY profits DESC
LIMIT 1;

