# Rails Default App

Just a Rails App with default configurations to make my life easier in the future.

Api Keys links
* [google maps](https://developers.google.com/maps/documentation/javascript/get-api-key)
* [recaptcha](https://www.google.com/recaptcha/admin)

This next part is for my future references

## Production Install
### Setup SSH keys
To set this up, on the server type
```bash
ssh -T git@github.com
```
Don't worry if you get a Permission denied (publickey) message. Now, generate a SSH key (a Public/Private Key Pair) for the server:
```bash
ssh-keygen -t rsa -b 4096
```
Now add the contents in ~/.ssh/id_rsa.pub into github repo deployment keys. After run
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git clone git@github.com:EasyIP2023/rails_default.git
```
Finally add your local ssh keys to the authorized keys file on the server.
```bash
cat ~/.ssh/id_rsa.pub | ssh -p your_port_num deploy@your_server_ip 'cat >> ~/.ssh/authorized_keys'
```

**Dependencies**
```bash
sudo apt-get update
sudo apt install curl git-core nginx
sudo apt install mysql myclient-server mysql-client libmysqlclient-dev
```

**Setup rvm with ruby**

can get the latest version of [rvm here](https://rvm.io)

**First time login to DB**
```bash
sudo mysql -u root
```
```
create user 'rails_default'@'localhost' identified by 'Password1234';
create database rails_default_production;
grant all on rails_default_production.* to 'rails_default_user'@'localhost';
commit;
flush privileges;
exit;
```
**If DB exists**
```bash
mysql -u root -p rails_default_production < rails_default_backup.sql
```
