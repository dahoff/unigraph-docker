FROM unigraph-base

WORKDIR /opt/unigraph

COPY ./start_backend.sh /opt/unigraph/scripts/

EXPOSE 3001

CMD [ "/bin/bash", "-i", "/opt/unigraph/scripts/start_backend.sh" ]

