FROM node:16

WORKDIR /opt/unigraph

COPY ./unigraph-dev .

RUN yarn && \
yarn build-deps

