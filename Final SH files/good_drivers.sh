#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

SELECT driver_name, rating FROM driver Where rating > 80 Order by rating desc;

exit;
EOF

