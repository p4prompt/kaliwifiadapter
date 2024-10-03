#!/bin/bash

clear
echo "Installer Version 2024"
echo "By P4prompt"
sleep 2

PS3='Please enter your choice: '
options=("Install Wifi Driver" "Show Commands" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Wifi Driver")
            echo "Installing Broadcom WiFi Driver..."
            echo "After Installation, your machine will reboot."
            
            # Update package list
            sudo apt-get update
            
            # Install required packages
            sudo apt-get install -y dkms build-essential broadcom-sta-dkms
            
            # Remove conflicting drivers
            sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
            
            # Load the Broadcom driver
            sudo modprobe wl
            
            echo "Rebooting the machine..."
            sleep 2
            sudo reboot
            ;;
        
        "Show Commands")
            echo "The following commands will be executed:"
            echo "1. sudo apt-get update"
            echo "2. sudo apt-get install -y dkms build-essential broadcom-sta-dkms"
            echo "3. sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma"
            echo "4. sudo modprobe wl"
            echo "5. sudo reboot"
            ;;
        
        "Quit")
            echo "Exiting..."
            break
            ;;
        
        *) echo "Invalid option, please try again.";;
    esac
done
