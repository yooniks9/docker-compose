SET
  GLOBAL gtid_slave_pos = '0-3000-0';
SET
  GLOBAL gtid_strict_mode = on;
CHANGE MASTER TO MASTER_HOST = '192.168.10.101',
  MASTER_PORT = 3306,
  MASTER_USER = 'maxusername',
  MASTER_PASSWORD = 'maxpassword',
  MASTER_USE_GTID = slave_pos;
START SLAVE;