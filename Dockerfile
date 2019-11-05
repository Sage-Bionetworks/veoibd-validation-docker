FROM ubuntu:18.04
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
       python3 \
       python3-setuptools \
       python3-pip \
       python3-dev \ 
       wget \
       curl \
       git \
       build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

COPY requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt

COPY validate.sh /validate.sh
RUN chmod +x /validate.sh

COPY input_to_database.sh /input_to_database.sh
RUN chmod +x /input_to_database.sh

COPY config.json /config.json
