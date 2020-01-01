FROM zboxfs/base

# install nodejs v10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# enable libsodium static linking
ENV SODIUM_LIB_DIR /opt/lib
ENV SODIUM_STATIC true
