#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

SELECT driver.driver_id, driver.driver_name, ride.make, ride.model, ride.years FROM driver INNER JOIN ride ON driver.driver_id = ride.ride_id;

SELECT customer.customer_name, driver.driver_name, trip.current_location, trip.destination FROM customer INNER JOIN trip on customer.user_id = trip.mem_id INNER JOIN driver on driver.driver_id = trip.driv_id;


exit;
EOF
