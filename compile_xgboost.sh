#!/bin/bash
# This installs the bleeding-edge version of xgboost with GPU support - pip install is fine if you want the latest release.

NUM_THREADS=12

sudo apt-get install -y cmake

git clone --recursive https://github.com/dmlc/xgboost.git &&
cd xgboost &&
mkdir build &&
cd build &&
cmake ..  -DUSE_CUDA=ON -DUSE_AVX=ON &&

make -j${NUM_THREADS} &&

cd ../python-package &&
python setup.py install &&

echo "Done! :)"
