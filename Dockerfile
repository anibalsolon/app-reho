FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git build-essential ca-certificates curl tcsh rsync

RUN curl -O https://afni.nimh.nih.gov/pub/dist/bin/linux_openmp_64/@update.afni.binaries && \
    tcsh @update.afni.binaries -package linux_openmp_64 -bindir /opt/afni -prog_list 3dReHo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libxext-dev libxpm-dev libxmu-dev libxt6 libxft2 libgsl-dev

RUN ln -svf /usr/lib/x86_64-linux-gnu/libgsl.so.23 /usr/lib/x86_64-linux-gnu/libgsl.so.0

RUN curl -LO http://ftp.debian.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb && \
    curl -LO http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    apt-get install ./libxp6_1.0.2-2_amd64.deb ./libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    rm ./libxp6_1.0.2-2_amd64.deb ./libpng12-0_1.2.54-1ubuntu1_amd64.deb

# Run the command for validation
RUN /opt/afni/3dReHo

RUN mkdir /scratch
WORKDIR /scratch

