pip install tqdm xgboost pathos ml_metrics &&
yes | conda install -c menpo opencv &&
yes | conda install mkl &&
yes | conda update --all &&

echo "Done! :)"
