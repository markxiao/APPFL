FROM ubuntu:18.04

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common build-essential python-mpi4py \
    && add-apt-repository -y ppa:deadsnakes \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3.8-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN python3.8 -m venv /venv
ENV PATH=/venv/bin:$PATH

RUN pip install --no-cache-dir hydra-core --upgrade
RUN pip install --no-cache-dir matplotlib --upgrade
RUN pip install --no-cache-dir tensorboard --upgrade
RUN pip install --no-cache-dir jupyterlab
RUN pip install --no-cache-dir grpcio
RUN pip install --no-cache-dir torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html



