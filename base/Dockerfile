ARG SAGE_IMAGE
FROM sagemath/${SAGE_IMAGE}

ARG BUILD_DEVELOPMENT
EXPOSE 8888

USER root

# Install Node.js (for installing/configuring jupyterlab plugins)
RUN apt-get -y update && \
    apt-get -y install curl git && \
    curl --silent --location https://deb.nodesource.com/setup_12.x | sudo bash - && \
    apt-get -y install nodejs && \
    if [ -z "$BUILD_DEVELOPMENT" ]; then apt-get -y install build-essential; fi

USER sage
WORKDIR /home/sage/sage

RUN if [ -n "$BUILD_DEVELOPMENT" ]; then make build; fi && \
    sage -pip install jupyterlab && \
    sage -sh -c "jupyter notebook --generate-config"

WORKDIR /home/sage

# Make Notebooks directory
RUN mkdir Notebooks

ENTRYPOINT sage -n jupyterlab --no-browser --ip=$(grep `hostname` /etc/hosts | cut -f1) --port=8888 --notebook-dir=Notebooks
