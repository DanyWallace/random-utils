require 'inifile'

# install mariadb = "sudo apt-get install mariadb"
# secure_install = "sudo mysql_secure_installation"
# ruby deps = "sudo apt-get install ruby-mysql2 default-libmysqlclient-dev && gem install mysql2"

client = Mysql2::Client.new(
  :host => "#{settingini['db']['host']}",
  :username => "#{settingini['db']['username']}",
  :database => "#{settingini['db']['database']}",
  :password => "#{settingini['db']['password']}"
)

def reset_root (new_password)
	stop_mariadb = `sudo systemctl stop mariadb`
	start_mariadb = `sudo mysqld_safe --skip-grant-tables --skip-networking &`

	reset_password = "mysql -u root \
  "UPDATE mysql.user SET authentication_string = PASSWORD('Passwordexample4u') WHERE User = 'root' AND Host = 'localhost';""
end

def create_mysql_user (username, password)
	client.query("CREATE USER '#{username}'@'localhost' IDENTIFIED BY '#{password}';")
end