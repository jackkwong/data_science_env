FROM continuumio/anaconda:2.5.0
MAINTAINER Jack Kwong

RUN apt-get update
RUN apt-get install -y curl git vim build-essential pkg-config libsm6 libxrender1 libfontconfig1

ADD init_py2_env.sh init_py2_env.sh
RUN chmod +x init_py2_env.sh
RUN /bin/bash -c '/init_py2_env.sh && rm init_py2_env.sh'

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

CMD /bin/bash -c "jupyter notebook --NotebookApp.ip='*' --MultiKernelManager.default_kernel_name='py2' -y --no-browser --notebook-dir='/root/notebooks' --port=8888"

EXPOSE 8888
