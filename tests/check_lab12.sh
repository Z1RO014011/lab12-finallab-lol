#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

require_file() {
  if [ ! -f "$ROOT_DIR/$1" ]; then
    echo "Missing required file: $1" >&2
    exit 1
  fi
}

require_dir() {
  if [ ! -d "$ROOT_DIR/$1" ]; then
    echo "Missing required directory: $1" >&2
    exit 1
  fi
}

require_contains() {
  file=$1
  pattern=$2

  if ! grep -q -- "$pattern" "$ROOT_DIR/$file"; then
    echo "Expected pattern '$pattern' in $file" >&2
    exit 1
  fi
}

require_not_contains() {
  file=$1
  pattern=$2

  if grep -q -- "$pattern" "$ROOT_DIR/$file"; then
    echo "Unexpected pattern '$pattern' in $file" >&2
    exit 1
  fi
}

require_dir ".github/workflows"
require_dir "site"
require_dir "site/assets"

require_file ".gitignore"
require_file "README.md"
require_file "docker-compose.yml"
require_file ".github/workflows/ci.yml"
require_file "site/index.html"
require_file "site/styles.css"
require_file "site/main.js"
require_file "site/Dockerfile"
require_file "site/nginx.conf"
require_file "site/assets/daniel-zhang.jpg"
require_file "site/assets/liang-rutao.jpg"

require_contains "README.md" "Student ID"
require_contains "README.md" "http://localhost:8080"
require_contains "README.md" "http://localhost:3456"
require_contains "README.md" "photo"
require_contains "README.md" "LOL"
require_contains "README.md" "张函睿"
require_contains "README.md" "梁汝涛"
require_contains "README.md" "Albert"
require_contains "README.md" "20242225"
require_contains "README.md" "Team Overview"
require_contains "README.md" "single Docker Compose workflow"
require_contains "README.md" "Submission Package"

require_contains "docker-compose.yml" "portfolio"
require_contains "docker-compose.yml" "vikunja"
require_contains "docker-compose.yml" "postgres"
require_not_contains "docker-compose.yml" "/var/lib/postgresql/data"

require_contains "site/index.html" "20232098"
require_contains "site/index.html" "LOL"
require_contains "site/index.html" "Daniel"
require_contains "site/index.html" "Albert"
require_contains "site/index.html" "daniel-zhang.jpg"
require_contains "site/index.html" "liang-rutao.jpg"
require_contains "site/index.html" "Vikunja"
require_contains "site/index.html" "Apple-inspired cinematic homepage"
require_contains "site/index.html" "Two members. Two apps. One deployment flow."
require_contains "site/index.html" "data-section=\"hero\""
require_contains "site/index.html" "data-section=\"team-showcase\""
require_contains "site/index.html" "Zhang Hanrui"
require_contains "site/index.html" "Liang Rutao"
require_contains "site/index.html" "http://localhost:8080"
require_contains "site/index.html" "http://localhost:3456"
require_contains "site/index.html" "main.js"
require_not_contains "site/index.html" "photo-stack"
require_not_contains "site/index.html" "Team photos"
require_not_contains "site/index.html" "member-card"
require_not_contains "site/index.html" "Basic Development and Operation · Lab 12"
require_contains "site/index.html" "static team profile site"
require_contains "site/index.html" "Docker Compose"
require_contains "site/index.html" "same machine"

require_contains "site/styles.css" "--bg-dark"
require_contains "site/styles.css" ".hero-title"
require_contains "site/styles.css" ".team-showcase"
require_contains "site/styles.css" "@media (prefers-reduced-motion: reduce)"
require_contains "site/styles.css" "position: sticky"
require_not_contains "site/styles.css" "Iowan Old Style"

require_contains "site/main.js" "IntersectionObserver"
require_contains "site/main.js" "prefers-reduced-motion: reduce"
require_contains "site/main.js" "is-visible"
require_contains "site/main.js" "hero-ready"

require_contains ".github/workflows/ci.yml" "docker compose config"
require_contains ".github/workflows/ci.yml" "docker build"

echo "Project structure and content checks passed."
