# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Static HTML personal website hosted on GitHub Pages (`aozgaa.github.io`). All pages are hand-authored HTML with inline CSS — no build system, no templates, no JavaScript frameworks.

## Structure

- `index.html` — homepage (two-column layout: left labels, right content)
- `blog/` — blog posts as individual `.html` files; `blog/index.html` is the index
- `library/index.html` — book reading list (gitignored, likely generated or manually maintained)
- `links/index.html`, `course_notes/index.html` — other hand-written sections
- `content/` — static files (PDFs, GPG key)
- `img/` — images

## Conventions

- Pages use inline `<style>` blocks rather than external stylesheets
- Math rendering uses KaTeX loaded from CDN (see `blog/procedural_vs_declarative.html` for the standard snippet)
- Blog post filenames use `snake_case`; the blog index (`blog/index.html`) is updated manually when adding a new post
- Dates in the blog index use `yyyymmdd` format

## Notes

- `library/index.html` is listed in `.gitignore` — do not commit it
- The `.pixi/` directory contains `pandoc` and `hugo` binaries but there is no `pixi.toml` or active build pipeline; these tools are available if needed for local authoring
- `layouts/_default/partials/` exists but is empty
