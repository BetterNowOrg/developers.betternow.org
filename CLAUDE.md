# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the BetterNow API Developer Documentation site (`developers.betternow.org`), a static documentation site that uses **schema-driven documentation generation**. API documentation is automatically generated from YAML schema definitions using PRMD, then combined with custom content and built into a static site using Middleman.

## Development Commands

### Local Development
```bash
# Start local development server with live reload
docker compose up

# Access at http://localhost:4567 or http://bndocs.test (if puma-dev configured)

# Build inside running container
docker compose exec web bin/build
```

### Build Process
```bash
# Full build (schema compilation → docs generation → static site)
bin/build

# Or step by step:
bundle exec rake schema:combine    # Combine YAML schemas → source/schema.json
bundle exec rake schema:verify     # Validate compiled schema
bundle exec rake schema:doc        # Generate source/includes/resources.md
bundle exec middleman build        # Build static site → build/
```

### Rake Tasks
```bash
rake                              # Default: combine, verify, doc
rake schema:combine               # Combine schema YAML files into source/schema.json
rake schema:verify                # Validate the compiled schema
rake schema:doc                   # Generate Markdown docs from schema
```

### Deployment
- Automatic deployment via GitHub Actions on push to master branch
- Deploys to AWS S3 using OIDC authentication (no hardcoded credentials)
- Manual deploy: `bin/deploy` (requires AWS credentials)

## Architecture

### Schema-Driven Documentation Flow
```
schema/schemata/*.yml → [rake schema:combine] → source/schema.json
                                                      ↓
                                        [rake schema:doc]
                                                      ↓
source/index.html.md + source/includes/resources.md → [middleman build] → build/
```

### Key Directories

- **`schema/schemata/`** - YAML schema definitions for each API resource (16 total resources)
  - `common.yml` - Shared field definitions referenced by other schemas
  - Individual resource schemas: `fundraiser.yml`, `donation.yml`, `person.yml`, etc.
- **`schema/meta.json`** - Schema metadata (API title, URL, description)
- **`schema/preface.md`** - Content prepended to generated API docs
- **`source/index.html.md`** - Main landing page (YAML frontmatter + Markdown)
- **`source/includes/`** - Markdown sections included in final docs
  - `resources.md` - Generated API reference (DO NOT EDIT DIRECTLY)
  - `webhooks.md` - Webhook documentation (manually maintained)
- **`source/schema.json`** - Compiled schema (generated, DO NOT EDIT)

### Important Build Patterns

1. **Generated Files** - These are auto-generated and should NOT be edited directly:
   - `source/schema.json` (from `rake schema:combine`)
   - `source/includes/resources.md` (from `rake schema:doc`)

2. **To Modify API Documentation**:
   - Edit YAML files in `schema/schemata/`
   - Run `bin/build` to regenerate docs
   - The build process validates schemas automatically

3. **To Modify Landing Page or Static Content**:
   - Edit `source/index.html.md` for main page
   - Edit `source/includes/webhooks.md` for webhook docs
   - Run `middleman build` or full `bin/build`

4. **Schema References**:
   - Common fields defined in `schema/schemata/common.yml` are referenced via `$ref`
   - PRMD automatically resolves these references during `schema:combine`

## Technology Stack

- **Ruby 2.7.6** - Runtime (managed via Docker)
- **Middleman** - Static site generator
- **PRMD v0.12.0** - JSON Schema to Markdown converter for API docs
- **Redcarpet** - Markdown processor with table/code block support
- **Rouge** - Syntax highlighting (via `middleman-syntax`)
- **Docker/Docker Compose** - Local development environment

## API Specifications

- **Base URL**: `https://api.betternow.org`
- **HTTP Header**: `Accept: application/vnd.betternow+json; version=1`
- **Authentication**: Publishable (read-only) and Secret (write) API keys

## CI/CD

GitHub Actions workflow (`.github/workflows/publish.yml`) automatically:
1. Builds the site on push to master
2. Deploys to AWS S3 bucket
3. Uses AWS OIDC for secure authentication
