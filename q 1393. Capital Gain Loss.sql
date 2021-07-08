
drop table if exists Stocks;
CREATE TABLE  Stocks(stock_name varchar(50), operation varchar(50), operation_day int,price decimal);

insert into Stocks values ('Leetcode','Buy','1','1000'),('Corona Masks','Buy','2','10'),('Leetcode','Sell','5','9000'),('Handbags','Buy','17','30000'),
('Corona Masks','Sell','3','1010'),('Corona Masks','Buy','4','1000'),('Corona Masks','Sell','5','500'),
('Corona Masks','Buy','6','1000'),('Handbags','Sell','29','7000'),('Corona Masks','Sell','10','10000');

Select stock_name, sum(case when operation='Sell' then price else NULL end)-sum(case when operation='Buy' then price else 0 end) capital_gain_loss
From Stocks
Group by stock_name
