FROM nvcr.io/nvidia/cuda:12.1.0-devel-ubuntu22.04

RUN apt-get update && apt-get -y install python3.10 python3-pip openmpi-bin libopenmpi-dev git git-lfs

RUN pip3 install tensorrt_llm -U --pre --extra-index-url https://pypi.nvidia.com

RUN git clone https://github.com/NVIDIA/TensorRT-LLM.git

WORKDIR TensorRT-LLM

RUN pip install -r examples/bloom/requirements.txt

RUN git lfs install
