# Use an official Ubuntu base image
FROM ubuntu:22.04

# Install system dependencies and ensure 'sudo' can be installed
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    clang-format \
    git \
    sudo && \
    rm -rf /var/lib/apt/lists/*

# Set up a non-root user for development
ARG USERNAME=damian
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the non-root user
USER $USERNAME