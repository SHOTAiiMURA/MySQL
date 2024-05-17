# MySQL
## Purpose of learning MySQL
This repository was created for the purpose of writing a readme on what I have learned about MySQL.
This will create a chip calculator on LINE. In creating the application, I went through learning Mysql concepts, grammar, actual hands-on table design, creation, data insertion, retrieval, deletion, and modification.
### 2024/4/29
## Why we create data base
It is important to create data base because it is able to utilize for various purpose. For example, it is for store data, search data, manage data, analyze data.
## Composition of Data Table
Ex)
'''
[Key:Value],[key:Value], etc

## How to create Data Base
1. create table.
2. Define specific keys and values for the table.
EX)
For names, define the required data elements, such as whether or not to specify the number of characters.

Also, set a primary key for the table to define data that will not be duplicated. The use of a primary key makes it easier to identify duplicate data in the table.
### Grammar
create table User
(user_id varchar(50) not null,
- name varchar(40) not null,
- primary key (user_id));

- create table TipHistory
- (history_id char(20) not null,
- amount_bill integer not null,
- percentage integer not null,
- date date not null,
- primary key (history_id),
- tip_user_id varchar(50) not null,
- foreign key (tip_user_id) references User(user_id));

3. once you create a table, insert key and value.
### Grammar
- insert into User(user_id,namename) values ('A1', 'John Smith');
- insert into User(user_id,name) values ('A2', 'Katy Perry');
- insert into User(user_id,name) values ('A3', 'John Wick');
- insert into User(user_id,name) values ('A4', 'Boris Johnson');
Keys and Values between Table Name and Values can also be skipped.　Curdata() is showing current date.
- insert into TipHistory Values ('H1', 40, 10, curdate(), 'A1');
- insert into TipHistory Values ('H2', 200, 20, curdate(),'A2');
- insert into TipHistory Values ('H3', 5, 5,curdate(), 'A3');
- insert into TipHistory Values ('H4', 500, 30,curdate(), 'A4');
- insert into TipHistory Values ('H5', 20, 10, curdate(),'A1');
- insert into TipHistory Values ('H6', 2000, 30,curdate(), 'A4');

4. Select data
### Grammar
Select * from User
* = every data set

- select tip_user_id, (amount_bill * percentage) as Total from TipHistory order by Total ;
** name any name so that you can title data after as. **
<img width="192" alt="Screenshot 2024-04-29 at 18 43 57" src="https://github.com/SHOTAiiMURA/MySQL/assets/91776514/53327c76-f9fd-4116-8c32-6dcab598f788">
- select tip_user_id, sum(amount_bill * percentage) as Total from TipHistory group by tip_user_id ;
<img width="217" alt="Screenshot 2024-04-29 at 18 43 30" src="https://github.com/SHOTAiiMURA/MySQL/assets/91776514/17aeda3b-8ada-4766-b687-f281a5b25d46">
-select date, amount_bill, percentage, (amount_bill * percentage) as Total from TipHistory where tip_user_id = 'A1' order by date desc;
<img width="244" alt="Screenshot 2024-04-29 at 18 46 30" src="https://github.com/SHOTAiiMURA/MySQL/assets/91776514/6c55a508-e619-47e6-9a8d-3b57263578ac">

##SQL JOIN
![image](https://github.com/SHOTAiiMURA/MySQL/assets/91776514/75ba4d1b-9aa7-4c9e-aed2-2efd2acf33c3)

- right outer join User on TipHistory.tip_user_id = User.user_id;


- right outer join User on TipHistory.tip_user_id = User.user_id where history_id is null;
