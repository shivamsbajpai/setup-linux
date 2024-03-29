#!/bin/bash
echo "=============================================="
echo "general update & upgrade"
echo "=============================================="
### following command will find out the latest version of each package and dependencies
sudo apt update
### following command will update the packages and dependencies
sudo apt upgrade
###curl
echo "=============================================="
echo "installing curl"
echo "=============================================="
sudo snap install curl
###vim
echo "=============================================="
echo "installing vim"
echo "=============================================="
sudo apt-get install vim
###vlc
echo "=============================================="
echo "installing vlc"
echo "=============================================="
sudo snap install vlc
###install git
echo "=============================================="
echo "installing git..."
echo "=============================================="
sudo apt install git -y
###firefox
echo "=============================================="
echo "updating firefox policies..."
echo "=============================================="
sudo mkdir -p /etc/firefox/policies
sudo cp firefox_policies.json /etc/firefox/policies/policies.json
###dropbox
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
###install authy
echo "=============================================="
echo "installing authy"
echo "=============================================="
sudo snap install authy
###golang
echo "=============================================="
echo "installing go"
echo "=============================================="
sudo snap install go --classic
###install google chrome
echo "=============================================="
echo "installing google chrome"
echo "=============================================="
###to avoid adding google repository
sudo touch /etc/default/google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "=============================================="
echo "removing google chrome downloaded file"
echo "=============================================="
sudo rm google-chrome-stable_current_amd64.deb
###blueman
echo "=============================================="
echo "install bluetooth manager"
echo "=============================================="
sudo apt-get install blueman
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
sudo cp vs_code_settings.json $HOME/.config/Code/User/settings.json
###install vs code extensions
code --install-extension firefox-devtools.vscode-firefox-debug
mkdir ~/.firefox-debug-profile
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
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"
echo "=============================================="
echo "customizing ui"
echo "=============================================="
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 38
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.desktop.interface show-battery-percentage true
###following command lists all power related settings
####gsettings list-recursively org.gnome.settings-daemon.plugins.power
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'nothing'
###following command centers the dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
###following command appends the application icon to the dock favorites
####gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'application_name.desktop']"
###following command lists the favorite apps
gsettings get org.gnome.shell favorite-apps
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop','code.desktop', 'org.gnome.Terminal.desktop', 'gnome-system-monitor.desktop']"
echo "=============================================="
echo "installing nvm"
echo "=============================================="
###install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
###above command downloads an official nvm script and runs it
###install lts node => run in a new terminal 
echo "=============================================="
echo "installing lts version of node using nvm"
echo "=============================================="
nvm install --lts
echo "=============================================="
echo "installing web-ext for firefox extension development"
echo "=============================================="
npm install --global web-ext
###uninstallation command
####npm uninstall --global web-ext