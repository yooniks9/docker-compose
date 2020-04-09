RESET MASTER;
CREATE DATABASE test;
CREATE USER 'maxusername' @'127.0.0.1' IDENTIFIED BY 'maxpassword';
CREATE USER 'maxusername' @'%' IDENTIFIED BY 'maxpassword';
GRANT ALL ON *.* TO 'maxusername' @'127.0.0.1' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'maxusername' @'%' WITH GRANT OPTION;
SET
  GLOBAL max_connections = 10000;
SET
  GLOBAL gtid_strict_mode = ON;