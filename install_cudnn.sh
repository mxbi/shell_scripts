CUDNN_TAR = "cudnn-9.0-linux-x64-v7.tgz"

tar xvf $CUDNN_TAR
sudo cp cuda/include/* /usr/local/cuda/include/
sudo cp cuda/lib64/* /usr/local/cuda/lib64/

rm -rf cuda
