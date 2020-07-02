drop table if exists eventss;
create table eventss(business_id int, event_type varchar(25),occurences int);
insert into eventss(business_id , event_type ,occurences ) values (1,'reviews',7),(3,'reviews',3),
(1,'ads',11),(2,'ads',7),(1,'ads',6),(1,'page views',3),(1,'reviews',6),(2,'page views',12),(2,'page views',13);

#select * from eventss

#Select event_type, avg(occurences) From eventss e2 Group by event_type


Select business_id #,event_type ,occurences
From eventss e1
Where occurences>(Select avg(occurences)
From eventss e2
Where e1.event_type=e2.event_type
Group by event_type)
group by  business_id 
Having count(distinct e1.event_type)>1



