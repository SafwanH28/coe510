#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

CREATE VIEW good_drivers AS SELECT driver_name, rating FROM driver WHERE rating > 85; 
CREATE VIEW old_customers AS SELECT customer_name, user_id FROM customer WHERE user_id < 4;
CREATE VIEW availlable_drivers AS SELECT driver_name, rating, availlability FROM driver WHERE availlability = 'Yes';

exit;
EOF
