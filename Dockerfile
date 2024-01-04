FROM python:3.11.7

ARG DEBIAN_FRONTEND="noninteractive"

USER root

WORKDIR /home/xuser

RUN set -e \
    && useradd -r -g users -u 999 -m -d /home/xuser -s /bin/bash xuser \
    && chown 999:100 /home/xuser

ENV GOVERSION=1.21.5
ENV GOARCH=amd64
ENV GOOS=linux
ENV GO_CHECKSUM=e2bc0b3e4b64111ec117295c088bde5f00eeed1567999ff77bc859d7df70078e

RUN set -e \
    && curl -kLO https://dl.google.com/go/go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz \
    && echo "${GO_CHECKSUM} go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz" | sha256sum --check \
    && tar -C /usr/local/ -xvzf go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz \
    && PATH=/usr/local/go/bin:$PATH go version \
    && rm -v go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz

ENV GOLANGCI_LINT_VERSION="1.55.0"

RUN set -e \
    && curl -sSfL https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCI_LINT_VERSION}/golangci-lint-${GOLANGCI_LINT_VERSION}-linux-amd64.tar.gz -o golangci-lint-${GOLANGCI_LINT_VERSION}-linux-amd64.tar.gz \
    && curl -sSfL https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCI_LINT_VERSION}/golangci-lint-${GOLANGCI_LINT_VERSION}-checksums.txt | grep linux-amd64.tar.gz | sha256sum --check \
    && tar -C /usr/local/bin -xzvf golangci-lint-${GOLANGCI_LINT_VERSION}-linux-amd64.tar.gz golangci-lint-${GOLANGCI_LINT_VERSION}-linux-amd64/golangci-lint --strip-components 1 \
    && rm -vf golangci-lint-${GOLANGCI_LINT_VERSION}-linux-amd64.tar.gz

RUN set -e \
    && apt-get update -y \
    && apt-get install -y \
        git \
        gnupg \
        apt-utils \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        nodejs \
        npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/?? \
        /usr/share/man/??_*

RUN set -e \
    && npm install -g --save --save-exact remark-cli \
        remark-preset-lint-recommended \
        markdownlint-cli \
        prettier \
        @commitlint/cli @commitlint/config-conventional \
    && echo "export PATH=\$PATH:\$HOME/node_modules/.bin" >> /home/xuser/.bashrc \
    && echo "module.exports = {extends: ['@commitlint/config-conventional']}" > /home/xuser/commitlint.config.js \
    && pip3 install --upgrade \
        pre-commit \
        yamllint \
        black \
        isort \
        flake8 \
        tox \
        pip \
        wheel \
        pbr \
        coverage \
        setuptools \
        pytest \
        twine

COPY scripts/x-*-hooks.sh /usr/local/bin/
COPY x-hook-*.sh /usr/local/bin/

WORKDIR /pre-commit

ENV XDG_CACHE=/tmp/.cache
ENV PRE_COMMIT_HOME=/pre-commit/.cache/pre-commit

COPY pre-commit-config-all.yaml .pre-commit-config.yaml

RUN set -e \
    && chmod +x /usr/local/bin/x-hook-*.sh /usr/local/bin/x-*-hooks.sh \
    && git init \
    && git add --all :/ \
    && pre-commit install-hooks \
    && pre-commit autoupdate
