-- create table User
-- (user_id varchar(50) not null,
-- name varchar(40) not null,
-- primary key (user_id));

-- create table TipHistory
-- (history_id char(20) not null,
-- amount_bill integer not null,
-- percentage integer not null,
-- date date not null,
-- primary key (history_id),
-- tip_user_id varchar(50) not null,
-- foreign key (tip_user_id) references User(user_id));

-- insert into User(user_id,namename) values ('A1', 'John Smith');
-- insert into User(user_id,name) values ('A2', 'Katy Perry');
-- insert into User(user_id,name) values ('A3', 'John Wick');
-- insert into User(user_id,name) values ('A4', 'Boris Johnson');

-- insert into TipHistory Values ('H1', 40, 10, curdate(), 'A1');
-- insert into TipHistory Values ('H2', 200, 20, curdate(),'A2');
-- insert into TipHistory Values ('H3', 5, 5,curdate(), 'A3');
-- insert into TipHistory Values ('H4', 500, 30,curdate(), 'A4');
-- insert into TipHistory Values ('H5', 20, 10, curdate(),'A1');
-- insert into TipHistory Values ('H6', 2000, 30,curdate(), 'A4');


-- select * from TipHistory;

-- select * from TipHistory where tip_user_id = 'A1';

-- select amount_bill, percentage from TipHistory where date = curdate();


-- select distinct tip_user_id from TipHistory where date = curdate();

-- select tip_user_id, max(amount_bill) from TipHistory;

-- select tip_user_id, amount_bill from TipHistory where amount_bill = max(amount_bill);

-- select tip_user_id, (amount_bill * percentage) as Total from TipHistory order by Total ;

-- select tip_user_id, sum(amount_bill * percentage) as Total from TipHistory group by tip_user_id ;


-- inner join User on TipHistory.tip_user_id = User.user_id;

-- insert into User values ('A6', 'Elizabeth 2nd');


-- right outer join User on TipHistory.tip_user_id = User.user_id;


-- right outer join User on TipHistory.tip_user_id = User.user_id where history_id is null;

-- select date, amount_bill, percentage, (amount_bill * percentage) as Total from TipHistory where tip_user_id = 'A1' order by date desc;




