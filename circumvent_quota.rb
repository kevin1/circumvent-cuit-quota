# Check whether this machine is over the quota
# Returns true if over quota, false otherwise
def is_over_quota
  quota_text = `curl -s http://www.columbia.edu/cgi-bin/acis/networks/quota/netquota.pl`
  return quota_text.include?("bad.png")
end

# Increment the MAC address provided
def next_mac_addr(current_addr)
  # Get the last 2 characters of the string and interpret as hexadecimal
  ls_byte = current_addr[15..16].to_i(16)
  # Increment with wraparound
  ls_byte = (ls_byte + 1) % 256
  # Convert it back to a hexadecimal string
  return current_addr[0..14] + ls_byte.to_s(16)
end

# Sets the MAC address
def set_mac_addr(interface, mac)
  system("ifconfig #{interface} ether #{mac}")
end

# Take an interface up or down
def set_interface(interface, direction)
  system("ifconfig #{interface} #{direction}")
end

if ARGV.length != 2
  puts("  usage: rvmsudo ruby circumvent_quota.rb [interface] [current MAC address]")
  puts("example: rvmsudo ruby circumvent_quota.rb en0 01:23:45:67:89:ab")
  exit(false)
end

interface = ARGV[0]
mac_addr = ARGV[1]

while true
  if is_over_quota
    # Increment the MAC address
    mac_addr = next_mac_addr(mac_addr)

    puts("#{Time.now}\tNew MAC: #{mac_addr}\n")

    # Spoof MAC address
    set_mac_addr(interface, mac_addr)
    # Restart the interface
    set_interface(interface, "down")
    set_interface(interface, "up")
  end

  sleep 5
end