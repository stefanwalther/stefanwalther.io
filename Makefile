help:										## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

gen-readme:							## Generate README.md (using docker-verb)
	rm -rf ./README.md && docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb
.PHONY: gen-readme

publish:								## Publish the docs to GitHub
	# hugo
	# ./publish.sh
.PHONY: docs
