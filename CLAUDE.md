# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal website on GitHub Pages (`aozgaa.github.io`). Static files served directly — no CI, no server-side build, no
JavaScript frameworks.

- Blog posts: authored in AsciiDoc (`blog/*.adoc`), compiled by `asciidoctor` via the `Makefile`. Generated
  `blog/*.html` is **committed**, because Pages serves it as-is.
- Everything else (`index.html`, `links/`, `course_notes/`, `library/`): hand-written HTML, inline `<style>`, no build.

`README.md` has the dependency list, install commands, and build/serve/watch workflow.

## Structure

- `index.html` — homepage (two-column layout: left labels, right content)
- `blog/*.adoc` — post sources; `blog/*.html` — generated output, committed
- `blog/index.html` — hand-maintained index table; `blog/docinfo.html` — shared docinfo (KaTeX CSS + body styles)
- `library/index.html`, `links/index.html`, `course_notes/index.html` — hand-written sections
- `content/` — static files (PDFs, GPG key); `img/` — images
- `scripts/{build,watch,serve}.sh` — build, rebuild-on-save, local preview; `Makefile` — incremental `.adoc` → `.html`

## Conventions

- Post filenames use `snake_case`; headers set `:title: <Title> | Arthur Ozga`, `:author:`, `:revdate: yyyy-mm-dd`,
  `:docinfo: shared`
- `blog/index.html` is updated **manually** when adding a post; newest first, date as `yyyymmdd`
- Math (`stem:` macros, via `asciidoctor-katex`) and code highlighting (`rouge`, `github` style) render at build time —
  no client-side JS; only the KaTeX stylesheet comes from a CDN
- `.md` files are formatted by `flowmark` at 120 columns via a pre-commit hook

## Notes

- **Always rebuild and commit the generated `.html` after editing an `.adoc`** — the published site has no build step
- Ruby 2.7+ required (rouge 4’s floor), 3.4.x recommended; p620 runs 3.2.3, which is EOL as of 2026-04-01
- Pin the same **gem** versions across machines — rouge’s theme CSS is baked into the committed HTML
- macOS system ruby is 2.6, below that floor, so it falls back to rouge 3.x — whose theme CSS differs, churning every
  rebuilt post with code blocks.
  Use a MacPorts ruby (`sudo port install ruby34`) instead.
- The scripts add this machine’s user gem dir to `PATH`; the Makefile’s `ASCIIDOCTOR` can be overridden
- `library/index.html` is tracked in git (it was previously gitignored; it no longer is)
