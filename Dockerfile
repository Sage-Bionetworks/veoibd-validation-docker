FROM ubuntu:18.04
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
       python3 \
       python3-setuptools \
       python3-pip \
       python3-pandas \
       python3-dev \ 
       wget \
       build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

RUN wget https://github.com/veo-ibd/veoibd-data-pipeline/archive/master.tar.gz
RUN tar xvzf master.tar.gz
WORKDIR /veoibd-data-pipeline-master
RUN python3 setup.py install
