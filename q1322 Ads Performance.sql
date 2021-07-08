drop table if exists Ads;
CREATE TABLE  Ads (ad_id int, user_id  int, action enum('Clicked','Viewed','Ignored'));

insert into Ads values ('1', '1','Clicked'),('2', '2','Clicked'),('3', '3','Viewed'),
('5', '5','Ignored'),('1', '7','Ignored'),('2', '7','Viewed'),('3', '5','Clicked'),
('1', '4','Viewed'),('2', '11','Viewed'),('1', '2','Clicked');

#select * from Ad

Select ad_id, round((case when total_clicked+total_viewed=0 then 0
                              Else total_clicked/(total_clicked+total_viewed) end)*100,2) ctr
from
(Select ad_id, sum(case when action='Clicked' then 1 else 0 end) total_clicked,
sum(case when action='Viewed' then 1 else 0 end) total_viewed
From Ads
Group by ad_id)a
Order by ctr desc, ad_id asc

