FROM ubuntu:20.04

COPY . /tmp/container_install/

RUN bash /tmp/container_install/container_install.sh \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/container_install/

