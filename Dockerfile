FROM rapidsai/rapidsai-dev-nightly:22.10-cuda11.5-devel-ubuntu20.04-py3.9
SHELL ["/bin/bash", "--login", "-c"]
RUN conda init bash
RUN echo "conda activate rapids" > ~/.bashrc
RUN pip install torch==1.11.0 torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu115
RUN pip install torch-scatter torch-sparse torch-cluster torch-spline-conv -f https://data.pyg.org/whl/torch-1.11.0+cu115.html
RUN git clone https://github.com/pyg-team/pytorch_geometric
WORKDIR pytorch_geometric
RUN pip install .
WORKDIR /

