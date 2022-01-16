FROM node:15.14

WORKDIR /opt/unigraph

COPY ./unigraph-dev .

RUN yarn && \
yarn build-deps

