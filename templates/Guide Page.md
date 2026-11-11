---
title: "{{title}}"
description: One sentence summary shown in link previews and search results.
tags:
  - topic/example
date: "{{date}}"
aliases: []
draft: true
---

<!--
HOW TO USE THIS TEMPLATE
1. In Obsidian: create a new note, give it a good file name (it becomes the URL),
   then run "Templates: Insert template" from the command palette (Ctrl/Cmd+P) and pick "Guide Page".
   Or just copy this file's contents into a new note in the right folder.
2. Fill in the frontmatter above:
   - title: what readers see. Defaults to the file name if removed.
   - description: one short sentence.
   - tags: lowercase, use "/" for hierarchy (e.g. band/2m, mode/ft8, license/technician).
   - aliases: other names for this page, e.g. [Two Meter Band, 2 meters]. Old URLs listed here redirect.
   - draft: true hides the page from the site. Change to false (or delete the line) to publish it.
3. Replace the example sections below and delete this comment.
   (HTML comments like this one are not shown on the site.)
-->

> [!summary] In short
> Two or three sentences that tell a new ham what this page covers and why it matters.

## Overview

Explain the topic in plain language. Link to other pages with wikilinks using the
**file name** of the note, e.g. [[index]], or with custom text: [[index|the home page]].
Link to a section of a page with `#`: [[index#Ham Radio Guide|home page heading]].

## Key facts

| Item          | Value               |
| ------------- | ------------------- |
| Frequency     | 144.000–148.000 MHz |
| License class | Technician and up   |
| Common modes  | FM, SSB, digital    |

## How to

1. First step.
2. Second step.
3. Third step.

> [!tip]
> Callouts work just like in Obsidian: `[!note]`, `[!tip]`, `[!warning]`, `[!danger]`, `[!question]`, `[!example]`.

> [!warning] Safety / legal
> Put anything about RF exposure, power limits or FCC Part 97 rules in a warning callout.

## Images

Put images in the `attachments/` folder (Obsidian does this automatically when you paste one)
and embed them with `![[file-name.png]]`, or with a width: `![[file-name.png|400]]`.

## See also

- [[index|Home]]
- External link: [ARRL](https://www.arrl.org)
