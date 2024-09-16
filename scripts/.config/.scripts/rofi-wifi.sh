#! /usr/bin/zsh
#!/bin/zsh

# Use nmcli to get the list of available Wi-Fi networks
networks=$(nmcli -t -f SSID,SECURITY dev wifi | grep -v '^--' | awk -F ':' '{print $1 " (" $2 ")"}')

# Use rofi to show the list of networks and get the user selection
selected_network=$(echo "$networks" | rofi -dmenu -p "Select Wi-Fi network:")

# If the user cancels the selection, exit the script
if [[ -z "$selected_network" ]]; then
  echo "No network selected. Exiting."
  exit 1
fi

# Extract the SSID (before the security type)
ssid=$(echo "$selected_network" | awk -F ' (' '{print $1}')

# Check if the selected network is secured (contains WPA or WEP)
if echo "$selected_network" | grep -q "WPA\|WEP"; then
  # Ask the user for the Wi-Fi password using rofi
  password=$(rofi -dmenu -p "Enter password for $ssid:")
fi

# Attempt to connect to the selected network using nmcli
if [[ -n "$password" ]]; then
  nmcli dev wifi connect "$ssid" password "$password"
else
  nmcli dev wifi connect "$ssid"
fi

# Check if the connection was successful
if [[ $? -eq 0 ]]; then
  echo "Connected to $ssid."
else
  echo "Failed to connect to $ssid."
fi

#
# notify-send "Getting list of available Wi-Fi networks..."
# # Get a list of available wifi connections and morph it into a nice-looking list
# wifi_list=''$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")
#
# connected=$(nmcli -fields WIFI g)
# if [[ "''$connected" =~ "enabled" ]]; then
#     toggle="󰖪  Disable Wi-Fi"
# elif [[ "''$connected" =~ "disabled" ]]; then
#     toggle="󰖩  Enable Wi-Fi"
# fi
#
# # Use rofi to select wifi network
# chosen_network=''$(echo -e "''$toggle\n''$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )
# # Get name of connection
# read -r chosen_id <<< "''${chosen_network:3}"
#
# if [ "''$chosen_network" = "" ]; then
#     exit
# elif [ "''$chosen_network" = "󰖩  Enable Wi-Fi" ]; then
#     nmcli radio wifi on
# elif [ "''$chosen_network" = "󰖪  Disable Wi-Fi" ]; then
#     nmcli radio wifi off
# else
#     # Message to show when connection is activated successfully
#     success_message="You are now connected to the Wi-Fi network \"''$chosen_id\"."
#     # Get saved connections
#     saved_connections=''$(nmcli -g NAME connection)
#     if [[ ''$(echo "''$saved_connections" | grep -w "''$chosen_id") = "''$chosen_id" ]]; then
#         nmcli connection up id "''$chosen_id" | grep "successfully" && notify-send "Connection Established" "''$success_message"
#     else
#         if [[ "''$chosen_network" =~ "" ]]; then
#             wifi_password=''$(rofi -dmenu -p "Password: " )
#         fi
#         nmcli device wifi connect "''$chosen_id" password "''$wifi_password" | grep "successfully" && notify-send "Connection Established" "''$success_message"
#     fi
# fi
