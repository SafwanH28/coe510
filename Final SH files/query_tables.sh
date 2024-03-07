#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

SELECT user_id, customer_name FROM customer WHERE user_id=1;
describe payment_info;
select * from customer;
select * from driver;
select * from payment_info;
select * from trip;
select * from ride;
select * from reviews;
select * from trip_history;


SELECT mem_id from trip UNION select mem_id FROM reviews; 
SELECT user_id from customer MINUS SELECT mem_id FROM trip;
select COUNT(trip_id) from trip;
select availlability, AVG(rating) AS avg_rating from driver GROUP BY availlability HAVING AVG(rating) > 80;
SELECT * FROM customer WHERE NOT EXISTS (SELECT * FROM trip WHERE customer.user_id = trip.mem_id);

SELECT distinct review from reviews WHERE rating <= 1;
SELECT driver_name, rating FROM driver Order BY rating desc;
describe trip;

exit;
EOF
