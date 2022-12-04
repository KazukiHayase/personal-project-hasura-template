.PHONY: setup-hasura-cli
setup-hasura-cli:
	curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
	hasura update-cli --version v2.15.2

.PHONY: apply
apply:
	make migrate
	make metadata

.PHONY: metadata
metadata:
	hasura metadata apply --skip-update-check

.PHONY: migrate
migrate:
	hasura migrate apply --database-name cockroachdb --skip-update-check
