use sakila;
select * from sakila.actor;
select * from staff;
select * from city;
select * from payment;
select * from film_category;
select title from film;
select * from language;
select name as language from language;
select * from store; 
# 2 stores
select * from staff;
# 2 employees
select first_name from staff;

use bank;
#Q1
select * from client;
select client_ID from client where district_id=1 limit 5;
#Q2
select client_ID from client where district_id=72 order by client_ID DESC limit 1;
#Q3
select * from loan;
select min(amount) from loan limit 3;
select amount from loan order by amount limit 3;
#Q4
select * from loan;
select distinct status from loan order by status;
#Q5: What is the loan_id of the highest payment received in the loan table?
select loan_ID from loan order by payments DESC limit 1;
#Q6: What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
select account_ID, amount from loan order by account_id limit 5;
#Q7: What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select account_id from loan where duration = 60 order by amount limit 5;
#Q8: What are the unique values of k_symbol in the order table?
#Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.
select * from bank.order;
select distinct k_symbol from bank.order order by k_symbol;
#Q9: In the order table, what are the order_ids of the client with the account_id 34?
select order_id from bank.order where account_id=34;
#Q10: In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select order_id, account_id from bank.order where order_id between 29540 and 29560;
select distinct account_id from bank.order where order_id between 29540 and 29560;
#Q11: In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select amount from bank.order where account_to = 30067122;
#Q12: In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
select * from bank.trans;
select trans_id, date, type, amount from bank.trans where account_id = 793 order by date DESC limit 10;
#OPTIONAL 
#Q13: In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
select * from bank.client;
select district_id from bank.client where district_id < 10 order by district_id;
select district_id, count(district_id) from bank.client group by district_id having district_id < 10 order by district_id;
#Q14: In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select * from bank.card;
select distinct type, count(card_id) from bank.card group by type;
#Q15: Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select * from bank.loan;
select amount, sum(account_id) from bank.loan group by amount order by amount desc limit 10; 
#Q16: In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
select date, count(loan_id) from bank.loan where date < 930907 group by date order by date DESC;
#Q17: In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
select date, duration, count(loan_id) from bank.loan where date between 971200 and 971240 and distinct duration group by duration, date order by date;