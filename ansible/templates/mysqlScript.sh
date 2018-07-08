#!/bin/bash
mysql -u root  -e STATUS
mysql <<EOFMYSQL
use mysql;
select user, host from mysql.user;
SET GLOBAL server_id=51;
SET GLOBAL connect_timeout=120;
SET GLOBAL binlog_checksum=NONE;
SET GLOBAL enforce_gtid_consistency=ON;
SET GLOBAL gtid_mode=OFF_PERMISSIVE;
SET GLOBAL gtid_mode=ON_PERMISSIVE;
SET GLOBAL gtid_mode=ON;

alter user 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'passw0rd';

reset master;
EOFMYSQL

