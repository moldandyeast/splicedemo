#!/usr/bin/env sh
# Rebuilds the subset webfonts inlined in public/index.html.
# Source: Google Fonts repo (github.com/google/fonts), SIL OFL 1.1 (see OFL-IBM-Plex-Mono.txt).
# Codepoints = ASCII printable (the cart editor is set in this face) plus every other character in the page:
# · × – — … ← ↑ → ↓ −
set -e
cd "$(dirname "$0")"
U='U+0020-007E,U+00B7,U+00D7,U+2013,U+2014,U+2026,U+2190,U+2191,U+2192,U+2193,U+2212'
for w in Regular SemiBold; do
  curl -sSL -o IBMPlexMono-$w.ttf "https://raw.githubusercontent.com/google/fonts/main/ofl/ibmplexmono/IBMPlexMono-$w.ttf"
  python3 -m fontTools.subset IBMPlexMono-$w.ttf --unicodes="$U" --flavor=woff2 --layout-features='*' --no-hinting --output-file=IBMPlexMono-$w-subset.woff2
done
for f in *.woff2; do echo "$f: $(base64 -i "$f" | wc -c) bytes base64"; done
