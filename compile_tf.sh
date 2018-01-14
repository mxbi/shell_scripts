git clone https://github.com/tensorflow/tensorflow.git &&

#sudo apt install openjdk-8-jdk
#yes | sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update && sudo apt-get install oracle-java8-installer

sudo apt-get install -y libcupti-dev  &&
sudo apt-get install -y pkg-config zip g++ zlib1g-dev unzip python &&

wget https://github.com/bazelbuild/bazel/releases/download/0.8.1/bazel_0.8.1-linux-x86_64.deb -O bazel.deb &&
sudo dpkg -i bazel.deb &&
rm bazel.deb &&

cd tensorflow &&
git checkout v1.4.1 &&

echo "!!!!!!!!! TENSORFLOW CONFIGURING:"
# Build with cuda support => y
# Cuda version => 9.0
# CuDNN version => 7.0.5
# All other configure options default (this will vary depending on your system).
./configure &&

bazel clean &&
bazel build --config=mkl --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package &&

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg &&
pip install /tmp/tensorflow_pkg/*.whl &&
rm /tmp/tensorflow_pkg/*.whl &&

echo "Done! :)"
