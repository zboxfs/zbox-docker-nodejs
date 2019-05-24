FROM zboxfs/base

RUN apt-get update -y && apt-get install -y \
    g++

# install nodejs v10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# enable libsodium static linking
ENV SODIUM_LIB_DIR /opt/lib
ENV SODIUM_STATIC true

# set the environment flag to indicate we're building the npm package, not
# trying to use it
ENV BUILD_NPM_PACKAGE true

# pre-build dependencies
RUN mkdir /tmp/zbox
WORKDIR /tmp/zbox
ADD ./zbox-nodejs/lib ./lib
ADD ./zbox-nodejs/native ./native
COPY ./zbox-nodejs/package.json ./
RUN npm install neon-cli && \
    ./node_modules/.bin/neon build --release && \
    rm -rf /tmp/zbox

# set working dir
WORKDIR /root/zbox
