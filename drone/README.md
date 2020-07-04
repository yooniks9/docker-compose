# Drone CI

### Create a Oauth github apps

https://github.com/settings/developers

### Create a Oauth bitbucket apps

https://bitbucket.org/USERNAME_CHANGEME/workspace/settings/api

### Create a Shared Secret
#### Create a shared secret to authenticate communication between runners and your central Drone server.

You can use openssl to generate a shared secret:

```
$ openssl rand -hex 16
bea26a2221fd8090ea38720fc445eca6
```

### Vars

#### SSH_SERVER 

IP address of the server (Internet IP or Private IP)
#### SSH_USER - drone-runner
```
sudo adduser drone-runner
sudo su drone-runner
cd ~
ssh-keygen -t rsa -b 2048 -C drone-runner
cd .ssh
cat id_rsa.pub > authorized_keys
exit
sudo usermod -aG www-data drone-runner
sudo usermod -aG drone-runner www-data
sudo usermod -aG drone-runner ubuntu
sudo find /var/www -type f -exec chmod 664 {} + \
&& sudo find /var/www -type d -exec chmod 775 {} + \
&& sudo chown -R drone-runner:www-data /var/www
sudo chmod g+s /var/www
setfacl -R -m g:www-data:rwx /var/www
echo 'drone-runner ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers.d/drone-runner-init-user
```
#### SSH_PRIVATE_KEY

```
sudo cat /home/drone-runner/.ssh/id_rsa
```