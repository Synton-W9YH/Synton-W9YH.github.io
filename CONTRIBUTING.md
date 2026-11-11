# Contributing to the Ham Radio Guide

This repo is an [Obsidian](https://obsidian.md) vault. Every Markdown note in it is published to
<https://synton-w9yh.github.io> by [Quartz](https://quartz.jzhao.xyz) when it's pushed to `main`.

## 1. Get set up

1. Get push access to the repo from a maintainer (or fork it and open pull requests).
2. Clone it with SSH:
   ```sh
   git clone git@github.com:Synton-W9YH/Synton-W9YH.github.io.git
   ```
3. In Obsidian, choose **Open folder as vault** and pick the cloned folder.
   The vault settings (link format, attachments folder, templates) are in `.obsidian/` and load automatically.
   Don't change **Settings → Files and links** unless everyone agrees (see [Linking](#3-link-pages-together)).
4. Optional: install the community plugin **Obsidian Git** to commit, pull and push from inside Obsidian.

## 2. Add a page

1. Create a new note in the folder where it belongs (see [Folders](#folders-and-urls)).
2. Name the file what the page is about, e.g. `Two Meter Band.md`. **The file name becomes the URL and is what other pages link to.**
3. Open the command palette (`Ctrl/Cmd + P`) → **Templates: Insert template** → **Guide Page**.
   (Or copy the contents of [`templates/Guide Page.md`](templates/Guide%20Page.md) into the note.)
4. Fill in the frontmatter and write the page. Remove `draft: true` when it's ready to go live.
5. Link the new page from at least one existing page (a folder `index.md` or a related page) so readers can find it.
6. Commit and push to `main`. The site updates about 1–2 minutes later.
   You can watch progress under the repo's **Actions** tab. A red ✗ means the build failed and the site wasn't changed.

## 3. Link pages together

Use Obsidian **wikilinks**. The vault is set to the "shortest path" link format, which is the same format Quartz uses.

| You write                       | Result                                                  |
| ------------------------------- | ------------------------------------------------------- |
| `[[Two Meter Band]]`            | Link to `Two Meter Band.md`, wherever it is in the vault |
| `[[Two Meter Band\|2m]]`        | Same link, but the text reads "2m"                      |
| `[[Two Meter Band#Repeaters]]`  | Link to the "Repeaters" heading on that page            |
| `[[Antennas/]]`                 | Link to the listing page for the `Antennas` folder      |
| `[[tags/band/2m]]`              | Link to the page listing every note tagged `band/2m`    |
| `![[dipole.png]]`               | Show an image (from `attachments/`)                     |
| `![[dipole.png\|400]]`          | Show an image 400px wide                                |
| `![[Two Meter Band#Repeaters]]` | Embed that section of another page                      |
| `[ARRL](https://www.arrl.org)`  | External link                                           |

(In a table the `|` has to be written `\|`. Everywhere else just type `|`.)

Rules that keep links working:

- **Link to the file name, not the title.** `[[Two Meter Band]]` works even if the page's `title:` is "The 2m Band".
- **Rename and move notes inside Obsidian**, never in your file manager. Obsidian then updates every link to them automatically.
- **Give every note a unique file name.** If two notes are both called `Overview.md`, short links become ambiguous. Use something like `Antennas Overview.md` instead.
- **Avoid these characters in file names:** `# ^ [ ] | \ / : ? % &`. Spaces are fine and become `-` in the URL.
- A link to a page that doesn't exist yet is fine. Obsidian shows it as faded, and the site still builds. It's a handy way to mark pages someone should write.
- If you rename a page that's already published, add its old name to `aliases:` so old URLs keep working.

## 4. Frontmatter (page properties)

The block between `---` lines at the top of a note. In Obsidian it shows as **Properties**.

```yaml
---
title: The 2m Band            # shown on the page; defaults to the file name
description: One-line summary  # used in link previews and search
tags:
  - band/2m                    # lowercase; "/" makes a hierarchy
aliases:
  - 2 meters                   # other names; also redirects old URLs
date: 2026-11-10               # YYYY-MM-DD
draft: true                    # hide from the site until ready
---
```

It has to be valid YAML or **the whole site build fails**. Common mistakes:

- A `:` inside a value. Wrap the value in quotes: `title: "Repeaters: How They Work"`.
- Tabs for indentation. Use spaces.
- Putting `#` in front of tags in frontmatter (`- #band/2m`). Write just `- band/2m`. Inline tags in the text *do* use `#`, like `#band/2m`.

## 5. Formatting

Anything Obsidian renders, the site renders too:

- Headings (`##`, `###`). Use only one `#` heading or none: the title is shown automatically.
- Callouts: `> [!tip]`, `> [!warning]`, `> [!note] Custom title`
- Tables, task lists `- [ ]`, footnotes `[^1]`, code blocks, `==highlights==`
- Math with `$...$` / `$$...$$`, and Mermaid diagrams in a ` ```mermaid ` code block

## Folders and URLs

- A note's URL comes from its folder and file name. `Antennas/Half Wave Dipole.md` → `/antennas/half-wave-dipole`.
- Every folder gets an automatic listing page. To add an intro to it, create `index.md` inside that folder with a `title:` and some text.
- `index.md` at the root of the repo is the home page.
- Images and other files go in `attachments/`. Obsidian puts pasted images there automatically. Commit them along with the note.
- **Not published:** `templates/`, `private/`, any note with `draft: true`, and repo files like this one.
  Use `private/` for personal scratch notes. They're still committed and visible on GitHub, so never put secrets there.
- Don't create a top-level folder called `tags/` except to add descriptions to tag pages (`tags/band/2m.md`).

## 6. Preview before pushing (optional)

With Node.js 22+ and npm installed:

```sh
scripts/build.sh --serve
```

Then open <http://localhost:8080>. This uses the same build as the live site, so if it works here it will deploy.

## Checklist before you push

- [ ] File name is descriptive and unique, with no special characters
- [ ] Frontmatter is valid (Obsidian's Properties view shows it without errors)
- [ ] `draft: true` removed if the page should be live
- [ ] The page is linked from at least one other page
- [ ] Images are in `attachments/` and committed
- [ ] Facts (frequencies, power limits, rules) checked against a reliable source
