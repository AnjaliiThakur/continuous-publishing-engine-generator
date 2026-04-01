# 🚀 Continuous Publishing Engine Generator

A reusable **CI/CD-driven publishing engine** that automates podcast and blog feed generation using a Python-based processing pipeline, packaged as a GitHub Action for cross-repository usage.

---

## 📖 Overview

This project provides a modular generator that can be integrated across multiple repositories to ensure **consistent and automated content publishing workflows**.  

It eliminates manual feed updates by transforming structured input data (YAML/JSON) into deployable feed formats.

---

## ✨ Key Features

- Automated generation of blog and podcast feeds from YAML/JSON inputs  
- Reusable GitHub Action for **cross-repository integration**  
- Docker-based execution for **environment consistency**  
- Automatic commit and push of generated outputs  
- Scalable and modular architecture for reusable workflows  

---

## 🏗️ Architecture

- **Python** → Core processing and transformation logic  
- **Docker** → Containerized execution  
- **GitHub Actions** → CI/CD orchestration  
- **YAML / JSON** → Input configuration  

---


---

## ⚙️ Usage

Create a workflow in your repository:

`.github/workflows/update-feed.yml`

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
