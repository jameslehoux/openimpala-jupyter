FROM python:3.7-slim

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook
    
#install conda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    wget

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version
RUN conda install -p /opt -c conda-forge jupyterhub-singleuser=1.3.0 

RUN pip3 install jupyter=1.3.0

RUN export PATH="/opt/bin:$PATH"

#launch jupyter notebooks
#CMD ["jupyterhub-singleuser", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
CMD ["jupyterhub-singleuser", "--port=8888", "--ip=0.0.0.0", "--debug"]
