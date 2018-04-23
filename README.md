# shell_scripts
Various bash scripts I've written and I use for setting machines up. These have all been tested on Ubuntu.

The windows/ folder includes various powershell scripts and registry edits I use.

Everything in this repo is provided without warranty of any kind - I recommend reading the scripts before running them as they may not be tailored for your use case.

## get_latest_anaconda.sh
Fetches the latest build of Anaconda3, installs it (without user prompts), adds it to bashrc, reloads the shell, and cleans up after itself.  
Basically takes you from a fresh system to one with Python/Anaconda setup and ready to use. **Also supports MacOS**

Easily run from any machine: ```curl https://conda.ml | bash```

## get_latest_miniconda.sh
Same as get_latest_anaconda.sh, just installing Miniconda instead.

Easily run from any machine: ```curl https://mini.conda.ml | bash```

## install_mkl_dnn.sh
Downloads, compiles and installs [mkl-dnn](https://github.com/01org/mkl-dnn). This is a requirement for using TensorFlow with MKL (eg. from compile_tf.sh)

## compile_tf.sh
Installs bazel, then downloads, compiles and installs TensorFlow v1.4.1 from source. Uses CUDA and MKL (requires CUDA, CuDNN and mkl-dnn to be installed).

Unlike tensorflow-gpu from pip, this will work with the non-recommended versions of CUDA and CuDNN (tested with CUDA 9.0 and CuDNN 7.0.5). This script is NOT completely unattened, one or two minutes in you will be presented with the Tensorflow interactive configuration.

## compile_xgboost.sh
Downloads, compiles and installs the bleeding edge XGBoost for Python, with **CUDA and AVX support**.

## install_cuda.sh
Downloads and installs CUDA 9.0 (requires NVIDIA drivers to be installed), and adds it to path. After installation, it also locks the CUDA packages to prevent it from auto-updating and breaking your kernel (as nvidia updates tend to do).

## install_cudnn.sh
Installs CuDNN **from a downloaded cudnn.tgz** file into your local CUDA installation. I can't download CuDNN in the script because it's locked behind a download wall - instead the location of the downloaded file is in line 1 of the script.

## install_spotify.sh
Downloads and installs Spotify.

## install_discord.sh
Downloads and installs Discord.

## bitcoin_dependencies.sh
Installs dependencies required to compile Bitcoin Core or most other cryptocurrency full node clients from source.

## python_essentials.sh
Installs various packages which I commonly use with Python (Anaconda). Also installs MKL and updates all packages using conda.

## apt_essentials.sh
Installs various linux "essentials" such as git and compilers.
