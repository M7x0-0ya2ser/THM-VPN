#!/bin/bash

echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[91m█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗\e[0m"
echo -e "\e[32m╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝\e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[97m                \e[91m ███████╗██╗  ██╗███╗   ███╗    ██╗   ██╗██████╗ ███╗   ██╗               \e[0m"
echo -e "\e[97m                \e[32m╚══██╔══╝██║  ██║████╗ ████║    ██║   ██║██╔══██╗████╗  ██║               \e[0m"
echo -e "\e[97m                   ██║   ███████║██╔████╔██║    ██║   ██║██████╔╝██╔██╗ ██║               \e[0m"
echo -e "\e[97m                   ██║   ██╔══██║██║╚██╔╝██║    ╚██╗ ██╔╝██╔═══╝ ██║╚██╗██║               \e[0m"
echo -e "\e[97m                   ██║   ██║  ██║██║ ╚═╝ ██║     ╚████╔╝ ██║     ██║ ╚████║               \e[0m"
echo -e "\e[97m                   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝      ╚═══╝  ╚═╝     ╚═╝  ╚═══╝               \e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "                                         \e[91m@M7x\e[0m\e[32m0_0\e[0m\e[97mya2ser\e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[91m█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗\e[0m"
echo -e "\e[32m╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝\e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[97m                                                                                          \e[0m"
echo -e "\e[97m                                                                                          \e[0m"


# Check if script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo -e "\e[31mPlease run this script with sudo.\e[0m"
  exit 1
fi

connect_to_warp() {
  echo "Connecting to Warp..."
  warp-cli connect
  sleep 5
  ifconfig CloudflareWARP > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo -e "\e[34mConnected to Warp successfully.\e[0m"
  else
    echo -e "\e[31mConnected to Warp failed.\e[0m"
  fi
}

disconnect_from_openvpn() {
    echo "Disconnecting from OpenVPN..."
    sudo killall openvpn
    sleep 5  # Adjust the sleep duration based on your OpenVPN disconnection time
}

connect_to_openvpn() {
    source config.txt
    echo "Connecting to OpenVPN..."
    sudo openvpn $openvpn_path > /dev/null 2>&1 &
    sleep 10

    if ip link show tun0 &> /dev/null
    then
        echo -e "\e[34mOpenVPN connection successful.\e[0m"
    else
        echo -e "\e[31mOpenVPN connection failed.\e[0m"
    fi
}

perform_ping_test() {
    echo "Pinging..."
    ping 10.10.10.10 -c 3 | grep "3 received" > /dev/null 2>&1
    sleep 3
    if [ $? -eq 0 ]
    then
        echo -e "\e[34mPinging successfully.\e[0m"
    else
        echo -e "\e[31mPinging failed.\e[0m"
    fi
}

disconnect_from_warp() {
    echo "Disconnecting from Warp..."
    warp-cli disconnect
}

connect() {
    source config.txt
    if [ "$opt" == "Connect" ]
    then
        if [ ! -e "config.txt" ]
        then
            echo -e "\e[31mConfiguration file (config.txt) not found. Please assign an OpenVPN file using 'assign OPENVPN file path'.\e[0m"
            return  # Stop execution if config file doesn't exist
        else
            source config.txt
            if [ "$openvpn_path" ]
            then
                connect_to_warp 

                connect_to_openvpn

                perform_ping_test

                disconnect_from_warp
            else
                echo -e "\e[31mopenvpn_path not found. You should assign an OpenVPN file.\e[0m"
            fi
        fi
    fi
}

disconnect() {
    disconnect_from_openvpn
    disconnect_from_warp
}

config_file_path_fun(){
    # Check if the config file exists
    if [ ! -e "config.txt" ] 
    then
        # If it doesn't exist, prompt the user for input
        read -p "Enter the path to your OpenVPN configuration file: " config_from_user

        # Save the user input to the config file
        echo "openvpn_path=$config_from_user" > config.txt
    else
        # If the config file exists, source it to load the variables
        . config.txt
        echo -e "\e[32mConfiguration file (config.txt) already exists.\e[0m"
    fi
}

Change_path(){
    # Check if the config file exists
    if [ -e "config.txt" ] 
    then
        # If it doesn't exist, prompt the user for input
        read -p "Enter the new path to your OpenVPN configuration file: " config_from_user

        # Save the user input to the config file
        echo "openvpn_path=$config_from_user" > config.txt
    else
        echo -e "\e[31mYou should assign an OpenVPN file.\e[0m"
    fi
}

select opt in Connect Disconnect "assign OPENVPN file path" "Change OPENVPN file path" quit
do
    if [ "$opt" == "Connect" ]
    then
        connect

    elif [ "$opt" == "Disconnect" ]
    then
        disconnect

    elif [ "$opt" == "assign OPENVPN file path" ]
    then
        config_file_path_fun

    elif [ "$opt" == "Change OPENVPN file path" ]
    then
        Change_path

    elif [ "$opt" == "quit" ]
    then
        exit

    else
        echo -e "\e[31mInvalid Option\e[0m"

    fi

done
