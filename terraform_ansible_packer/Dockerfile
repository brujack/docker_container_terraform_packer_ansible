FROM ubuntu:focal

ARG TERRAFORM_VER="1.0.2"
ARG TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip"
ARG PACKER_VER="1.7.6"
ARG PACKER_URL="https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip"
ARG AWS_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
ARG ANSIBLE_VER="4.6.0"

LABEL maintainer="brujack"
LABEL terraform_version=${TERRAFORM_VER}
LABEL packer_version=${PACKER_VER}
LABEL ansible_version=${ANSIBLE_VER}

ENV DEBIAN_FRONTEND=noninteractive
ENV AWSCLI_VERSION=${AWSCLI_VER}
ENV TERRAFORM_VERSION=${TERRAFORM_VER}
ENV PACKER_VERSION=${PACKER_VER}
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-get update \
    && add-apt-repository ppa:git-core/ppa -y \
    && apt-get install -y apt-utils curl git jq make python3 python3-pip python3-boto tar unzip wget \
    && apt-get dist-upgrade -y \
    && mkdir downloads \
    && wget -O downloads/terraform_${TERRAFORM_VER}_linux_amd64.zip ${TERRAFORM_URL} \
    && wget -O downloads/packer_${PACKER_VER}_linux_amd64.zip ${PACKER_URL} \
    && unzip 'downloads/*.zip' -d /usr/local/bin \
    && wget -O downloads/awscliv2.zip ${AWS_URL} \
    && unzip 'downloads/awscliv2.zip' -d downloads \
    && downloads/aws/install --install-dir /usr/local/aws-cli --bin-dir /usr/local/bin \
    && rm -rf downloads \
    && python3 -m pip install ansible ansible-lint

RUN apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD    ["/bin/bash"]
