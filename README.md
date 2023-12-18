# x-commit-hooks

x commit hooks

pre-commit hooks for current projects.

**warning** some of these scripts are set to fix code.

## prereq

installed

- python 3.11+
- go 1.21+
- nodejs 16.+

python

```bash
pip install --user pre-commit
pip install --user yamllint
pip install --user black flake8 isort
```

go

```bash
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.55.2
```

npm

```bash
npm install markdownlint-cli
npm install @commitlint/cli @commitlint/config-conventional
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
- <https://github.com/golangci/golangci-lint>
- <https://github.com/go-lintpack/lintpack>
- <https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-cli>
- <https://github.com/conventional-changelog/commitlint>

## useful

- <https://github.com/xbcsmith/ymlfxr>
- <https://github.com/mvdan/sh>
