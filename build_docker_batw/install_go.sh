#!/bin/bash

# if BASOCKS5 is set, set up proxy
if [[ -n "$BASOCKS5" ]]; then
  export ALL_PROXY=$BASOCKS5
fi

# Function to determine the latest Go version
get_latest_go_version() {
    local go_latest_url="https://go.dev/VERSION?m=text"
    local latest_version=$(curl -s $go_latest_url | head -n 1)
    echo "$latest_version"
}

# Function to download and extract Go for Unix-like systems
install_go_unix() {
    local go_version=$(get_latest_go_version)
    local go_tar_file="${go_version}.${os}-${arch}.tar.gz"
    local go_url="https://go.dev/dl/$go_tar_file"

    echo "Downloading $go_url..."
    curl -LO $go_url

    if [ $? -ne 0 ]; then
        echo "Download failed! Exiting."
        exit 1
    fi

    echo "Extracting $go_tar_file to /usr/local"
    sudo tar -C /usr/local -xvzf $go_tar_file || exit 1

    echo "Setting up Go environment variables"
    export PATH=$PATH:/usr/local/go/bin
    echo "" >> $HOME/.bash_profile
    echo "# Adding GO's path to PATH" >> $HOME/.bash_profile
    echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bash_profile

    echo "Go installation complete."
    go version || exit 1
    echo "Deleting downloaded file: $go_tar_file"
    rm $go_tar_file
}

# Detect the operating system and architecture
os="$(uname -s)"
arch="$(uname -m)"

case "$os" in
    Linux) os="linux" ;;
    Darwin) os="darwin" ;;
    *) os="unknown" ;;
esac

case "$arch" in
    x86_64) arch="amd64" ;;
    aarch64) arch="arm64" ;;
    *) arch="unknown" ;;
esac

# Check if the OS or architecture is unknown
if [ "$os" = "unknown" ] || [ "$arch" = "unknown" ]; then
    echo "Unsupported OS or architecture."
    exit 1
fi

# Install Go based on the OS
case "$os" in
    linux|darwin) install_go_unix ;;
    *) echo "Unsupported OS for this script." ;;
esac
