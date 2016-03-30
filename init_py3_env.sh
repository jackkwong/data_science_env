conda create -y -n py3 -c https://conda.anaconda.org/meloncholy -c https://conda.anaconda.org/r python=3 anaconda notebook ipykernel seaborn pyquery beautifulsoup4 numexpr requests scikit-learn statsmodels Pillow simplejson gensim rpy2
source activate py3
pip install findspark secret
python -m ipykernel install --user --name py3 --display-name "Python 3 (with libraries for CS109)"
