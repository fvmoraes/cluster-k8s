Vagrant.configure("2") do |config|
  
  #Start of configuration k8smain01
  config.vm.define "k8smain01" do |k8smain01|
    k8smain01.vm.network "public_network",
     bridge: "wlp3s0",
     ip: "192.168.77.101"
    k8smain01.vm.box = "ubuntu/bionic64"
    k8smain01.vm.hostname = "k8smain01.local"
    k8smain01.vm.synced_folder "shared/", "/shared"
    k8smain01.vm.disk :disk,
     size: "10GB",
     primary: true  
    k8smain01.vm.provision "shell",
      path: "script/provisioning.sh"
    k8smain01.vm.provision "shell",
      path: "script/main.sh"
    k8smain01.vm.provision "shell",
      inline: "sudo kubeadm token create --print-join-command > /shared/kubeadm-join.sh"
    k8smain01.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "k8smain01"
    end
  end
  #End of configuration k8smain01

  #Start of configuration k8sworker01
  config.vm.define "k8sworker01" do |k8sworker01|
    k8sworker01.vm.network "public_network",
     bridge: "wlp3s0",
     ip: "192.168.77.102"
    k8sworker01.vm.box = "ubuntu/bionic64"
    k8sworker01.vm.hostname = "k8sworker01.local"
    k8sworker01.vm.synced_folder "shared/", "/shared"
    k8sworker01.vm.disk :disk,
     size: "10GB",
     primary: true
    k8sworker01.vm.provision "shell",
     path: "script/provisioning.sh"
    k8sworker01.vm.provision "shell",
     path: "script/worker.sh"
    k8sworker01.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "k8sworker01"
    end  
  end
  #End of configuration k8sworker01

  #Start of configuration k8sworker02
  config.vm.define "k8sworker02" do |k8sworker02|
    k8sworker02.vm.network "public_network",
     bridge: "wlp3s0",
     ip: "192.168.77.103"
    k8sworker02.vm.box = "ubuntu/bionic64"
    k8sworker02.vm.hostname = "k8sworker02.local"
    k8sworker02.vm.synced_folder "shared/", "/shared"
    k8sworker02.vm.disk :disk,
     size: "10GB",
     primary: true
    k8sworker02.vm.provision "shell",
     path: "script/provisioning.sh"
    k8sworker02.vm.provision "shell",
     path: "script/worker.sh"
    k8sworker02.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "k8sworker02"
    end  
  end
  #End of configuration k8sworker02

  #Start of configuration k8sworker03
  config.vm.define "k8sworker03" do |k8sworker03|
    k8sworker03.vm.network "public_network",
     bridge: "wlp3s0",
     ip: "192.168.77.104"
    k8sworker03.vm.box = "ubuntu/bionic64"
    k8sworker03.vm.hostname = "k8sworker03.local"
    k8sworker03.vm.synced_folder "shared/", "/shared"
    k8sworker03.vm.disk :disk,
     size: "10GB",
     primary: true
    k8sworker03.vm.provision "shell",
     path: "script/provisioning.sh"
    k8sworker03.vm.provision "shell",
     path: "script/worker.sh"
    k8sworker03.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "k8sworker03"
    end  
  end
  #End of configuration k8sworker03

end
