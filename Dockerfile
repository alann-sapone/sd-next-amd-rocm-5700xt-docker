FROM ubuntu:18.04

RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt update
RUN apt install python3.10 -y
#RUN apt install python3.10-venv -y
RUN apt install wget -y
RUN apt install git -y

RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.10 /usr/bin/python3

#RUN apt install --install-recommends linux-generic-hwe-20.04 -y
#RUN apt install linux-image-5.4.0-54-generic linux-headers-5.4.0-54-generic linux-modules-extra-5.4.0-54-generic -y

WORKDIR /sdnext


RUN wget https://repo.radeon.com/amdgpu-install/22.20.5/ubuntu/bionic/amdgpu-install_22.20.50205-1_all.deb
RUN apt install ./amdgpu-install_22.20.50205-1_all.deb -y

#RUN apt install equivs -y
#RUN equivs-control amdgpu-driver-fixes
#RUN printf "Package: amdgpu-driver-fixes \nProvides: python,libstdc++-7-dev,libgcc-7-dev \nArchitecture: all \nDescription: Fixes the AMD GPU driver installation on Ubuntu 22.04" > amdgpu-driver-fixes
#RUN equivs-build amdgpu-driver-fixes
#RUN apt install ./amdgpu-driver-fixes_1.0_all.deb -y

#RUN amdgpu-install --usecase=rocm -y


RUN git config --global --add safe.directory '*'
EXPOSE 7860

ENTRYPOINT ["tail", "-f", "/dev/null"]