#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

create table customer(user_id number not null PRIMARY KEY, customer_name varchar(20), email  varchar(30) unique, date_of_birth  date);

Create table advertisement(advertisement_id number PRIMARY KEY, company varchar(15));

create table payment_info(card_number number not null PRIMARY KEY, name_on_card varchar(20), ccv  number(3), cost number, exp_date date);

ALTER TABLE payment_info drop column cost;

create table driver(driver_id number not null PRIMARY KEY, driver_name varchar(20), rating  number(3) unique, availlability  varchar(3));

create table ride(ride_id REFERENCES driver(driver_id) PRIMARY KEY, license_plate varchar(8) not null, make varchar(10), model varchar(20), years number);

CREATE TABLE trip (trip_id number not null, mem_id REFERENCES customer(user_id), driv_id REFERENCES driver(driver_id), CONSTRAINT t_pk PRIMARY KEY(mem_id, driv_id, trip_id), CONSTRAINT customer_fk FOREIGN KEY(mem_id) REFERENCES customer(user_id) ON DELETE CASCADE, CONSTRAINT driver_fk FOREIGN KEY(driv_id) REFERENCES driver(driver_id) ON DELETE CASCADE, current_location varchar(30), destination  varchar(30) unique, cost  number not null);

CREATE TABLE reviews (mem_id REFERENCES customer(user_id), driv_id REFERENCES driver(driver_id), CONSTRAINT review_id PRIMARY KEY(mem_id, driv_id), CONSTRAINT customer_fk2 FOREIGN KEY(mem_id) REFERENCES customer(user_id) ON DELETE CASCADE, CONSTRAINT driver_fk2 FOREIGN KEY(driv_id) REFERENCES driver(driver_id) ON DELETE CASCADE, review varchar(100), rating number);

CREATE TABLE trip_history (mem_id number, driv_id number, trip_id number, CONSTRAINT triphistory_fk FOREIGN KEY (mem_id, driv_id, trip_id) REFERENCES trip(mem_id, driv_id, trip_id), CONSTRAINT trip_history_pk PRIMARY KEY(mem_id, driv_id, trip_id), dateandtime date, current_location varchar(30), destination varchar(30));

exit;
EOF
