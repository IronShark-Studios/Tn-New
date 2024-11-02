#! /bin/sh

echo "This script is meant to be run after the initial set up"
echo "of the local system and WebBrowser"
echo "including downloading app-images from Google Drive."
echo "Please press enter to continue"
read -r ConfirmationInput
echo

echo "Configuring Home Directory"
cd ~
mkdir ~/.ssh
mkdir ~/Projects
mkdir ~/Media
echo

echo "Creating System SSH-Key"
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
echo

echo "Please press enter after configuring git-source SSH."
read -r ConfirmationInput
echo

echo "Configuring Personal Archives"
cd ~
git clone git@github.com:IronShark-Studios/Apocrypha.git
git clone git@github.com:IronShark-Studios/Grimoire.git
cd ~/Projects
git clone git@github.com:IronShark-Studios/Technonomicon.git
git clone git@github.com:IronShark-Studios/IronShark-Studios.github.io.git
mv Iron-Shark.github.io Personal-Blog
cd ~
echo

echo "Configuring Doom Emacs"
rm -rf ~/.emacs.d
mkdir ~/.emacs.d
mkdir ~/.config/doom
cd ~/.emacs.d
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d	
~/.emacs.d/bin/doom install
emacs --batch -f nerd-icons-install-fonts
echo

echo "Updating hardware-configuration.nix"
cd ~tn/Thanatos/NixOS
rm ./hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ./hardware-configuration.nix

echo "Updating and Rebuilding System"
Upgrade
Rebuild

echo
echo "Home Directory Set Up Complete Please Rebuild"
