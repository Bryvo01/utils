#!/bin/sh

# Get the latest package list
sudo apt update

# Do the updates
sudo apt-get update

# Install wget
sudo apt install -y software-properties-common apt-transport-https wget

# Download the Debian Linux Chrome Remote Desktop installation package:
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb

# Install the package and its dependencies:
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install -y --fix-broken

# Remove unnecessary file after the installation is done:
rm chrome-remote-desktop_current_amd64.deb

# Install Firefix
sudo apt -y install firefox

# Install Chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install -y --fix-broken

# Remove unnecessary file after the installation is done:
rm google-chrome-stable_current_amd64.deb

# Disable the display manager service:
# There is no display connected to the VM --> the display manager service won't start.
sudo systemctl disable lightdm.service

# START Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get install apt-transport-https ca-certificates gnupg

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudp apt-get update
sudo apt-get install -y google-cloud-sdk

# END Install Google Cloud SDK

# START Install AWS CLI
# This is needed to interact with AWS resources

# Download the insstallation file
curl "https://awscli.amazoneaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
unzip awscliv2.zip

# Run the install program
sudo ./aws/install

# Remove unnecessary file after the installation is done:
rm awscliv2.zip

# END Install AWS CLI

# Install VSCode
#sudo snap install --classic code

# Install PyCharm Pro
sudo snap install pycharm-professional --classic

# Remove any orphaned dependencies
sudo apt autoremove

# Bring in the .bashrc and .bash_aliases
git clone https://github.com/Bryvo01/utils.git
mv utils/.bashrc ~/.bashrc
mv utils/.bash_aliases ~/.bash_aliases

# Get rid of the directory
rm -rf utils/
