Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 8001, host: 8001
  config.vm.network "forwarded_port", guest: 8002, host: 8002
  config.vm.network "forwarded_port", guest: 8003, host: 8003
  config.vm.network "forwarded_port", guest: 8004, host: 8004
  config.vm.network "forwarded_port", guest: 8005, host: 8005
  config.vm.network "forwarded_port", guest: 8006, host: 8006
  config.vm.network "forwarded_port", guest: 8007, host: 8007
  config.vm.network "forwarded_port", guest: 8008, host: 8008
  config.vm.network "forwarded_port", guest: 8009, host: 8009
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "5120"  # Specify the memory size in MB
    # Other provider-specific configurations...
  end
end

