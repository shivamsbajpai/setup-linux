#!/bin/bash
echo "=============================================="
echo "updating package manager index..."
echo "=============================================="
sudo apt update
###firefox
echo "=============================================="
echo "updating firefox policies..."
echo "=============================================="
sudo mkdir -p /etc/firefox/policies
sudo cp firefox_policies.json /etc/firefox/policies/policies.json
###vs code
echo "=============================================="
echo "installing vs code..."
echo "=============================================="
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
###vs code settings
cp vs_code_settings.json $HOME/.config/Code/User/settings.json
###install git
echo "=============================================="
echo "installing git..."
echo "=============================================="
sudo apt install git -y
echo "=============================================="
echo "setup complete"
echo "=============================================="
echo "=============================================="
echo "activating env.sh"
echo "=============================================="
source env.sh
echo "=============================================="
echo "configuring git"
echo "=============================================="
git config user.email "$GIT_EMAIL"
git config user.name "$GIT_NAME"
echo "=============================================="
echo "downloading dropbox"
echo "=============================================="
wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
echo "=============================================="
echo "installing dropbox"
echo "=============================================="
sudo dpkg -i dropbox.deb
###uninstall dropbox
####sudo apt-get remove dropbox
echo "=============================================="
echo "customizing ui"
echo "=============================================="
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 38
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true