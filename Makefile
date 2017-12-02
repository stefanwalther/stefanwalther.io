help:								## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

docs-gen:						## Generate the static pages (using hugo).
	hugo
.PHONY: docs-gen

docs-serve:					## Serve the docs
	hugo server -D
.PHONY: docs-serve

docs-publish:				## Publish the docs to GitHub
	./publish.sh
.PHONY: docs-publish
