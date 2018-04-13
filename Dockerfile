FROM frolvlad/alpine-miniconda3

RUN apk update 
RUN apk upgrade
RUN apk add sudo vim openssh bash
RUN conda update conda -y
RUN conda update conda -y

CMD ["bash"] 