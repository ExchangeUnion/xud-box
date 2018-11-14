# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  $rootScript = <<-SCRIPT
  echo Building box...
  apt update -y
  export DEBIAN_FRONTEND=noninteractive
  apt upgrade -yq
  apt install make -y
  apt install python -y
  apt-get install golang-1.10-go -y
  ln -s /usr/lib/go-1.10/bin/go /usr/local/bin/go
  SCRIPT

  config.vm.provision "shell", inline: $rootScript

  $userScript = <<-SCRIPT
  echo Home is now: "$HOME"
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install v10.13.0
  nvm alias default v10.13.0
  nvm use v10.13.0
  echo NPM: $(npm --version)
  echo NODE: $(node --version)
  go version
  git clone https://github.com/ExchangeUnion/xud-simnet.git $HOME/xud-simnet
  echo "source ~/xud-simnet/setup.bash" >> ~/.bashrc
  source $HOME/xud-simnet/setup.bash
  xud-simnet-install
  xud-simnet-start
  SCRIPT

  config.vm.provision "shell", inline: $userScript, privileged: false

end
