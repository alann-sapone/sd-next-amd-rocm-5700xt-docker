FROM ubuntu:22.04

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install python3.10 -y && \
    apt install python3.10-venv -y && \
    apt install wget -y && \
    apt install git -y

RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.10 /usr/bin/python3

RUN wget https://repo.radeon.com/amdgpu-install/5.7.3/ubuntu/jammy/amdgpu-install_5.7.50703-1_all.deb
RUN apt install ./amdgpu-install_5.7.50703-1_all.deb -y
RUN amdgpu-install --usecase=rocm -y

RUN git config --global --add safe.directory '*'

WORKDIR /sdnext

EXPOSE 7860

ENTRYPOINT ["tail", "-f", "/dev/null"]