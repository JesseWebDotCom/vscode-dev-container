FROM ubuntu:20.04

COPY build/ /tmp/.devcontainer/build/
COPY customize/ /tmp/.devcontainer/customize/

RUN bash /tmp/.devcontainer/build/setup_container.sh \
    && bash /tmp/.devcontainer/customize/setup_container.sh \
    && pip3 install -r /tmp/.devcontainer/customize/requirements.txt -c /tmp/.devcontainer/customize/constraints.txt \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/.devcontainer
