!#/bin/bash

sudo apt install firmware-linux-nonfree
sudo apt-get update
sudo apt-get install firmware-iwlwifi
sudo apt install modprobe
dpkg -S modprobe
sudo apt install tree
sudo modprobe -r iwlwifi ; sudo modprobe iwlwifi