FROM cemulate/sagemath-jupyterlab:r2

USER root

# Install Maculay2
RUN echo 'deb http://www.math.uiuc.edu/Macaulay2/Repositories/Ubuntu xenial main' >/etc/apt/sources.list.d/macaulay2.list && \
    apt-key adv --keyserver hkp://keys.gnupg.net --recv-key CD9C0E09B0C780943A1AD85553F8BD99F40DCB31 && \
    apt-get -y update && \
    apt-get -y install macaulay2

USER sage

# Install Macaulay2 kernel
COPY kernel.json /tmp
RUN git clone https://github.com/cemulate/macaulay2-kernel /tmp/macaulay2-kernel && \
    mkdir -p ~/sage/local/share/jupyter/kernels/m2kernel && \
    cp /tmp/macaulay2-kernel/m2kernel/m2kernel.py ~/sage/local/share/jupyter/kernels/m2kernel/m2kernel.py && \
    cp /tmp/kernel.json ~/sage/local/share/jupyter/kernels/m2kernel/kernel.json
