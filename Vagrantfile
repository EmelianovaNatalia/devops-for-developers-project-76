Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
  
    config.vm.define "vm1" do |vm1|
      vm1.vm.hostname = "vm1"
      vm1.vm.network "private_network", ip: "192.168.56.11"
      vm1.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      vm1.vm.provision "shell", path: "vm-setup/install-docker.sh"
      vm1.vm.provision "shell", path: "vm-setup/setup-ufw.sh", args: "app"
    end
  
    config.vm.define "vm2" do |vm2|
      vm2.vm.hostname = "vm2"
      vm2.vm.network "private_network", ip: "192.168.56.12"
      vm2.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      vm2.vm.provision "shell", path: "vm-setup/install-docker.sh"
      vm2.vm.provision "shell", path: "vm-setup/setup-ufw.sh", args: "app"
    end
  
    config.vm.define "vm3" do |vm3|
      vm3.vm.hostname = "vm3"
      vm3.vm.network "private_network", ip: "192.168.56.13"
      vm3.vm.network "forwarded_port", guest: 80, host: 8080
      vm3.vm.network "forwarded_port", guest: 8404, host: 8404
      vm3.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      vm3.vm.provision "shell", path: "vm-setup/setup-ufw.sh", args: "balancer"
      vm3.vm.provision "shell", inline: <<-SHELL
        apt-get update -y
        apt-get install -y haproxy postgresql postgresql-contrib
        cp /vagrant/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg
        systemctl restart haproxy
        systemctl enable haproxy
        sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '192.168.56.13'/" \
          /etc/postgresql/14/main/postgresql.conf
        echo "host all all 192.168.56.11/32 md5" >> /etc/postgresql/14/main/pg_hba.conf
        echo "host all all 192.168.56.12/32 md5" >> /etc/postgresql/14/main/pg_hba.conf
        systemctl restart postgresql
        sudo -u postgres psql -f /vagrant/db/init.sql
      SHELL
    end
  end