drop table if exists Customers;
CREATE TABLE  Customers(customer_id int,  customer_name varchar(25), email varchar(25));
insert into Customers values ('1', 'Alice','alice@leetcode.com'),('2', 'Bob','bob@leetcode.com'),
('13', 'John','john@leetcode.com'),('6', 'Alex','alex@leetcode.com');

drop table if exists Contacts;
CREATE TABLE  Contacts(user_id int,  contact_name varchar(25), contact_email varchar(25));
insert into Contacts values ('1', 'Bob','bob@leetcode.com'),('1', 'John','john@leetcode.com'),('1', 'Jal','jal@leetcode.com'),
('2', 'Omar','omar@leetcode.com'),('2', 'Meir','meir@leetcode.com'),('6', 'Alice','alice@leetcode.com');

drop table if exists Invoices;
CREATE TABLE  Invoices(invoice_id int,  price decimal(5,2),user_id int);
insert into Invoices values ('77', '100','1'),('88', '200','1'),('99', '300','2'),
('66', '400','2'),('55', '500','13'),('44', '60','6');

Select i.invoice_id, cu.customer_name, price,
Ifnull(
(Select count(distinct contact_name) from  Contacts co where co.user_id=cu.customer_id)
,0) as contacts_cnt, 
Ifnull(
(Select count(distinct contact_name) from  Contacts co
 where co.user_id=i.user_id and co.contact_email in (select email from Customers)),0) as trusted_contacts_cnt 
From Invoices i, Customers cu
Where i.user_id=cu.customer_id
order by 1


