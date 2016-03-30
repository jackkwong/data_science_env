FROM ubuntu:14.04 
MAINTAINER Jack Kwong

RUN apt-get update
RUN apt-get install -y curl git vim build-essential pkg-config libsm6 libxrender1 libfontconfig1 silversearcher-ag
RUN curl http://repo.continuum.io/archive/Anaconda2-2.5.0-Linux-x86_64.sh -o Anaconda2-2.5.0-Linux-x86_64.sh
RUN chmod +x Anaconda2-2.5.0-Linux-x86_64.sh
RUN printf "\nyes\n" | ./Anaconda2-2.5.0-Linux-x86_64.sh
RUN rm Anaconda2-2.5.0-Linux-x86_64.sh
ENV PATH /root/anaconda2/bin:$PATH
ADD .bash_profile ~/.bash_profile

RUN conda create -y -n py2 -c https://conda.anaconda.org/cs109 python=2 anaconda notebook ipykernel seaborn pyquery beautifulsoup4 numexpr
RUN /bin/bash -c 'source activate py2 && python -m ipykernel install --user --name py2 --display-name "Python 2 (with libraries for CS109)"'

RUN conda create -y -n py3 -c https://conda.anaconda.org/meloncholy python=3 anaconda notebook ipykernel seaborn pyquery beautifulsoup4 numexpr
RUN /bin/bash -c 'source activate py3 && python -m ipykernel install --user --name py3 --display-name "Python 3 (with libraries for CS109)"'

RUN mkdir -p /root/notebooks/course
WORKDIR /root/notebooks/course
RUN git clone https://github.com/cs109/2015lab1
RUN git clone https://github.com/cs109/2015lab2
RUN git clone https://github.com/cs109/2015lab3
RUN git clone https://github.com/cs109/2015lab4
RUN git clone https://github.com/cs109/2015lab5
RUN git clone https://github.com/cs109/2015lab6
RUN git clone https://github.com/cs109/2015lab7
RUN git clone https://github.com/cs109/2015lab8
RUN git clone https://github.com/cs109/2015lab9
RUN git clone https://github.com/cs109/2015lab10
RUN git clone https://github.com/cs109/2015lab11
RUN git clone https://github.com/cs109/cs109_data
RUN git clone https://github.com/cs109/2015.git

# Add a notebook profile.
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

CMD /bin/bash -c "jupyter notebook -y --no-browser --notebook-dir='/root/notebooks' --port=8888"

EXPOSE 8888
