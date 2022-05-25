# -*- mode: ruby -*-
# vi: set ft=ruby :
MASTER_IP       = "172.16.8.10"
NODE_IP      = "172.16.8.11"


Vagrant.configure("2") do |config|

  config.vm.define "server-1" do |server1|
    server1.vm.box = "geerlingguy/ubuntu2004"
    server1.vm.box_version = "1.0.3"
    server1.vm.hostname = "server1"
    server1.vm.network "private_network", ip: MASTER_IP
    server1.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
    end
    server1.vm.provision "shell", path:"./install-kubernetes-dependencies.sh"
    server1.vm.provision "shell", path:"./configure-master-node.sh"
  end



  config.vm.define "server-2" do |server2|
    server2.vm.box = "geerlingguy/ubuntu2004"
    server2.vm.box_version = "1.0.3"
    server2.vm.hostname = "server2"
    server2.vm.network "private_network", ip: NODE_IP
    server2.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
    end
    server2.vm.provision "shell", path:"./install-kubernetes-dependencies.sh"
    server2.vm.provision "shell", path:"./configure-worker-nodes.sh"
  end
  

  config.vm.define "server-3" do |server3|
    server3.vm.box = "ubuntu/bionic64"
    server3.vm.host_name = "server3"
    server3.vm.network "private_network", ip:"192.168.100.10"
    server3.vm.network "forwarded_port", guest: 22, host: 2222, auto_correct: true
    server3.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    server3.vm.provision "shell", path: "server3conf.sh"
    server3.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end
end

