#! /bin/sh

sudo apt update

# install docker
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt -y install docker.io

# install gVisor
curl -fsSL https://gvisor.dev/archive.key | sudo apt-key add -
sudo add-apt-repository "deb https://storage.googleapis.com/gvisor/releases release main"
sudo apt-get update && sudo apt-get install -y runsc

sudo systemctl start docker

# add docker user group
sudo groupadd docker
sudo gpasswd -a $USER docker

# config runsc

echo '{
    "runtimes": {
        "runsc": {
            "path": "/usr/bin/runsc"
        }
    }
}' >> /etc/docker/daemon.json
sudo systemctl restart docker

sudo systemctl enable docker
