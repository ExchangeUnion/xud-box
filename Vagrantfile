# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.box = "ubuntu/xenial64"
  # config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  $rootScript = <<-SCRIPT
  export DEBIAN_FRONTEND=noninteractive
  echo Building box...
  add-apt-repository ppa:deadsnakes/ppa -y
  add-apt-repository ppa:ethereum/ethereum -y
  apt update -yq
  apt upgrade -yq
  apt-get install build-essential automake pkg-config libtool libffi-dev libgmp-dev golang-1.10-go -y
  ln -s /usr/lib/go-1.10/bin/go /usr/local/bin/go
  apt install python python3.7 -y
  snap install solc
  SCRIPT

  config.vm.provision "shell", inline: $rootScript

  $userScript = <<-SCRIPT
  echo Home directory: "$HOME"
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install v10.13.0
  nvm alias default v10.13.0
  nvm use v10.13.0
  echo NPM: $(npm --version)
  echo NODE: $(node --version)
  go version
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3.7 get-pip.py --user
  pip3.7 install --user virtualenv
  git clone https://github.com/ExchangeUnion/xud-simnet.git $HOME/xud-simnet
  echo "source ~/xud-simnet/setup.bash" >> ~/.bashrc
  source $HOME/xud-simnet/setup.bash
  xud-simnet-install
  xud-simnet-start
  xud-simnet-channels
  SCRIPT

  config.vm.provision "shell", inline: $userScript, privileged: false

end
