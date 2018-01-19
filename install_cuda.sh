CUDA_URL="https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb"

wget $CUDA_URL -o cuda_repo.deb &&

sudo dpkg -i cuda_repo.deb &&
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub &&
sudo apt-get update &&
sudo apt-get install cuda &&

echo "CUDA installed. Preventing updates..."
sudo apt-mark hold cuda &&
sudo apt-mark hold cuda cuda-9-0 cuda-command-line-tools-9-0 cuda-core-9-0 cuda-cublas-9-0 cuda-cublas-dev-9-0 cuda-cudart-9-0 \
  cuda-cudart-dev-9-0 cuda-cufft-9-0 cuda-cufft-dev-9-0 cuda-curand-9-0 cuda-curand-dev-9-0 cuda-cusolver-9-0 cuda-cusolver-dev-9-0 \
  cuda-cusparse-9-0 cuda-cusparse-dev-9-0 cuda-demo-suite-9-0 cuda-documentation-9-0 cuda-driver-dev-9-0 cuda-drivers cuda-libraries-9-0 \
  cuda-libraries-dev-9-0 cuda-license-9-0 cuda-misc-headers-9-0 cuda-npp-9-0 cuda-npp-dev-9-0 cuda-nvgraph-9-0 cuda-nvgraph-dev-9-0 \
cuda-nvml-dev-9-0 cuda-nvrtc-9-0 cuda-nvrtc-dev-9-0 cuda-runtime-9-0 cuda-samples-9-0 cuda-toolkit-9-0 cuda-visual-tools-9-0 &&

echo "Adding to path..."
echo "" >> $HOME/.bashrc
echo "# CUDA (automatically added)" >> $HOME/.bashrc &&
echo "export PATH='/usr/local/cuda/bin/:$PATH" >> $HOME/.bashrc &&
echo "export LD_LIBRARY_PATH='/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> $HOME/.bashrc &&
sudo ldconfig &&

echo "Done! :)"
