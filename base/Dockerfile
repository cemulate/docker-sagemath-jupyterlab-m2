FROM sagemath/sagemath:8.3

MAINTAINER Chase Meadors <c.ed.mead@gmail.com>

ARG SAGE_BRANCH=master
EXPOSE 8888

USER root

# Install Node.js (for installing/configuring jupyterlab plugins)
RUN apt-get -y update && \
    apt-get -y install curl git && \
    curl --silent --location https://deb.nodesource.com/setup_9.x | sudo bash - && \
    apt-get -y install nodejs && \
    apt-get -y install build-essential

USER sage

# Install python modules in Sage's python
# Also do a pip upgrade on ipywidgets (extensions such as @jupyter-widgets/jupyterlab-manager require at least version 7)
RUN sage -pip install ipykernel && \
    sage -pip install jupyterlab && \
    sage -pip install --upgrade ipywidgets

# Set up a password for jupyterlab
ARG JUPYTERLAB_PASSWORD=jupyterlab
COPY setjupyterpassword.py /tmp
RUN sage -pip install pexpect && \
    sage -python /tmp/setjupyterpassword.py ${JUPYTERLAB_PASSWORD}

# Make Notebooks directory
RUN mkdir Notebooks

ENTRYPOINT sage -n jupyterlab --no-browser --ip=$(grep `hostname` /etc/hosts | cut -f1) --port=8888 --notebook-dir=Notebooks
