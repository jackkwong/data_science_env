conda create -y -n py2 -c https://conda.anaconda.org/cs109 -c https://conda.anaconda.org/r python=2 anaconda notebook ipykernel seaborn pyquery beautifulsoup4 numexpr requests scikit-learn statsmodels Pillow simplejson gensim rpy2
source activate py2
pip install findspark secret
python -m ipykernel install --user --name py2 --display-name "Python 2 (with libraries for CS109)"
