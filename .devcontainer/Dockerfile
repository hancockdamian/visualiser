# Use an official Ubuntu base image
FROM ubuntu:22.04

# Install essential tools and OpenGL dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    libgl1-mesa-dev \
    libx11-dev \
    libxi-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libglfw3-dev \
    libglew-dev \
    sudo \
    git \
    pkg-config  # Add pkg-config here

# Create the sudoers directory if it doesn't exist
RUN mkdir -p /etc/sudoers.d

# Set up a non-root user for development
ARG USERNAME=damian
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Allow SSH agent forwarding
RUN apt-get install -y openssh-client

USER $USERNAME

# Set up the working directory
WORKDIR /workspaces/visualizer