create table customer(user_id number not null PRIMARY KEY, customer_name varchar(20), email  varchar(30) unique, date_of_birth  date);

Create table advertisement(advertisement_id number PRIMARY KEY, company varchar(15));

create table payment_info(card_number number not null PRIMARY KEY, name_on_card varchar(20), ccv  number(3), cost number, exp_date date);

ALTER TABLE payment_info drop column cost;

create table driver(driver_id number not null PRIMARY KEY, driver_name varchar(20), rating  number(3) unique, availlability  varchar(3));

create table ride(ride_id REFERENCES driver(driver_id) PRIMARY KEY, license_plate varchar(8) not null, make varchar(10), model varchar(20), years number);

CREATE TABLE trip (trip_id number not null, mem_id REFERENCES customer(user_id), driv_id REFERENCES driver(driver_id), CONSTRAINT t_pk PRIMARY KEY(mem_id, driv_id, trip_id), CONSTRAINT customer_fk FOREIGN KEY(mem_id) REFERENCES customer(user_id) ON DELETE CASCADE, CONSTRAINT driver_fk FOREIGN KEY(driv_id) REFERENCES driver(driver_id) ON DELETE CASCADE, current_location varchar(30), destination  varchar(30) unique, cost  number not null);

CREATE TABLE reviews (mem_id REFERENCES customer(user_id), driv_id REFERENCES driver(driver_id), CONSTRAINT review_id PRIMARY KEY(mem_id, driv_id), CONSTRAINT customer_fk2 FOREIGN KEY(mem_id) REFERENCES customer(user_id) ON DELETE CASCADE, CONSTRAINT driver_fk2 FOREIGN KEY(driv_id) REFERENCES driver(driver_id) ON DELETE CASCADE, review varchar(100), rating number);

CREATE TABLE trip_history (mem_id number, driv_id number, trip_id number, CONSTRAINT triphistory_fk FOREIGN KEY (mem_id, driv_id, trip_id) REFERENCES trip(mem_id, driv_id, trip_id),
CONSTRAINT trip_history_pk PRIMARY KEY(mem_id, driv_id, trip_id), dateandtime date, current_location varchar(30), destination varchar(30));

INSERT INTO customer(user_id, customer_name, email, date_of_birth) VALUES (1, 'Mudassir Ashraf', 'mudi@gmail.com', '26-MAR-2003');
INSERT INTO customer(user_id, customer_name, email, date_of_birth) VALUES (2, 'Adam Silver', 'adamsmith@gmail.com', '20-APR-1969');
INSERT INTO customer(user_id, customer_name, email, date_of_birth) VALUES (3, 'Safwan Haque', 'safwanhaque@gmail.com', '27-SEP-2003');
INSERT INTO customer(user_id, customer_name, email, date_of_birth) VALUES (4, 'Rehman Mohammed', 'rehmanmoh23@gmail.com', '21-JUN-1999');
INSERT INTO customer(user_id, customer_name, email, date_of_birth) VALUES (5, 'Pascal Siakam', 'Pskills@gmail.com', '04-Mar-1995');
INSERT INTO customer(user_id, customer_name, email, date_of_birth) VALUES (6, 'Timothy Timmy Toe', 'TimmyRocks@gmail.com', '13-DEC-1999');

INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (1, 'John Doe', 86, 'Yes');
INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (2, 'Digno', 92, 'No');
INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (3, 'Nithan Aravinth', 55, 'Yes');
INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (4, 'Raj Patel', 78, 'No');
INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (5, 'Ahmed Hasan', 82, 'Yes');
INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (6, 'Lewis Hamilton', 99, 'No');

INSERT INTO payment_info VALUES (2486809077142368, 'Safwan Haque', 237, '27-SEP-2025');
INSERT INTO payment_info VALUES (1290885213890027, 'Rehman Mohammed', 711, '10-SEP-2024');

INSERT INTO ride VALUES (1, 'C9VOLT5', 'Nissan', 'Sentra', 2023);
INSERT INTO ride VALUES (3, 'AXRK290', 'Dodge', 'Grand Caravan', 2015);

INSERT INTO trip VALUES (403, 1, 4, '42 Markham Road, Toronto', '245 Church St, Toronto', 43);
INSERT INTO trip VALUES (276, 3, 2, 'Sir Wilfred Laurier CI', 'Scarborough Town Center', 27);

INSERT INTO reviews VALUES (5, 3, 'This guy sucks, he almost crashed 6 times and he took me to the wrong location', 1);
INSERT INTO reviews VALUES (2, 2, 'Very good driver', 8.5);
INSERT INTO reviews VALUES (2, 6, 'got me where i wanted to go in half the time google maps said', 10);

INSERT INTO trip_history VALUES (3, 2, 276, '15-SEP-2023', 'Sir Wilfred Laurier CI', 'Scarborough Town Center');

select table_name from user_tables;


drop table advertisement;

SELECT user_id, customer_name FROM customer WHERE user_id=1;
describe payment_info;
select * from customer;
select * from driver;
select * from payment_info;
select * from trip;
select * from ride;
select * from reviews;
select * from trip_history;

SELECT distinct review from reviews WHERE rating <= 1;
SELECT driver_name, rating FROM driver Order BY rating desc;
describe trip;

CREATE VIEW good_drivers AS SELECT driver_name, rating FROM driver WHERE rating > 85; 
CREATE VIEW old_customers AS SELECT customer_name, user_id FROM customer WHERE user_id < 4;
CREATE VIEW availlable_drivers AS SELECT driver_name, rating, availlability FROM driver WHERE availlability = 'Yes';  
SELECT * from good_drivers;
SELECT * from old_customers;
SELECT * from availlable_drivers;


SELECT driver.driver_id, driver.driver_name, ride.make, ride.model, ride.years FROM driver INNER JOIN ride ON driver.driver_id = ride.ride_id;

SELECT customer.customer_name, driver.driver_name, trip.current_location, trip.destination FROM customer INNER JOIN trip on customer.user_id = trip.mem_id INNER JOIN driver on driver.driver_id = trip.driv_id;

SELECT mem_id from trip UNION select mem_id FROM reviews; 
SELECT user_id from customer MINUS SELECT mem_id FROM trip;
select COUNT(trip_id) from trip;
select availlability, AVG(rating) AS avg_rating from driver GROUP BY availlability HAVING AVG(rating) > 80;
SELECT * FROM customer WHERE NOT EXISTS (SELECT * FROM trip WHERE customer.user_id = trip.mem_id);