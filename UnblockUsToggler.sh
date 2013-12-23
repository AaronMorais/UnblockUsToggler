#!/bin/bash          
# Aaron Morais 2013
# Unblock-Us toggler for OS-X
# Accepts no arguments to enable Unblock-Us DNS server settings on Wi-Fi
# Accepts one argument to specify the network name
# Accepts a '-d' flag that disables Wi-Fi
# Enabling the flag sets the DNS servers to the DHCP default

setNetworkDNS() {
    sudo networksetup -setdnsservers $1 $2 $3
} 

enableUnblockUS () {
    setNetworkDNS $1 208.122.23.22 208.122.23.23
}

disableUnblockUS () {
    setNetworkDNS $1 empty
}

errorExit () {
    echo "Error! $1"
    exit 1
}

defaultNetworkName=Wi-Fi
disableFlagKey='-d'

if [ "$#" -eq 0 ]; then
    enableUnblockUS $defaultNetworkName
    exit 0
fi

if [ "$#" -eq 1 ]; then
    if [[ $1 == -* ]]; then
        if [ $1 == $disableFlagKey ]; then
            disableUnblockUS $defaultNetworkName
        else 
            errorExit "$1 is an invalid flag."
        fi
    else 
        enableUnblockUS $1
    fi
    exit 0
fi

if [ "$#" -eq 2 ]; then
    if [ $1 == $disableFlagKey ]; then
        disableUnblockUS $2
        exit 0
    fi
    if [ $2 == $disableFlagKey ]; then
        disableUnblockUS $1
        exit 0
    fi
    errorExit "You've provided invalid arguments."
    exit 0
fi

if [ "$#" -gt 2 ]; then
    errorExit "You have provided too many arguments."
fi
