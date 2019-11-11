# Drone CI

### Create a Oauth github apps

https://github.com/settings/developers

### Create a Shared Secret
#### Create a shared secret to authenticate communication between runners and your central Drone server.

You can use openssl to generate a shared secret:

```
$ openssl rand -hex 16
bea26a2221fd8090ea38720fc445eca6
```