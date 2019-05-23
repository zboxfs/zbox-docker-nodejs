FROM zboxfs/base

RUN apt-get update -y && apt-get install -y \
    g++

# install nodejs v10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# enable libsodium static linking
ENV SODIUM_LIB_DIR /opt/lib
ENV SODIUM_STATIC true

# install neon
RUN npm install --global neon-cli

# pre-build dependencies
RUN mkdir /tmp/zbox
WORKDIR /tmp/zbox
ADD ./zbox-nodejs/lib ./lib
ADD ./zbox-nodejs/native ./native
COPY ./zbox-nodejs/package.json ./
RUN neon build --release && \
    rm -rf /tmp/zbox

# set working dir
WORKDIR /root/zbox
