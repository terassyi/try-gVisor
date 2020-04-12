# try-gVisor
gVisorを使ってみる

## Usage
### Start up
start up ubuntu16.04 virtual machine with vagrant
```
$ vagrant up
```
log in with ssh
```
$ vagrant ssh
```

### Use runsc
start up docker image with runsc
```
$ sudo docker run --runtime=runsc --rm -it ubuntu /bin/bash
```
