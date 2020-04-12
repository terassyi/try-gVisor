
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "./docker", "/home/vagrant/work"
  config.vm.provision :shell, :path => "./install.sh"

end
