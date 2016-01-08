#!/bin/sh

listen_on_all_interfaces() {
  cat > /etc/mysql/conf.d/mysql-listen.cnf <<EOF
[mysqld]
bind = 0.0.0.0
EOF
}


start_mysql(){
    /usr/bin/mysqld_safe > /dev/null 2>&1 &

    timeout=30
    while ! mysqladmin -u root status >/dev/null 2>&1
    do 
       timeout=$(($timeout - 1))
       if [ $timeout -eq 0 ]; then
          echo "Could not connect to mysql server, Aborting..."
          exit 1
       fi
       sleep 1
    done
 
}

stop_mysql(){
    /usr/bin/mysqladmin  shutdown
}

allow_root_remote_access() {
    start_mysql
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root' IDENTIFIED BY 'root';"
    stop_mysql

} 

listen_on_all_interfaces
allow_root_remote_access
start_mysql
