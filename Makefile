.PHONY: install
install:
    pip install -r requirements.txt
    pip install ruff

.PHONY: format
format:
    ruff format .

.PHONY: lint
lint: install
    ruff check .

.PHONY: lint-fix
lint-fix:
    ruff check . --fix

.PHONY: docs
docs:
    sphinx-apidoc -f -o ./docs ./cdp_agentkit_core

.PHONY: local-docs
local-docs: docs
    cd docs && make html && open ./_build/html/index.html

.PHONY: test
test:
    pytest

.PHONY: merge-dependabot-branch
merge-dependabot-branch:
    git checkout dependabot/npm_and_yarn/server/npm_and_yarn-6b7e5c81f3
    git merge main
    git push -u origin dependabot/npm_and_yarn/server/npm_and_yarn-6b7e5c81f3
