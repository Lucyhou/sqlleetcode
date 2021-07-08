drop table if exists customer;
CREATE TABLE customer(customer_id  int, name varchar(50), visited_on Date, amount decimal);
insert into customer values ('1','John','2019-01-01', '100'),('2','Daniel','2019-01-02', '110'),('3','Jade','2019-01-03', '120'),
('4','Khaled','2019-01-04', '130'),('5','Winston','2019-01-05', '110'),('6','Elvis','2019-01-06', '140'),('7','Anna','2019-01-07', '150'),('8','Maria','2019-01-08', '80'),('9','Jaze','2019-01-09', '110'),('1','John','2019-01-10', '130'),('3','Jade','2019-01-10', '150');

select visited_on, amount, average_amount
from(
select visited_on, sum(sa)over (order by visited_on rows between 6 preceding and current row) amount,
round(avg(sa)over (order by visited_on rows between 6 preceding and current row),2) average_amount
from(
Select visited_on,sum(amount) sa
From customer
group by visited_on)aa
)aaa
where visited_on >= (select min(visited_on)+6 from customer c1)
