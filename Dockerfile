FROM frolvlad/alpine-miniconda3

RUN apk update 
RUN apk upgrade
RUN apk add vim bash
RUN conda update conda -y
RUN conda update conda -y
RUN rm -rf /var/cache/apk/*

CMD ["bash"] 
