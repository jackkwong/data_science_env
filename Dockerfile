FROM ubuntu:14.04 
MAINTAINER Jack Kwong

RUN apt-get update
RUN apt-get install -y curl git vim build-essential pkg-config
RUN curl http://repo.continuum.io/archive/Anaconda2-2.5.0-Linux-x86_64.sh -o Anaconda2-2.5.0-Linux-x86_64.sh
RUN chmod +x Anaconda2-2.5.0-Linux-x86_64.sh
RUN printf "\nyes\n" | ./Anaconda2-2.5.0-Linux-x86_64.sh
ENV PATH /root/anaconda2/bin:$PATH
ADD .bash_profile ~/.bash_profile

RUN conda create -y -n py2 -c https://conda.anaconda.org/cs109 python=2 anaconda notebook ipykernel seaborn pyquery beautifulsoup4
RUN /bin/bash -c 'source activate py2'
RUN /bin/bash -c 'python -m ipykernel install --user --name py2 --display-name "Python 2 (env py2)"'

RUN conda create -y -n py3 -c https://conda.anaconda.org/meloncholy python=3 anaconda notebook ipykernel seaborn pyquery beautifulsoup4
RUN /bin/bash -c 'source activate py3'
RUN /bin/bash -c 'python -m ipykernel install --user --name py3 --display-name "Python 3 (env py3)"'

# Add a notebook profile.
RUN mkdir -p -m 700 /root/.jupyter/ && \
    echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py

RUN mkdir /root/notebooks
CMD jupyter notebook -y --no-browser --notebook-dir="/root/notebooks" --port=8888

EXPOSE 8888
