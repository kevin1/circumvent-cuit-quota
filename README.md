# Circumvent CUIT Quotas
## Overview
A quick and dirty Ruby script for circumventing the network quotas at a certain university. It works by changing your computer's MAC address when the quota is reached.

Your network connection will be interrupted for a few seconds when this happens, but that's much better than being throttled into oblivion.

## Usage
```
rvmsudo ruby circumvent_quota.rb [interface] [current MAC address]
rvmsudo ruby circumvent_quota.rb en0 01:23:45:67:89:ab
```

## Dependencies
- Ruby
- curl

## Compatibility
This has only been tested on OS X at the moment. To make it work on other platforms, you need to modify the strings in `set_mac_addr` and `set_interface`. 