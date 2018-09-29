FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget bzip2 ssh sudo vim git gcc unzip zsh tzdata -y
RUN apt-get install --reinstall build-essential -y
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -bfp /usr/miniconda3

ENV PATH /usr/miniconda3/bin:$PATH

RUN wget http://ospm9rsnd.bkt.clouddn.com/model/ltp_data_v3.4.0.zip
RUN unzip ltp_data_v3.4.0.zip
RUN rm ltp_data_v3.4.0.zip
RUN rm Miniconda3-latest-Linux-x86_64.sh
RUN conda update conda -y
RUN conda install python==3.6.6
RUN pip install cython numpy scipy matplotlib scikit-image pandas sklearn tensorflow-gpu tqdm pyltp

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s /bin/zsh
RUN find ~/.zshrc | xargs -i sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="dieter"/g' {}
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source /zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

RUN ln -snf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo Asia/Taipei > /etc/timezon

RUN apt-get purge wget bzip2 unzip -y
RUN rm -rf /var/lib/apt/lists/*

CMD ["zsh"] 
