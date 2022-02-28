#!/bin/bash

sudo apt update && sudo apt full-upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common git
sudo curl -fsSL https://get.docker.com | sh
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo echo \
'{
    "exec-opts": ["native.cgroupdriver=systemd"]
}' > /etc/docker/daemon.json
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo mount -a
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart kubelet
