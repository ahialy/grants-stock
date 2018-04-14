#!/bin/bash

# Connection parameters to the MySQL instance
h=127.0.0.1
u=john;
p=doe;
db=mysql;

# List all users and the IPs of the machines they are connecting from
for t in $(echo $(mysql -h $h -u $u -p$p -D $db -Bse "SELECT CONCAT(QUOTE(User),'@',QUOTE(Host)) FROM mysql.user"))

do
    # Show grants for every 'user'@'ip'
    echo $(mysql -h $h -u $u -p$p -D $db -Bse "SHOW GRANTS FOR $t") >> backup_users_grants.txt
	
done
