FROM unigraph-dgraph

WORKDIR /opt/unigraph

COPY ./unigraph-dev .

RUN apt update
RUN apt install -y curl
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
nvm install 15.14.0 && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt install -y npm && \
npm install --global yarn && \
yarn && \
yarn build-deps
RUN cp /usr/local/bin/dgraph /opt/unigraph

EXPOSE 3000 
EXPOSE 3001

CMD ["/opt/unigraph/scripts/start_server.sh" ]

