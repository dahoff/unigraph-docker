#FROM ubuntu
FROM ubuntu

WORKDIR /opt/unigraph

COPY ./unigraph-dev .

RUN apt update && \
apt install -y curl && \
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && \
export NVM_DIR="$HOME/.nvm" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
nvm install 15.14.0 && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt install -y npm && \
npm install --global yarn && \
yarn && \
yarn build-deps

