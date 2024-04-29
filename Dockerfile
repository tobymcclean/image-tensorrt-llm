FROM nvcr.io/nvidia/cuda:12.1.0-devel-ubuntu22.04

ARG TENSORRT_LLM_VERSION=0.9.0

RUN apt-get update && \
    apt-get -y install \
      git \
      git-lfs \
      libopenmpi-dev \
      openmpi-bin \
      python3.10 \
      python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install tensorrt_llm==$TENSORRT_LLM_VERSION -U --extra-index-url https://pypi.nvidia.com --no-cache-dir

RUN git clone -b v$TENSORRT_LLM_VERSION https://github.com/NVIDIA/TensorRT-LLM.git

WORKDIR TensorRT-LLM

RUN pip install -r examples/bloom/requirements.txt && git lfs install
