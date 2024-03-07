#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

ALTER TABLE customer RENAME COLUMN date_of_birth to DOB;

UPDATE Customer SET customer_name = 'Drake', email= 'Drizzy@gmail.com', DOB = '24-OCT-1986' WHERE user_id = 1;

exit;
EOF

