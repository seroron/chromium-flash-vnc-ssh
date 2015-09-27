Chromium with Flash via VNC over SSH
==
This repository contains Dockerfile
 - Chromium with Flash
 - VNC over SSH tunneling

![screenshot](https://raw.githubusercontent.com/wiki/seroron/chromium-flash-vnc-ssh/snap1.png)

Usage
==
0. Create Docker image
```
docker pull seroron/chromium-flash-vnc-ssh
```
or
```
git clone https://github.com/seroron/chromium-flash-vnc-ssh.git
docker build -t seroron/chromium-flash-vnc-ssh chromium-flash-vnc-ssh
```

0. On the Docker host, lunch the container
```
docker run -d -p 10100:22 --name chromium-flash-vnc-ssh  -e SCREEN_WIDTH=1024 -e SCREEN_HEIGHT=768 -e SCREEN_DEPTH=16 -e SSH_PUBKEY=<your ssh private key> seroron/chromium-flash-vnc-ssh
```
example:
````
docker run -d -p 10100:22 --name chromium-flash-vnc-ssh  -e SCREEN_WIDTH=1024 -e SCREEN_HEIGHT=768 -e SCREEN_DEPTH=16 -e SSH_PUBKEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/0J1nNNfDiL5FqNTWgru0TynNSgbVlCtAYXn7zWHrLWr2kKPW5TtNHATte3RQBYqXjZjDHBj9+bCwXXxzo+b4j6YCYqtF/Q8/Gp7TCOAWhA4vuhvTM2zfPqzgtPs9C8FI46bGYEj1O2VdDGmmGC3ZegG+j/93elUMWQoN5hI3XBfaaQOlS4t7lIhkLtEQ07qiaDNgtY7tVqbnUcr2NS+H5VUh9y6jJDV6cQ9/4gPPhtxm2blRBPwPSjXoCUIN1c79CDs+I720LJBGqxIkicUEW7/Lggmy2Jo4PuT1/jrlLIbwk8glu1Z1cQ9AM13NezUSb7BTxzTJu2hY+er8s3dd' seroron/chromium-flash-vnc-ssh
```

0. On the your client device, connect to the container using ssh tunneling
```
ssh -i <path to your ssh private key> -p 10100 vncuser@<your docker host> -L 5900:localhost:5900
```

0. On the your client device, Connect to `localhost:5900` via VNC client

Licence
==
[MIT](https://github.com/seroron/chromium-flash-vnc-ssh/blob/master/LICENSE)

Author
==
[Kenichi HIROSE](https://github.com/seroron)
