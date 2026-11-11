# Synton Ham Radio Guide

This repo is an [Obsidian](https://obsidian.md) vault **and** a [Quartz 5](https://quartz.jzhao.xyz) site,
published to <https://synton-w9yh.github.io>.

- **Write**: open this folder as a vault in Obsidian. Every `.md` file is a page. **See [CONTRIBUTING.md](CONTRIBUTING.md)** for how to add pages, link them, and use the page template in `templates/`.
- **Publish**: push. `.github/workflows/deploy.yml` builds every push and deploys pushes to `main` to GitHub Pages.
- **Configure the site**: edit `quartz.config.yaml` (title, theme, plugins, `ignorePatterns`).
- **Hide notes**: put them in `private/` (or add a pattern to `ignorePatterns`), or set `draft: true` in frontmatter.
- **Preview locally** (needs Node 22+ and npm): `scripts/build.sh --serve`, then open http://localhost:8080.

The Quartz framework is not committed. `scripts/build.sh` fetches the pinned version
(`QUARTZ_VERSION`, currently `v5.1.0`) into `.quartz-build/` (ignored by git), so to upgrade Quartz you just bump that version.
