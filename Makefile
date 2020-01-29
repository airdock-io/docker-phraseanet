.PHONY: help

.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

launch:## Start docker-compose
	@echo "Starting compose"
	@docker-compose up -d

logs:## Display docker-compose logs
	@echo "Displaying docker-compose logs"
	@docker-compose logs -f

stop:## Stop Containers
	@echo "Stopping Containers"
	@docker-compose down

kill:## Kill containers and volumes
	@echo "Killing containers and volumes"
	@docker-compose down -v

phraseanet_build:## Build phraseanet container locally
	@echo "Building phraseanet container locally"
	@docker build --tag phraseanet:latest .

phraseanet_purge_db:## Build phraseanet container locally
	@echo "Purging DB"
	@rm -rf .data