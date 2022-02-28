# Cluster Kubernetes with Vagrant
---
---
## Structure and technologies used

### What purpose?
> This cluster has as main objective the learning of technologies,
> initially at the IAC level and later for DevOps process studies.

### Technologies used:
- [Vagrant](https://www.vagrantup.com/intro)
- [Docker](https://docs.docker.com/get-started/)
- [ShelScript](https://www.shellscript.sh/)
- [Kubernetes](https://kubernetes.io/docs/setup/)
- [VirtualBox](https://www.virtualbox.org/wiki/Documentation)

### Basic structure:
> 4x VM's, each containing: 2GB of memory, 2vCPU, 40GB of dynamically allocated Disk,
> network interface in bridge mode and for operating system, Ubuntu Bionic Beaver 18.04 LTS.

### Basic topology:
![](/img/topology.png)

---
---
## How to use

### What hardware is needed on the computer?
> 8GB of Memory, Processor with 8 cores (physical or virtual),
> 10GB of available disk space and a network adapter with internet connection.

#### Additional remarks *
> In case you don't have the specified amount of hardware, you can remove the configuration block in the
> Vagrantfile for worker03. Do not modify the CPU or Memory values ​​of the cluster nodes to less than what is
> already configured!

### What do I need to have installed on my computer?
- [Vagrant](https://www.vagrantup.com/docs/installation)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Files to be modified:
> Modify the value of "advertiseAddress" in [kubeadm-config.yaml](/shared/kubeadm-config.yaml) with your network information, as follows:
```yml
...
  advertiseAddress: "your-ip-address-for-k8smain01"
...
```
> Modify the value of "bridge" and "ip" in [Vagrantfile](/Vagrantfile) with your network information, as follows:
```rb
    ...
    k8smain01.vm.network "public_network",
     bridge: "your-network-interface-name",
     ip: "your-ip-address-for-k8smain01"
    ...
    k8sworker01.vm.network "public_network",
     bridge: "your-network-interface-name",
     ip: "your-ip-address-for-k8sworker01"
    ...
    k8sworker02.vm.network "public_network",
     bridge: "your-network-interface-name",
     ip: "your-ip-address-for-k8sworker02"
    ...
    k8sworker03.vm.network "public_network",
     bridge: "your-network-interface-name",
     ip: "your-ip-address-for-k8sworker03"
    ...
```

#### Additional remarks *
> To get the interface name information, use the commands:
> - GNU/Linux: ```ip a | grep mtu ```
> - macOs: ``` ifconfig | grep mtu ```
> - Windows: ```ipconfig /all | find /i "Description" ```

> Use an interface from your routed local network (which has internet access) to define the IP address of the VM's!

### Files that will be modified automatically:
> The file [kubeadm-join.sh](/shared/kubeadm-join.sh) will be modified automatically, no changes are needed in this file, it will receive data as follows:
```sh
kubeadm join <ip-of-k8smain01>:6443 --token <token> --discovery-token-ca-cert-hash sha256:<discovery-token>
```

### How to run the project on my computer?
> - Download the project in the github root repository [cluster-k8s](https://github.com/fvmoraes/cluster-k8s).
> - Inside the directory, open the terminal and run the command ```vagrant up```.
> - If you have any problems, use ```vagrant destroy``` to delete the VM's.
> - The ```vagrant halt``` command will just stop the VM's.

---
---
## Validation commands

### List of commands and their outputs:
> Using Vagrant's SSH utility (```vagrant ssh```) access VM k8smain01 (```vagrant ssh k8smain01```),
> and use the following list of commands to validate cluster operation:

| Command | Applicability |
| ------ | ------ |
| kubectl get nodes -o wide | Node state information |
| kubectl get namespaces | Information about existing namespaces |
| kubectl get pods -n kube-system -o wide | Make sure the kube-proxy pod exists and the state is Running |
| kubectl describe pod yourPodName -n kube-system | Specific pod events |
| kubectl logs yourPodName -n kube-system | Specific pod logs |
| kubectl describe node nodeName | information about the state of a specific node |

---
---
## References

### Documentation used to create this project:
- https://e-tinet.com/linux/vagrant/
- https://medium.com/@fidelissauro/kubernetes-criando-um-cluster-simples-com-o-kubeadm-e50a9eb4f4a6
- https://www.weave.works/docs/net/latest/kubernetes/kube-addon/#pod-network
- https://www.youtube.com/watch?v=CNZmKjklfeg


---
---
_end of README.md_
