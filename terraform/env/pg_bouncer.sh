#!/bin/bash
apt-get update
apt-get install -y pgbouncer

#Configure PgBouncer
cat <<EOF > /etc/pgbouncer/pgbouncer.ini
[databases]
* = host=<your-db-hostname> port=5432
[pgbouncer]
listen_addr = 0.0.0.0
listen_port = 6432
auth_type = trust
auth_file = /etc/pgbouncer/userlist.txt
admin_users = postgres
pool_mode = session
server_reset_query = DISCARD ALL
EOF
# Create userlist.txt with database credentials
cat <<EOF > /etc/pgbouncer/userlist.txt
"postgres" "<your-db-password>"
EOF
systemctl restart pgbouncer
