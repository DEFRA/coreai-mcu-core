# Builder Stage
FROM eclipse-temurin:17-jre-jammy

ARG LIQUIBASE_VERSION=4.28.0
ARG LB_SHA256=97dd07eaca0406a09e1ae19b407eea42a7e944c7f4571922bffce71b43b75ce8

# Create setup user
RUN groupadd --gid 1001 setup && \
    useradd --uid 1001 --gid setup setup

# Create directory for Liquibase
RUN mkdir /liquibase && chown setup /liquibase

RUN mkdir /home/setup && chown setup /home/setup

# Install PostgreSQL client
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Download and install Liquibase
WORKDIR /liquibase

RUN wget -q -O liquibase-${LIQUIBASE_VERSION}.tar.gz "https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz" && \
    echo "$LB_SHA256 *liquibase-${LIQUIBASE_VERSION}.tar.gz" | sha256sum -c - && \
    tar -xzf liquibase-${LIQUIBASE_VERSION}.tar.gz && \
    rm liquibase-${LIQUIBASE_VERSION}.tar.gz && \
    ln -s /liquibase/liquibase /usr/local/bin/liquibase && \
    liquibase --version

# Set LIQUIBASE_HOME environment variable
ENV LIQUIBASE_HOME=/liquibase

# Set user and group
USER setup:setup

WORKDIR /

# Copy main script to the image
COPY run-setup.sh ./

ENTRYPOINT ["/run-setup.sh"]
