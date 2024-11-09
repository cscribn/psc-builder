# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set arguments for building

# Set environment variables for running

# Update and install prerequisites
# See https://docs.libretro.com/development/retroarch/compilation/ubuntu/
RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:libretro/stable && \
    apt install -y \
        git \
        build-essential \
        patchelf && \
    apt autoremove -y && \
    apt clean

# Clone the PSC-CrossCompile-Toolchain repository
RUN git clone https://github.com/autobleem/PSC-CrossCompile-Toolchain /PSC-CrossCompile-Toolchain

# Clone the RetroArch repository
RUN git clone https://github.com/libretro/RetroArch.git /retroarch

# Fetch v1.10.3
# See https://github.com/libretro/RetroArch/commit/9b282aa742b6c3d2f2925ae5a12e2cd7c6b6ad38
RUN cd /retroarch && \
    git checkout 9b282aa

# Build dependencies for RetroArch
RUN cd / && \
    cp /etc/apt/sources.list /etc/apt/sources.list~ && \
    sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && \
    apt update && \
    apt build-dep -y retroarch

# Copy Makefile.psclassic into the container
COPY Makefile.psclassic /retroarch/Makefile.psclassic

# Copy the script into the container
COPY build-psc.sh /build-psc.sh

# Make sure the script has executable permissions
RUN chmod +x /build-psc.sh

# Set the entrypoint to the script
ENTRYPOINT ["/build-psc.sh"]
