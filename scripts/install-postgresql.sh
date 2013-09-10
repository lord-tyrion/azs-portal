# Install postgre sql.
apt-get -y install postgresql
# Change postgres password.
echo "password:$POSTGRES_PASS" | chpasswd
