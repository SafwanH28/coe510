#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "USERNAME/PASSWORD@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=HOST)(Port=PORT))(CONNECT_DATA=(SID=orcl)))" <<EOF

insert into advertisement (advertisement_id, company) values (1, "google");
insert into advertisement (advertismeent_id, company) values (2, "TMU");
