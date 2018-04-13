FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget bzip2 ssh sudo vim -y
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -bfp /usr/miniconda3

ENV PATH /usr/miniconda3/bin:$PATH

RUN apt-get purge wget bzip2 -y
RUN rm Miniconda3-latest-Linux-x86_64.sh
RUN conda update conda -y
RUN conda update conda -y

CMD ["bash"] 
