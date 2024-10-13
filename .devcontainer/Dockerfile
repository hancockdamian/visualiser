# Use the official Microsoft JavaScript/Node.js DevContainer image as the base
FROM mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm

# Set working directory inside the container
WORKDIR /workspaces/visualiser

# Install any additional tools or dependencies here (e.g., git, curl, etc.)
# Example:
# RUN apt-get update && apt-get install -y vim

# Ensure the container uses the latest version of npm globally
RUN npm install -g npm@latest

# Expose the port used by the Svelte development server (default: 5173)
EXPOSE 5173
