
# Continuous Publishing Engine Generator

A GitHub Action to automate podcast and blog feed generation using a reusable Python generator.  
This repository contains the generator action that can be called from multiple repositories, ensuring consistent feed updates across projects.

---

## Features

- Generate podcast or blog feeds from YAML/JSON input.
- Reusable across multiple repositories.
- Built with Python and Docker for consistent environments.
- Automates commit and push of generated feed files.

---

## Getting Started

### Prerequisites

- GitHub repository where you want to use this generator.
- Python 3.x installed locally (for testing locally, optional).
- GitHub Actions enabled on your repository.

### Usage

In your target repository:

1. Create a workflow in `.github/workflows/update-feed.yml`.
2. Add the following snippet:

```yaml
name: Update Blog Feed

on:
  push:
    branches:
      - main
    paths:
      - "feed.yaml"
      - "feed.yml"
      - "posts/**"

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3

      - name: Run Feed Generator
        uses: AnjaliiThakur/continuous-publishing-engine-generator@main
        with:
          email: ${{ github.actor }}@localhost
          name: ${{ github.actor }}
