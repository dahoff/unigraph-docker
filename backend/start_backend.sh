#!/bin/bash

usage()
{
    echo "Usage: $0 [-h <dgraph hostname>] [-p <dgraph portNum>]"
    exit 1
}

while getopts "h:p:" opt; do
    case "${opt}" in
        h) h=$OPTARG ;;
        p) p=$OPTARG ;;
        *) usage ;; 
    esac
done

cd /opt/unigraph

# Setup the endpoint for dgraph
if [ -n "$h" ]; then
    sed -i s/localhost/$h/ packages/unigraph-dev-backend/src/index.ts
fi

if [ -n "$p" ]; then
    sed -i s/9080/$p/ packages/unigraph-dev-backend/src/index.ts
fi

# Copy secrets
if [ -f /config/secrets.env.json ]; then
    cp /config/secrets.env.json .
fi

# Start server
yarn backend-start
