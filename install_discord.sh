#!/bin/bash

wget "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb &&

sudo dpkg -i discord.deb

if [[ $? -eq 1 ]]
then
	echo "Failed to install discord, installing missing dependencies."
	sudo apt-get install -f -y &&
	sudo dpkg -i discord.deb
fi &&

rm discord.deb &&

echo "Done :)"
