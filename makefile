PATH := $(PATH):$(HOME)/.local/bin:$(HOME)/bin:/bin:/usr/local/bin
SHELL := /usr/bin/env bash

.DEFAULT_GOAL := help

CLUSTER_ZONE=${CLUSTER_ZONE:-'europe-west1-b'}
export PROJECT=run-melody

help: ## Display this help
	@grep -E '^[a-zA-Z1-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

deploy-on-ic: ## Deploy on ic
	@source ./make.sh && app:deploy-on-ic
