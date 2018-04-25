FROM sagemath/sagemath

MAINTAINER Chase Meadors <c.ed.mead@gmail.com>

ARG SAGE_BRANCH=master
EXPOSE 8888

USER root

# Install Node.js (for installing/configuring jupyterlab plugins)
RUN apt-get -y update && \
    apt-get -y install curl && \
    curl --silent --location https://deb.nodesource.com/setup_9.x | sudo bash - && \
    apt-get -y install nodejs && \
    apt-get -y install build-essential

# Install Maculay2
RUN echo 'deb http://www.math.uiuc.edu/Macaulay2/Repositories/Ubuntu xenial main' >/etc/apt/sources.list.d/macaulay2.list && \
    apt-key adv --keyserver hkp://keys.gnupg.net --recv-key CD9C0E09B0C780943A1AD85553F8BD99F40DCB31 && \
    apt-get -y update && \
    apt-get -y install macaulay2

USER sage

# Install python modules in Sage's python
# Also do a pip upgrade on ipywidgets (extensions such as @jupyter-widgets/jupyterlab-manager require at least version 7)
RUN sage -pip install ipykernel && \
    sage -pip install jupyterlab && \
    sage -pip install --upgrade ipywidgets

# Install Macaulay2 kernel
COPY kernel.json /tmp
RUN git clone https://github.com/cemulate/macaulay2-kernel /tmp/macaulay2-kernel && \
    mkdir -p /opt/sage/local/share/jupyter/kernels/m2kernel && \
    cp /tmp/macaulay2-kernel/m2kernel/m2kernel.py /opt/sage/local/share/jupyter/kernels/m2kernel/m2kernel.py && \
    cp /tmp/kernel.json /opt/sage/local/share/jupyter/kernels/m2kernel/kernel.json

# Set up a password for jupyterlab
ARG JUPYTERLAB_PASSWORD=jupyterlab
COPY setjupyterpassword.py /tmp
RUN sage -pip install pexpect && \
    sage -python /tmp/setjupyterpassword.py ${JUPYTERLAB_PASSWORD}

ENTRYPOINT sage -n jupyterlab --no-browser --ip=$(grep `hostname` /etc/hosts | cut -f1) --port=8888
