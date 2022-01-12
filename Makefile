TAG=latest

.PHONY: all
all: dgraph backend explorer

.PHONY: dgraph
dgraph:
	@echo "+ $@"
	@docker build -t unigraph-dgraph:${TAG} ./dgraph -f ./dgraph/contrib/Dockerfile
	@echo 'Done.'

.PHONY: base
base:
	@echo "+ $@"
	@docker build -t unigraph-base:${TAG} .
	@echo 'Done.'

.PHONY: backend
backend: base
	@echo "+ $@"
	@docker build -t unigraph-backend:${TAG} ./backend
	@echo 'Done.'

.PHONY: explorer
explorer: base
	@echo "+ $@"
	@docker build -t unigraph-explorer:${TAG} ./explorer
	@echo 'Done.'

