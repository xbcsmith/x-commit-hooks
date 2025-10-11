#!/usr/bin/env bash

# Rust pre-commit hook
# Runs cargo check, clippy, fmt, and test

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[RUST]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[RUST]${NC} $1"
}

print_error() {
    echo -e "${RED}[RUST]${NC} $1"
}

# Check if this is a Rust project
if [[ ! -f "Cargo.toml" ]]; then
    print_warning "No Cargo.toml found, skipping Rust checks"
    exit 0
fi

print_status "Running Rust pre-commit checks..."

# Check if cargo is available
if ! command -v cargo &> /dev/null; then
    print_error "cargo command not found. Please install Rust toolchain."
    exit 1
fi

# 1. Run cargo check
print_status "Running cargo check..."
if ! cargo check --all-targets --all-features; then
    print_error "cargo check failed"
    exit 1
fi

# 2. Run cargo clippy (if available)
print_status "Running cargo clippy..."
if cargo clippy --version &> /dev/null; then
    if ! cargo clippy --all-targets --all-features -- -D warnings; then
        print_error "cargo clippy found issues"
        exit 1
    fi
else
    print_warning "clippy not available, skipping"
fi

# 3. Run cargo fmt check (if available)
print_status "Running cargo fmt check..."
if cargo fmt --version &> /dev/null; then
    if ! cargo fmt --all -- --check; then
        print_error "Code is not properly formatted. Run 'cargo fmt' to fix."
        exit 1
    fi
else
    print_warning "rustfmt not available, skipping format check"
fi

# 4. Run tests
print_status "Running cargo test..."
if ! cargo test --all-features; then
    print_error "Tests failed"
    exit 1
fi

# 5. Check for security vulnerabilities (if cargo-audit is available)
if cargo audit --version &> /dev/null; then
    print_status "Running cargo audit..."
    if ! cargo audit; then
        print_warning "Security vulnerabilities found. Consider updating dependencies."
        # Don't fail the commit for audit issues, just warn
    fi
else
    print_warning "cargo-audit not available, skipping security check"
fi

print_status "All Rust checks passed! ✓"
