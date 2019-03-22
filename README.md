# xud-box
Builds a machine that has necessary system dependencies to run [xud-simnet](https://github.com/ExchangeUnion/xud-simnet).

## Install
Clone the repository.
`git clone https://github.com/ExchangeUnion/xud-box.git ~/xud-box`

## Usage

### Install Dependencies
* [virtualbox](https://www.virtualbox.org)
* [vagrant](https://www.vagrantup.com)

### Create Machine
```
cd ~/xud-box
./up.sh
```

### SSH into the machine
`./ssh.sh`

### Test the setup
```
xucli getinfo
xucli listpeers
xucli channelbalance
xucli getorders
```

### Destroy Machine
```
./destroy.sh
```

### Check Status
```
./status.sh
```

### Pause
```
./pause.sh
```

### Resume
```
./resume.sh
```

### Save box state
```
./snapshot.sh
```

### List saved states
```
./list-snapshots.sh
```

### Restore state
```
./restore.sh <name>
```
