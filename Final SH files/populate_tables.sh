#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "sahaque/09276425@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

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
INSERT INTO driver(driver_id, driver_name, rating, availlability) VALUES (5, 'Ahmed Hasan', 67, 'Yes');
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
exit;
EOF
