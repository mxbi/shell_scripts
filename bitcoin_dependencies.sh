# Install various dependencies needed to compile Bitcoin Core and it's derivatives (basically every other coin's full node)

sudo apt-get update &&
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 &&
sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev &&
sudo apt-get install -y software-properties-common &&
yes | sudo add-apt-repository ppa:bitcoin/bitcoin &&
sudo apt-get update &&
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev &&
sudo apt-get install -y libminiupnpc-dev libzmq3-dev &&
sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler &&

wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz -O libsodium-1.0.16.tar.gz &&
tar xvf libsodium-1.0.16.tar.gz &&
rm libsodium-1.0.16.tar.gz &&
cd libsodium-1.0.16/ &&
./configure &&
make -j8 &&
make check -j8 &&
sudo make install &&
cd .. &&
rm -rf libsodium-1.0.16/ &&

echo "Done! :)"
