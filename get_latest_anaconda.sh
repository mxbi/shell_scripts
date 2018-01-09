REPO="https://repo.continuum.io/archive/"

# Get filename of latest Anaconda
FILENAME="$(wget -qO- ${REPO} | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '[^/"]+' | grep Linux-x86_64.sh | grep Anaconda3 | head -n 1)"
DL_URL=$REPO$FILENAME

echo "Downloading $DL_URL"
wget $DL_URL
chmod u+x $FILENAME

echo "Installing $FILENAME"
./$FILENAME -b

echo "Deleting anaconda file"
rm $FILENAME

echo "Adding to .bashrc"
echo '' >> $HOME/.bashrc
echo '# Anaconda3 installation' >> $HOME/.bashrc
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> $HOME/.bashrc

echo "Sourcing .bashrc"
source $HOME/.bashrc

echo "DONE! :)"
python --version
