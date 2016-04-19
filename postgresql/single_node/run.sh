#!/bin/sh

PG_CONF=/etc/postgresql/9.3/main/postgresql.conf

#listend on all address
sed -i -- "s/^#listen_addresses.*/listen_addresses = '*'/g"  $PG_CONF

#allow all connection with password
echo "host    all     all        0.0.0.0/0                 md5" >>   /etc/postgresql/9.3/main/pg_hba.conf


/etc/init.d/postgresql  start


sudo -u postgres psql  -c "ALTER USER postgres with encrypted password'postgres'"

echo "Login with 'env  PGPASSWORD=postgres psql   -h 127.0.0.1  -U postgres'"

/bin/sh
