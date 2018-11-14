# xud-box
Launch a fresh/new xud-simnet instance with 1 command.

## Install
Clone the repository.
`git clone https://github.com/ExchangeUnion/xud-box.git ~/xud-box`

## Usage

### Create machine
```
cd ~/xud-box
./xud-box-up.sh
```

### SSH into the machine
`./xud-box-ssh.sh`

### Test the setup
`source ~/xud-simnet/setup.bash`
`xucli getorders`

## Dependencies
* [virtualbox](https://www.virtualbox.org)
* [vagrant](https://www.vagrantup.com)
