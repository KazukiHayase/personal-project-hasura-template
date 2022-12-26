HASURA_CLI_VERSION := v2.16.1

.PHONY: setup-hasura-cli
setup-hasura-cli:
	curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
	hasura update-cli --version $(HASURA_CLI_VERSION)

.PHONY: deploy
deploy:
	hasura deploy --skip-update-check

.PHONY: console
console:
	hasura console --no-browser --skip-update-check
