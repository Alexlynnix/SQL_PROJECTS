--  last SQL assignment
--  write an SQL query to fetch the following monthly metrics from the dataset for the:
--  1 the average number of trips on saturdays
--  2 the average fare (fare_amount) per trip on saturdays
--  3 the average duration per trip on saturdays
--  4 the average number of trips on sundays
--  5 the average fare (fare_amount) per trip on sundays
--  6 the average duration per trip on sundays

-- 1
select *
from "yellow_tripdata_2015-01"
limit 10;

select "tpep_pickup_datetime", to_char("tpep_pickup_datetime", 'day')
from "yellow_tripdata_2015-01";

--  1 the average number of trips on saturdays
select avg(vendor_count) as "avg_vendorcount", "pickup_day" 
from 
(select count("VendorID") as "vendor_count", "tpep_pickup_datetime", to_char("tpep_pickup_datetime", 'day') as "pickup_day", "tpep_dropoff_datetime"
from "yellow_tripdata_2015-01"
group by "VendorID", "tpep_pickup_datetime", "tpep_dropoff_datetime"
order by "vendor_count" desc) as "table1"
where "pickup_day" like 'sat%'
group by "pickup_day";

--  2 the average fare (fare_amount) per trip on saturdays
select avg(fare_amount) as "avg_fare_amount", "pickup_day"
from
(select to_char("tpep_pickup_datetime", 'day') as "pickup_day", "fare_amount"
from "yellow_tripdata_2015-01"
group by "pickup_day", "fare_amount") as table1
where "pickup_day" like 'sat%'
group by "pickup_day";

--  3 the average duration per trip on saturdays
select avg(diff) as "avg_diff", "pickup_day"
from
(select ("tpep_dropoff_datetime" - "tpep_pickup_datetime") as "diff", to_char("tpep_pickup_datetime", 'day') as "pickup_day"
from "yellow_tripdata_2015-01"
group by "diff", "pickup_day") as table1
where "pickup_day" like 'sat%'
group by "pickup_day";

--  4 the average number of trips on sundays
select avg(vendor_count) as "avg_vendorcount", "pickup_day" 
from 
(select count("VendorID") as "vendor_count", "tpep_pickup_datetime", to_char("tpep_pickup_datetime", 'day') as "pickup_day", "tpep_dropoff_datetime"
from "yellow_tripdata_2015-01"
group by "VendorID", "tpep_pickup_datetime", "tpep_dropoff_datetime"
order by "vendor_count" desc) as "table1"
where "pickup_day" like 'sun%'
group by "pickup_day";

--  5 the average fare (fare_amount) per trip on sundays
select avg(fare_amount) as "avg_fare_amount", "pickup_day"
from
(select to_char("tpep_pickup_datetime", 'day') as "pickup_day", "fare_amount"
from "yellow_tripdata_2015-01"
group by "pickup_day", "fare_amount") as table1
where "pickup_day" like 'sun%'
group by "pickup_day";

--  6 the average duration per trip on sundays
select avg(diff) as "avg_diff", "pickup_day"
from
(select ("tpep_dropoff_datetime" - "tpep_pickup_datetime") as "diff", to_char("tpep_pickup_datetime", 'day') as "pickup_day"
from "yellow_tripdata_2015-01"
group by "diff", "pickup_day") as table1
where "pickup_day" like 'sun%'
group by "pickup_day";





