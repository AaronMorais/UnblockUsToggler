UnblockUsToggler
================

A bash script for OS X that toggles Unblock-Us DNS settings

This script takes advantage of the networksetup command line tool on OS X.
The '-setdnsservers' flag accepts network interface and DNS server address arguments.
Passing 'empty' in the place of DNS server addresses sets the DNS settings to the DHCP default for that network interface.

UnblockUsToggler accepts a network interface(e.g "Ethernet", "Wi-Fi") as an argument and defaults to the interface 'Wi-Fi' if one is not provided.
It also suports a '-d' flag that turns Unblock-Us DNS settings off.
