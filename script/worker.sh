#!/bin/bash

#Change shared file permission
sudo chmod +x /shared/kubeadm-join.sh
#Enter the directory and execute the file
cd /shared
sudo ./kubeadm-join.sh
