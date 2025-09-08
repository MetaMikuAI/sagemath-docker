FROM sagemath/sagemath:10.7 

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt install -y \
    build-essential \
    cmake \
    m4 \
    autoconf \
    automake \
    libtool \
    libblas-dev \
    liblapack-dev \
    libeigen3-dev \
    libfplll-dev \
    openssl \
    git \
    wget \
    vim

COPY ./sources/flint-3.3.1.tar.gz /home/sage/
RUN cd /home/sage/ && \
    tar -xvzf flint-3.3.1.tar.gz && \
    rm flint-3.3.1.tar.gz && \
    cd flint-3.3.1/ && \
    ./bootstrap.sh && \
    ./configure && \
    make -j$(nproc) && \
    make check && \
    make install && \
    ldconfig && \
    cd /home/sage/ && \
    rm -rf flint-3.3.1/

COPY ./sources/msolve-0.9.0.tar.gz /home/sage/
RUN cd /home/sage/ && \
    tar -xvzf msolve-0.9.0.tar.gz && \
    rm msolve-0.9.0.tar.gz && \
    cd msolve-0.9.0/ && \
    ./autogen.sh && \
    ./configure && \
    make -j$(nproc) && \
    make install && \
    ldconfig && \
    make check && \
    cd /home/sage/ && \
    rm -rf msolve-0.9.0/

COPY ./sources/flatter-d2b8026.tar.gz /home/sage/
RUN cd /home/sage/ && \
    tar -xvzf flatter-d2b8026.tar.gz && \
    rm flatter-d2b8026.tar.gz && \
    cd flatter/ && \
    mkdir build && cd build/ && \
    cmake .. && \
    make && \
    make install && \
    ldconfig && \
    cd /home/sage/ && \
    rm -rf flatter/

USER sage
RUN sage -pip install pwntools pycryptodome libnum tqdm numpy sympy matplotlib z3-solver gmssl pyasn1 pyasn1_modules 

COPY ./sources/lattice-based-cryptanalysis-v0.1.0.tar.gz /home/sage/
RUN cd /home/sage/ && \
    tar -xvzf lattice-based-cryptanalysis-v0.1.0.tar.gz && \
    rm lattice-based-cryptanalysis-v0.1.0.tar.gz
ENV PYTHONPATH="/home/sage/lattice-based-cryptanalysis-0.1.0:$PYTHONPATH"

COPY ./README.md /home/sage/

CMD ["sage", "--notebook", "jupyter", "--ip=0.0.0.0"]
