curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
dnf module disable mysql -y

yum install mysql-community-server -y

systemctl enable mysqld
systemctl start mysqld

echo "ALTER USER 'root'@'localhost IDENTIFIED BY 'Roboshop@1';" > /tmp/root-pass-mysql
DEFAULT_PASSWORD=$(grep ' A temporary password' /var/log/mysql.log | awk '{print $NF}')

cat /tmp/root-pass-sql | mysql --connect-expired-password -uroot -p"sEGYgp>=k5W0"