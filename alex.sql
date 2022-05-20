-- ASSIGNMENT
---        SECTION A
--- Within the space of the last three years, what was the profit worth of the breweries.

select "YEARS", sum("PROFIT") as "profit_within_the_last_three_yrs"
from "Brewery_data"
where "YEARS" in (2017,2018,2019)
group by "YEARS"
order by "YEARS" asc;

select "TERRITORIES", sum ("PROFIT") as "TERRITORIAL_PROFIT"
from
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORIES"
from "Brewery_data") as "Table1"
group by "TERRITORIES";



--3 country that generated the highest profit in 2019

select "COUNTRIES","PROFIT", "YEARS"
from "Brewery_data"
where "YEARS" =(2019)
order by "PROFIT" desc
limit 1;

--4 find the year with the highest profit generated

select sum("PROFIT") as "highest_profit", "YEARS"
from "Brewery_data"
group by "YEARS"
order by "highest_profit" desc
limit 1;

--5 which month in the three years was the least profit generated

select "MONTHS", sum("PROFIT") as "least_profit"
from "Brewery_data"
group by "MONTHS"
order by "least_profit" asc
limit 1;

--6 what was the minimum profit in the month of December 2018

select "MONTHS", "YEARS", "PROFIT" as "minimum_profit"
from "Brewery_data"
where "MONTHS" = 'December'
and "YEARS" = 2018
order by "minimum_profit" asc
limit 1;

--8 which particular brand generated the highest profit in senegal

select "BRANDS", "PROFIT", "COUNTRIES"
from "Brewery_data"
where "COUNTRIES" = 'Senegal'
order by "PROFIT" desc;


--7 compare the profit in percentage for each of the month in 2019

select "MONTHS", (sum("PROFIT")/sum("COST")*100) as "percentage_for_each_month_2019"
from "Brewery_data"
where "YEARS" = 2019
group by "MONTHS"
order by "percentage_for_each_month_2019" asc;




---SECTION B BRAND ANALYSIS
--1 within the last two years,the brand manager wants to know the top three brands consumed in the francophone countries

select Distinct "BRANDS", sum("QUANTITY") as "TOP_THREE", "COUNTRIES", "YEARS"
from "Brewery_data"
where "COUNTRIES" in ('Togo','Benin','Senegal')
and "YEARS" in (2018,2019)
group by "BRANDS", "COUNTRIES","YEARS"
order by "TOP_THREE" desc
limit 3;

--2 TOP 2 CHOICE OF CONSUMER brands in Ghana

-- select Distinct "BRANDS", sum("QUANTITY") as "TOP_TWO", "COUNTRIES"
-- from "Brewery_data"
-- where "COUNTRIES" = 'Ghana'
-- group by "BRANDS", "COUNTRIES"
-- order by "TOP_TWO" DESC
-- LIMIT 2;

--3 DETAILS OF BEER CONUMED IN THE PAST THREE YEARS

SELECT DISTINCT "BRANDS", SUM("QUANTITY") AS "TOTAL_QUANTITY"
FROM "Brewery_data"
where "COUNTRIES" = 'Nigeria' 
and "BRANDS" not in ('beta malt', 'grand malt')
group by "BRANDS";

--4 favourite malt brand in Anglophone region btw 2018 and 2019

select "BRANDS" AS "FAVOURITE_MALT_BRAND", sum("QUANTITY") AS "TOTAL_QUANTITY", "COUNTRIES", "YEARS"
from "Brewery_data"
where "YEARS" IN (2018,2019)
 AND "COUNTRIES" in ('Ghana', 'Nigeria')
 AND "BRANDS" in ('Beta malt', 'Grand malt')
 group by "BRANDS", "COUNTRIES", "YEARS"
order by "TOTAL_QUANTITY" DESC;


--5 WHICH BRAND SOLD THE HIGHEST IN 2019 IN NIGERIA

SELECT "BRANDS", SUM("QUANTITY") AS "HIGHEST_BRAND_SOLD", "COUNTRIES", "YEARS"
FROM "Brewery_data"
WHERE "COUNTRIES" = 'Nigeria'
AND "YEARS" =2019
GROUP BY "BRANDS", "COUNTRIES", "YEARS"
ORDER BY "HIGHEST_BRAND_SOLD" DESC
LIMIT 1;


--6 favourite brand in south_south region in Nigeria

select sum("QUANTITY") AS "TOTAL_QUANTITY", "BRANDS", "REGION", "COUNTRIES"
FROM "Brewery_data"
where "REGION" = 'southsouth'
and "COUNTRIES" ='Nigeria'
group by "BRANDS", "REGION", "COUNTRIES"
ORDER BY "TOTAL_QUANTITY" DESC
LIMIT 1;

--7 BEER CONSUMPTION IN NIGERIA

SELECT SUM("QUANTITY") as "total_quantity", "BRANDS", "COUNTRIES"
FROM "Brewery_data"
where "BRANDS" IN ('trophy', 'budweiser','eagle lager', 'hero') 
and "COUNTRIES" = 'Nigeria'
group by "BRANDS", "COUNTRIES";

--8 LEVEL OF CONSUMPTION OF BUDWEISER IN THE REGIONS OF NIGERIA

SELECT SUM("QUANTITY") AS "TOTAL_QUANTITY", "BRANDS", "REGION", "COUNTRIES"
FROM "Brewery_data"
where "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Nigeria'
group by "BRANDS", "REGION", "COUNTRIES";


--9 LEVEL OF CONSUMPTION OF BUDWEISER IN THE REGIONS IN THE REGIONS IN NIGERIA IN 2019

SELECT DISTINCT "REGION", SUM("QUANTITY") AS "TOTAL_QUANTITY", "YEARS", "COUNTRIES" "BRANDS" 
FROM "Brewery_data"
where "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Nigeria'
and "YEARS" = 2019
GROUP BY "REGION",  "YEARS", "COUNTRIES", "BRANDS";


--SECTION C
-- 1 COUNTRY WITH THE HIGHEST CONSUMPTION OF BEER 

-- section C no 1
select distinct "COUNTRIES", sum ("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" 
not in ('beta malt', 'grand malt')
group by "COUNTRIES"
order by "QUANTITIES" desc
limit 1;


-- section C no 2
select distinct "SALES_REP", sum ("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" = 'budweiser'
AND "COUNTRIES" = 'Senegal'
group by "SALES_REP"
order by "QUANTITIES" desc
limit 1;


-- section c no 3
select  distinct "COUNTRIES", "PROFIT", "YEARS", "MONTHS"
from "Brewery_data"
where "MONTHS" in ('October','November','December')
and "YEARS" = 2019
order by "PROFIT" desc
limit 1;

select *,
case when "MONTHS" in ('January', 'February', 'March') then 'Q1'
when "MONTHS" in ('April', 'May', 'June') then 'Q2'
when "MONTHS" in ('July', 'August', 'September') then 'Q3'
else 'Q4' end as "QUARTELY"
from "Brewery_data";

select "QUARTELY", sum("PROFIT") as "TOTAL_PROFIT"
from
(select *,
case when "MONTHS" in ('January', 'February', 'March') then 'Q1'
when "MONTHS" in ('April', 'May', 'June') then 'Q2'
when "MONTHS" in ('July', 'August', 'September') then 'Q3'
else 'Q4' end as "QUARTELY"
from "Brewery_data"
 where "YEARS" = 2019) as "Table2"
 group by "QUARTELY"
 order by "TOTAL_PROFIT" desc;






