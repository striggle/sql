SELECT * FROM bank_db.accounts;

INSERT INTO accounts values
(50, 'Donald Trump', '656841', '0');

insert into accounts (account_holder, balance, fees)
values ('dave grohl', 65681, 0);

update accounts
set account_holder = 'Donald J Trump'
where id = 50;

update accounts set fees = 0 
where id = 1;

select * from accounts where balance < 5000;

delete from accounts where id = 51;

select * from accounts
where id in (1,2,3);

select * from accounts where account_holder like '% j %';

select distinct fees from accounts;

insert into accounts values (5, 'brett favre', 542168, 4);

insert into accounts (account_holder, balance, fees)
values ('gary johnson', 8654, 0);

insert into accounts (account_holder, balance, fees)
values ('barry larkin', 846, 2);

insert into accounts values (6, 'ron paul', 65413, 0);

insert into accounts values (7, 'justin timberlake', 87654, 54);

insert into accounts (account_holder, balance, fees)
values ('santa claus', 6845, 856);

insert into accounts (account_holder, balance, fees)
values ('urban meyer', 684651, 3);

insert into accounts values (8, 'carson palmer', 8461, 0);

insert into accounts values (9, 'joey votto', 98765, 54);

update accounts set balance = 85
where id = 8;

update accounts set fees = 0
where id = 8;

delete from accounts where id = 8;

delete from accounts where id = 50;

update accounts set balance = 9875136
where id = 55;

update accounts set account_holder = 'Lebron James'
where id = 7;

select account_holder, balance, fees, amount, txn_type
from accounts a
inner join
transactions t
on a.id = t.account_id;

select account_holder, balance, fees, amount, txn_type
from accounts a 
left outer join transactions t 
on a.id = t.account_id;

