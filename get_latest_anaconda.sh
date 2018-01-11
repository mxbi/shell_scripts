BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Installing Anaconda3. https://github.com/mxbi/shell_scripts/ ${NC}"

REPO="https://repo.continuum.io/archive/"

# Get filename of latest Anaconda
FILENAME="$(wget -qO- ${REPO} | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '[^/"]+' | grep Linux-x86_64.sh | grep Anaconda3 | head -n 1)" &&
DL_URL=$REPO$FILENAME &&

echo -e "${BLUE}Downloading $DL_URL${NC}"
wget $DL_URL -O $FILENAME &&
chmod u+x $FILENAME &&

echo -e "${BLUE}Installing $FILENAME${NC}"
./$FILENAME -b -u &&

echo -e "${BLUE}Deleting anaconda file${NC}"
rm $FILENAME &&

echo -e "${BLUE}Adding to .bashrc${NC}"
echo '' >> $HOME/.bashrc &&
echo '# Anaconda3 installation' >> $HOME/.bashrc &&
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> $HOME/.bashrc &&

echo -e "${BLUE}Sourcing .bashrc${NC}"
source $HOME/.bashrc &&

echo -e "${BLUE}DONE! :)${NC}"
python --version
