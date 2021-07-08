
drop table if exists Product;
CREATE TABLE   Product(product_id int, product_name varchar(50));
insert into Product values ('1','LC Phone'),('2','LC T-Shirt'),('3','LC Keychain');

drop table if exists Sales;
CREATE TABLE  Sales(product_id  int,period_start Date, period_end  Date, average_daily_sales int);

insert into Sales values ('1','2019-01-25','2019-02-28', '100'),('2','2018-12-01','2020-01-01', '10'),('3','2019-12-01','2020-01-31', '1');

WITH TMP AS (SELECT s.product_id, p.product_name, '2018' AS report_year,
(CASE WHEN s.period_end <= '2018-12-31'
     THEN  (DATEDIFF(s.period_end,s.period_start) + 1) * average_daily_sales 
     WHEN s.period_end > '2018-12-31'
     THEN (DATEDIFF('2018-12-31', s.period_start) + 1) * average_daily_sales 
     END) AS total_amount
FROM product p, sales s
WHERE p.product_id = s.product_id
AND YEAR(s.period_start) = '2018'
UNION
SELECT s.product_id, p.product_name, '2019' AS report_year,
CASE WHEN YEAR(s.period_end) ='2019' AND YEAR(s.period_start) = '2019'
     THEN (DATEDIFF(s.period_end,s.period_start) + 1) * average_daily_sales 
     WHEN YEAR(s.period_end) ='2019' AND YEAR(s.period_start) = '2018'
     THEN (DATEDIFF(s.period_end, '2019-01-01') + 1) * average_daily_sales 
     WHEN YEAR(s.period_end) ='2020' AND YEAR(s.period_start) = '2019'
     THEN (DATEDIFF('2019-12-31', s.period_start) + 1) * average_daily_sales
     WHEN YEAR(s.period_end) ='2020' AND YEAR(s.period_start) = '2018' 
     THEN 365 * average_daily_sales
     END AS total_amount
FROM product p, sales s
WHERE p.product_id = s.product_id
AND YEAR(period_start)<2020 AND YEAR(period_end) >2018
UNION 
SELECT s.product_id, p.product_name, '2020' AS report_year,
CASE WHEN YEAR(s.period_start) = '2020'
     THEN (DATEDIFF(s.period_end, s.period_start) + 1) * average_daily_sales 
     WHEN YEAR(s.period_start) < '2020'
     THEN (DATEDIFF(s.period_end,'2020-01-01') + 1) * average_daily_sales 
     END AS total_amount
FROM product p, sales s
WHERE p.product_id = s.product_id
AND YEAR(s.period_end) = '2020')
SELECT *
FROM TMP 
ORDER BY PRODUCT_ID,REPORT_YEAR;