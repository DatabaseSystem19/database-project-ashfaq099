
-- drop table


drop table credit_card;
drop table loan;
drop table account;
drop table branch;
drop table banker;
drop table customer;
drop table banker_information;



-- create table


create table customer(customer_id int not null, 
customer_name varchar(100),
customer_street varchar(100),
customer_city varchar(100));

alter table customer add primary key(customer_id);

create table banker_information(banker_id int not null,
banker_name varchar(100), 
banker_email varchar(100), 
primary key(banker_id));



create table banker(banker_id int not null,
customer_id int not null,
foreign key(customer_id) references customer on delete cascade,
foreign key(banker_id) references banker_information on delete cascade);



create table credit_card(card_number int not null,
card_limit int,
expire_date date,
customer_id int not null,
primary key(card_number),
foreign key(customer_id) references customer on delete cascade );



create table branch(branch_name varchar(100) not null,
branch_location varchar(100),
primary key(branch_name));



create table loan(loan_number int not null,
amount int,
customer_id int not null,
branch_name varchar(100) not null,
primary key(loan_number),
foreign key(customer_id) references customer on delete cascade,
foreign key(branch_name) references branch on delete cascade);




create table account(account_number int not null,
balance int check(balance >= 100000),
category varchar(100),
customer_id int not null,
primary key(account_number),
foreign key(customer_id) references customer on delete cascade);



--adding column in table

alter table customer add email char(20);

--modify column definition in table

alter table customer modify email varchar(27);

-- alter column name
alter table customer rename column email  to customer_emails;

--drop the column from table

alter table customer drop column customer_emails;


