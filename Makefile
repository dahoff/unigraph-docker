VERSION=latest

IMAGE_NAME=$app

.PHONY: dgraph
dgraph:
	@echo "+ $@"
	@docker build -t unigraph-dgraph:${VERSION} ./dgraph -f ./dgraph/contrib/Dockerfile
	@echo 'Done.'

.PHONY: base
base:
	@echo "+ $@"
	@docker build -t unigraph-base:${VERSION} .
	@echo 'Done.'

.PHONY: backend
backend: base
	@echo "+ $@"
	@docker build -t unigraph-be:${VERSION} ./unigraph-be
	@echo 'Done.'

.PHONY: explorer
explorer: base
	@echo "+ $@"
	@docker build -t unigraph-fe:${VERSION} ./unigraph-fe
	@echo 'Done.'

.PHONY: all
all: dgraph backend explorer
