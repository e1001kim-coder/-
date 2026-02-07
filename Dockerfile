# Dockerfile for OpenCLAW

# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set the environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && \
    apt-get install -y \
    python3.9 \
    python3-pip \
    cmake \
    build-essential \
    git \
    && apt-get clean

# Install Clawpack/OpenCLAW
git clone https://github.com/clawpack/clawpack.git /opt/clawpack
RUN cd /opt/clawpack && \
    git checkout master && \
    pip3 install -r requirements.txt

# Set the working directory
WORKDIR /opt/clawpack

# Command to run OpenCLAW
CMD ["python3.9", "-m", "clawpack"]