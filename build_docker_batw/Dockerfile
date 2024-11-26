FROM ubuntu:noble

# changing default user and set default password (123)
RUN groupadd -r imafish && useradd imafish -m --no-log-init -g sudo
RUN echo "imafish:123" | chpasswd

# install packages
RUN apt-get update && \
    apt-get install -y --install-recommends build-essential iputils-ping curl net-tools fortune \
               git vim byobu clang-format cmake sudo nodejs npm python3-full python3-pip && \
    rm -rf /var/lib/apt/lists/*

# disable password requirement with using sudo
RUN echo "imafish ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers

USER imafish
WORKDIR /home/imafish
COPY home/.vimrc .vimrc
# install VIM plugins
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && vim +PlugInstall +qall

COPY home/\\.* .
COPY home/bin bin
RUN rm -rf tmp
COPY sfiles.tar.gz sfiles.tar.gz
RUN tar xzvf sfiles.tar.gz
RUN rm sfiles.tar.gz

RUN sudo chown -R imafish:imafish /home/imafish
RUN chmod 600 /home/imafish/.ssh/id_rsa

ARG PROXY=
ENV ALL_PROXY=$PROXY

# install go
WORKDIR /home/imafish/tmp
COPY install_go.sh .
RUN /bin/bash install_go.sh
RUN rm install_go.sh
RUN /usr/local/go/bin/go env -w GOPROXY="https://goproxy.cn,direct"

# install bazelisk
RUN /usr/local/go/bin/go install github.com/bazelbuild/bazelisk@latest

WORKDIR /home/imafish
ENV ALL_PROXY=
