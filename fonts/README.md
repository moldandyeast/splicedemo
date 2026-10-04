# Fonts

`public/index.html` inlines one webfont as base64 woff2 so the page makes no third-party requests:

- **IBM Plex Mono** 400 / 600 — Copyright 2017 IBM Corp., Reserved Font Name "Plex", SIL Open Font License 1.1. See `OFL-IBM-Plex-Mono.txt`.

Both weights are subset to the codepoints the page uses: ASCII printable (the cart editor is set in this face, so anything you can type on a plain keyboard is covered) plus `· × – — … ← ↑ → ↓ −`. Run `./subset.sh` (needs `python3` with `fonttools` and `brotli`) to rebuild them from the Google Fonts repo.

Everything else on the page is set in the system's Arial / Helvetica, which is not a webfont and loads nothing.
