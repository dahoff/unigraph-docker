# unigraph-docker

Simplified build and orchestration of unigraph for testing, using docker/docker-compose.

## Quick start

1. Init submodules: `git submodule update --init`
2. Build: `make`
3. Run: `docker-compose up`

The following can be configured in docker-compose.yml:
- Data location for dgraph (default /opt/unigraph/data)
- Secrets location for unigraph (default /etc/unigraph)
