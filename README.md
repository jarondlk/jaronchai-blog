# Jaronchai Blog

Personal portfolio and writing archive for Jaronchai Dilokkalayakul, built with Jekyll and the Minima theme.

The site is intentionally content-driven: Markdown pages and posts provide the writing, Liquid templates assemble the homepage and archive views, and Sass partials provide the visual layer.

## Local Development

Use Ruby through rbenv. This repository pins Ruby in `.ruby-version`.

```sh
make install
make build
make serve
```

The Makefile uses `rbenv exec bundle` when rbenv is available, which keeps the project on the pinned Ruby even if the system `bundle` appears earlier in `PATH`.

The preview server defaults to <http://127.0.0.1:4001/> because port `4000` is often used by other local Jekyll projects. Override it when needed:

```sh
make serve PORT=4000
```

## Project Map

- `_config.yml`: site metadata, navigation, plugins, and global settings.
- `index.markdown`: homepage content and homepage-specific Liquid sections.
- `pages/`: standalone pages such as About, Now, Talks, Resume, Writings, and Metadata.
- `_posts/`: published writing posts, project writeups, and older archive entries kept in the main writing collection.
- `_data/talks.yml`: structured talk metadata used by the homepage and talks page.
- `_layouts/`: page, post, home, default, and tag layouts.
- `_includes/`: reusable Liquid fragments for navigation, footer, social links, featured posts, and project cards.
- `_sass/` and `assets/main.scss`: Minima overrides and site styling.
- `assets/`: images, PDFs, talks, documents, and static files.
- `tag/`: tag landing pages maintained as Markdown files.

## Notes For Future Updates

- Edit source files, not `_site/`; Jekyll regenerates `_site/` during builds.
- Keep generated folders such as `_site/` and `.jekyll-cache/` out of version control.
- Mark homepage-featured posts with `featured: true` in front matter.
- Mark selected work with `project: true` or `featured: true` in front matter.
- Add or update talk entries in `_data/talks.yml`.
