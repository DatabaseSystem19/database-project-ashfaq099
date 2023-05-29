--pl/sql

set serveroutput on
declare
   max_loan_amount  number;
begin
   select max(amount) into max_loan_amount
   from loan;
   dbms_output.put_line('the maximum loan amount is: ' || max_loan_amount);
end;
/

set serveroutput on
declare
   min_balance  account.balance%type;
begin
   select min(a.balance) into min_balance from account a join customer c using(customer_id);
   dbms_output.put_line('the minimum balance is  : ' || min_balance);
 end;
/


--cursor pl/sql loop

set serveroutput on
declare
   cursor cust_cur is select customer_name, customer_city from customer;
   cust_rec cust_cur%rowtype;
   counter number := 0;
begin
   open cust_cur;
   loop
      fetch cust_cur into cust_rec;
      exit when cust_cur%notfound or counter >= 3;
      counter := counter + 1;
      dbms_output.put_line('customer_name: ' || cust_rec.customer_name || ' ' || 'customer_city: ' || cust_rec.customer_city);
   end loop;
   close cust_cur;
end;
/





-- plsql procedure
set serveroutput on;
create or replace procedure get_acc is 
    acc_no account.account_number%type;
begin
    select account_number into acc_no
    from account
    where balance = (select max(balance) from account);
    dbms_output.put_line('balance is: ' || acc_no);
end;
/
show errors;


-- plsql function
set serveroutput on
create or replace function avg_card_limi return number is
   avg_card credit_card.card_limit%type;
begin
  select avg(card_limit) into avg_card
  from credit_card;
   return avg_card;
end;
/


begin
dbms_output.put_line('average credit card limit: ' || avg_card_limi);
end;
/



