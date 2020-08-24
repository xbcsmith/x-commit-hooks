# x-commit-hooks

x commit hooks

## prereq

installed

- python 3.7+
- go 1.14+
- nodejs 12.+

python

```bash
pip install --user pre-commit
pip install --user yamllint
pip install --user black flake8 isort
```

go

```bash
go get -u -v golang.org/x/tools/...
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/fzipp/gocyclo
go get -u -v github.com/uudashr/gocognit/cmd/gocognit
go get -u -v github.com/go-critic/go-critic/cmd/gocritic
go get -u -v github.com/golangci/golangci-lint/cmd/golangci-lint
```

npm

```bash
npm install markdownlint-cli
npm install commitlint
```

commitlint config

```bash
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js
```

shellcheck <https://github.com/koalaman/shellcheck>

hadolint <https://github.com/hadolint/hadolint>

## usage

generic

```bash
./scripts/x-generic-hooks.sh
```

go

```bash
./scripts/x-go-hooks.sh
```

python

```bash
./scripts/x-python-hooks.sh
```

## tools

- <https://github.com/pre-commit/pre-commit>
- <https://github.com/adrienverge/yamllint>
- <https://github.com/koalaman/shellcheck>
- <https://github.com/igorshubovych/markdownlint-cli>
- <https://github.com/fzipp/gocyclo>
- <https://github.com/golangci/golangci-lint>
- <https://github.com/go-lintpack/lintpack>
- <https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-cli>
- <https://github.com/conventional-changelog/commitlint>

## useful

- <https://github.com/xbcsmith/ymlfxr>
- <https://github.com/mvdan/sh>

## next

- <https://github.com/mdempsky/maligned>
- <https://github.com/matoous/godox>
- <https://github.com/uudashr/gocognit>
