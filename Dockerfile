FROM python:3.7-slim
# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook

#install singularity dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup-bin
    
#install go and singularity
RUN export VERSION=1.11 OS=linux ARCH=amd64 && \
        wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
        tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && \
        rm go$VERSION.$OS-$ARCH.tar.gz \     
 && echo 'export GOPATH=${HOME}/go' >> ~/.bashrc && \
        echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.bashrc && \
        . ~/.bashrc \
 && go get -u github.com/golang/dep/cmd/dep \
 && export VERSION=3.4.0 && \
    mkdir -p $GOPATH/src/github.com/sylabs && \
    cd $GOPATH/src/github.com/sylabs && \
    wget https://github.com/sylabs/singularity/archive/refs/tags/v${VERSION}.tar.gz && \
    tar -xzf v${VERSION}.tar.gz && \
    cd ./singularity-3.4.0 && \
    ./mconfig -V ${VERSION} && \
    make -C ./builddir && \
    make -C ./builddir install


# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}

#install yt visualisation
RUN pip install --user 'yt==3.4.1'

