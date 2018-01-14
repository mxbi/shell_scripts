# More info: https://github.com/01org/mkl-dnn#installation

NUM_THREADS=12

git clone https://github.com/01org/mkl-dnn.git &&
cd mkl-dnn &&
git checkout v0.12 &&

sudo apt-get install -y cmake &&

cd scripts &&
./prepare_mkl.sh && 
cd .. &&

mkdir -p build &&
cd build &&
cmake .. &&
make -j${NUM_THREADS} &&
make -j12 test &&
sudo make install &&
sudo ldconfig &&

echo "Done! :)"
