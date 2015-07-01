FROM python:2.7-onbuild

RUN apt-get update && apt-get install -y \
    binutils \
    libproj-dev \
    gdal-bin \
    libgdal1-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
