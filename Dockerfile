# --------------------------------------------------
# Dockerfile for Call of Duty 2 
# By FiSTWHO - Forgotten-Games.net
# --------------------------------------------------
FROM ubuntu:focal

LABEL maintainer="fistwho@forgotten-games.net"

ENV STARTUP="+set dedicated 2 +set fs_homepath config/ +exec dedicated.cfg"
ENV COD_GAME="main"
ENV COD_VERSION="1_3"
ENV LIBCOD="1_3"

# Add i386 architecture support
RUN dpkg --add-architecture i386

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    binutils \
    libstdc++5:i386 \
    libc6-i386 \
    lib32z1 \
    zlib1g:i386 \
    g++-multilib \
    libmysqlclient-dev:i386 \
    wget \
    tar \
    bzip2 \
    libsqlite3-dev:i386

# Copy some files
COPY config/* /opt/config/
COPY ./entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

RUN mkdir \
    /gameserver \
    /config

# Set the server dir
WORKDIR /gameserver

# Server gamefiles folder and config volume
VOLUME [ "/gameserver", "/config" ]

# Launch server at container startup
ENTRYPOINT ["/opt/entrypoint.sh"]
