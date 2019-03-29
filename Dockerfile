FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget bzip2 vim git gcc unzip zsh tzdata -y
RUN apt-get install --reinstall build-essential -y
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -bfp /usr/miniconda3

ENV PATH /usr/miniconda3/bin:$PATH

RUN rm Miniconda3-latest-Linux-x86_64.sh
RUN conda update conda -y
RUN conda install python==3.6.6
RUN pip install https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl
RUN pip install cython numpy scipy matplotlib scikit-image pandas sklearn tensorflow-gpu tqdm pyltp thefuck torchvision

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s /bin/zsh
RUN find ~/.zshrc | xargs -i sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="dieter"/g' {}
RUN echo "eval \$(thefuck --alias)" >> ~/.zshrc
RUN echo "eval \$(thefuck --alias FUCK)" >> ~/.zshrc
# RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# RUN sed -i "66a \ \ zsh-autosuggestions" ~/.zshrc
RUN sed -i "72a export TERM=\"xterm-256color\"" ~/.zshrc
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source /zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

RUN ln -snf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo Asia/Taipei > /etc/timezon

RUN rm -rf /var/lib/apt/lists/*

CMD ["zsh"] 
