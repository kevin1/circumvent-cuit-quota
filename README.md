# Circumvent CUIT Quotas
## Overview
A quick and dirty Ruby script for circumventing the network quotas at a certain university. It works by changing your computer's MAC address when the quota is reached.

Your network connection will be interrupted for a few seconds when this happens, but that's much better than being throttled into oblivion.

## Usage
1. Put your machine's current MAC address in the `mac_addr` variable.
2. Run it as root: `rvmsudo ruby circumvent_quota.rb`

## Dependencies
- Ruby
- curl

## Compatibility
This has only been tested on OS X at the moment. To make it work on other platforms, you need to modify the strings in `set_mac_addr` and `set_interface`. 