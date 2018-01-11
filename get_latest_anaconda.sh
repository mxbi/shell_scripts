BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Installing Anaconda3. https://github.com/mxbi/shell_scripts/ ${NC}"

REPO="https://repo.continuum.io/archive/"

if [ "$(uname)" == "Darwin" ]; then
    echo "Detected MacOS"
    RC=".bash_profile"
    FILENAME="$(curl -s ${REPO} | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '[^/"]+' | grep MacOSX-x86_64.sh | grep Anaconda3 | head -n 1)" # Do something under Mac OS X platform
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Detected Linux"
    RC=".bashrc"
    FILENAME="$(curl -s ${REPO} | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -Eo '[^/"]+' | grep Linux-x86_64.sh | grep Anaconda3 | head -n 1)"  # Do something under GNU/Linux platform
fi

# Get filename of latest Anaconda
DL_URL=$REPO$FILENAME &&

echo -e "${BLUE}Downloading $DL_URL${NC}" &&
if [ -x "$(command -v wget)" ]
then
    wget $DL_URL -O $FILENAME
else
    curl $DL_URL > $FILENAME
fi &&

chmod u+x $FILENAME &&

echo -e "${BLUE}Installing $FILENAME${NC}" &&
./$FILENAME -b -u &&

echo -e "${BLUE}Deleting anaconda file${NC}" &&
rm $FILENAME &&

echo -e "${BLUE}Adding to ${RC}${NC}" &&
echo '' >> $HOME/${RC} &&
echo '# Anaconda3 installation' >> $HOME/${RC} &&
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> $HOME/${RC} &&

echo -e "${BLUE}Sourcing ${RC}${NC}" &&
source $HOME/${RC} &&

echo -e "${BLUE}DONE! :)${NC}" &&
python --version
